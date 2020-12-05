CREATE TABLE MUSTERILER
(
Musteri_id  number PRIMARY KEY,
Ad nvarchar2(50) NOT NULL,
Soyad nvarchar2(50) NOT NULL,
Cinsiyet varchar2(1) NOT NULL,
Dogum_Tarih date NOT NULL,
Ehliyet_No varchar2(16) NOT NULL,
Email varchar2(50) NOT NULL,
TelNo varchar2(15) NULL
);


CREATE TABLE SUBELER
(
Sube_id number PRIMARY KEY,
Sube_Ad varchar2(50) NOT NULL,
Sube_Acilis_Tarih date,
Sube_Ulke varchar2(50) NOT NULL,
Sube_Sehir varchar2(50) NOT NULL,
Sube_Ilce varchar2(50) NOT NULL,
Sube_Semt varchar2(50),
PostaKod varchar2(20), 
Acik_Adres varchar2(100),
TelNo varchar2(15)
);




CREATE TABLE ULKELER
(
Ulke_id number PRIMARY KEY,
Ulke varchar2(50) NOT NULL
);



CREATE TABLE SEHIRLER
(
Sehir_id number PRIMARY KEY,
SehirUlke_id number,
Sehir varchar2(50) not null,

CONSTRAINT SEHIRLER_FK FOREIGN KEY(SehirUlke_id)
REFERENCES ULKELER(Ulke_id)
);



CREATE TABLE ILCELER
(
Ilce_id number PRIMARY KEY,
IlceSehir_id number, 
Ilce varchar2(50) not null,

CONSTRAINT ILCELER_FK FOREIGN KEY(IlceSehir_id)
REFERENCES SEHIRLER(Sehir_id)
);





CREATE TABLE SEMTLER
(
Semt_id number PRIMARY KEY,
SemtIlce_id number,  
Semt varchar2(50) not null,

CONSTRAINT SEMTLER_FK FOREIGN KEY(SemtIlce_id)
REFERENCES ILCELER(Ilce_id )
);




CREATE TABLE ADRESLER
(
Adres_id number PRIMARY KEY,
AdresMusteri_id number,  
AdresUlke_id number,
AdresSehir_id number,
AdresIlce_id number,
AdresSemt_id number,
PostaKod varchar2(20,
Acýk_Adres varchar2(500) not null,
Adres_Durum varchar2(15) not null,

CONSTRAINT ADRESLER_FK FOREIGN KEY(AdresMusteri_id)
REFERENCES MUSTERILER(Musteri_id),

CONSTRAINT ADRESLER2_FK FOREIGN KEY(AdresUlke_id)
REFERENCES ULKELER(Ulke_id),

CONSTRAINT ADRESLER3_FK FOREIGN KEY(AdresSehir_id)
REFERENCES SEHIRLER(Sehir_id),

CONSTRAINT ADRESLER4_FK FOREIGN KEY(AdresIlce_id)
REFERENCES ILCELER(Ilce_id),

CONSTRAINT ADRESLER5_FK FOREIGN KEY(AdresSemt_id )
REFERENCES SEMTLER(Semt_id)
);







CREATE TABLE ARAC_DURUMLAR(

Durum_id number PRIMARY KEY,
Durum varchar2(20) not null
);


CREATE TABLE ARAC_KATEGORILER
(
Kategori_id number PRIMARY KEY,
KategoriKod varchar2(1) NOT NULL,
Kategori varchar2(30) NOT NULL
);





CREATE TABLE ARAC_MARKALAR
(
Marka_id number PRIMARY KEY,
Marka_Kategori_id number,
Marka varchar2(50) not null,
Model varchar2(50) not null,

CONSTRAINT ARAC_MARKALAR_FK FOREIGN KEY(Marka_Kategori_id)
REFERENCES ARAC_KATEGORILER(Kategori_id)
);




CREATE TABLE ARACLAR
(
Arac_id number PRIMARY KEY,
PlakaNo varchar2(20) not null,
Arac_Kategori_id number,
Arac_Marka_id number,
Renk_ varchar2(30) not null,
Gunluk_Ucret number not null,
Arac_Durum_id number,

CONSTRAINT ARACLAR_FK FOREIGN KEY(Arac_Kategori_id)
REFERENCES ARAC_KATEGORILER(Kategori_id),

CONSTRAINT ARACLAR2_FK FOREIGN KEY(Arac_Marka_id)
REFERENCES ARAC_MARKALAR(Marka_id),

CONSTRAINT ARACLAR3_FK FOREIGN KEY(Arac_Durum_id)
REFERENCES ARAC_DURUMLAR(Durum_id)
);




CREATE TABLE KIRALAMA_BILGILERI
(
Kiralama_id number PRIMARY KEY,
Kiralama_Musteri_id number,
Kiralama_Arac_id number,
Kiralama_Sube_id number,
Kiralama_Tarihi date not null,
Teslim_Edilecek_Tarih date not null,
Arac_Gunluk_Ucret number not null,
Kiralama_Tutar number not null,
Kiralama_Sozlesme varchar2(500),

CONSTRAINT KIRALAMA_BILGILERI_FK FOREIGN KEY(Kiralama_Musteri_id)
REFERENCES MUSTERILER(Musteri_id),

CONSTRAINT KIRALAMA_BILGILERI2_FK FOREIGN KEY(Kiralama_Arac_id)
REFERENCES ARACLAR(Arac_id),

CONSTRAINT KIRALAMA_BILGILERI3_FK FOREIGN KEY(Kiralama_Sube_id)
REFERENCES SUBELER(Sube_id)

);





CREATE TABLE KIRALAMA_DETAYLAR
(
Detay_id number PRIMARY KEY,
Detay_Kiralama_id number,
Teslim_Edilen_Sube_id number,
Sozlesme_Teslim_Tarihi date not null, 
Gercek_Teslim_Tarihi date not null,
Gecikme_Suresi number not null,

CONSTRAINT KIRALAMA_DETAYLAR_FK FOREIGN KEY(Detay_Kiralama_id)
REFERENCES KIRALAMA_BILGILERI(Kiralama_id),

CONSTRAINT KIRALAMA_DETAYLAR2_FK FOREIGN KEY(Teslim_Edilen_Sube_id )
REFERENCES SUBELER(Sube_id )

);


CREATE TABLE ODEMELER
(
Odeme_id number PRIMARY KEY,
Odeme_Detay_id number,
Odeme_Tarihi date not null,
Odeme_Tipi varchar2(20),
Toplam_Tutar number not null,

CONSTRAINT ODEMELER_FK FOREIGN KEY(Odeme_Detay_id)
REFERENCES KIRALAMA_DETAYLAR(Detay_id)

);
