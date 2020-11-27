----ARAÇ KÝRALAMA SÝSTEMÝ-------

--MUSTERILER TABLOSU--
CREATE TABLE MUSTERILER(

Musteri_id number not null,
Ad varchar2(100) not null,
Soyad varchar2(100) not null,
DogumTarih date,
Adres varchar2(500),
TelNo varchar2(15),

CONSTRAINT MUSTERILER_PK PRIMARY KEY(Musteri_id)

);

--ARACLAR TABLOSU--
CREATE TABLE ARACLAR(

Arac_id number not null,
PlakaNo varchar2(20) not null,
Marka varchar2(50) not null,
Model_ varchar2(50) not null,
Renk varchar2(50) not null,
KiraBedel number not null,

CONSTRAINT ARACLAR_PK PRIMARY KEY(Arac_id)

);

--KIRALAMA BÝLGÝLERÝ--
CREATE TABLE KIRA_BILGILERI(

Kira_id number not null, 
Kira_Musteri_id integer not null,
Kira_Arac_id integer not null,
Kiralama_Tarihi date not null,
Teslim_Tarihi date not null,
TeslimDurumu varchar2(20),

CONSTRAINT KIRA_BILGILERI_PK PRIMARY KEY(Kira_id),

CONSTRAINT KIRA_BILGILERI_FK FOREIGN KEY(Kira_Musteri_id)
REFERENCES MUSTERILER (musteri_id),

CONSTRAINT KIRA_BILGILERI2_FK FOREIGN KEY(Kira_Arac_id)
REFERENCES ARACLAR (Arac_id)

);


--INSERT SCRÝPTLERÝ--

INSERT INTO MUSTERILER(Musteri_id,Ad,Soyad,DogumTarih,Adres,TelNo) 
VALUES('1','Ayþe','Yýlmaz','12/01/1997','Ýstanbul','(512) 345-6789');

INSERT INTO MUSTERILER(Musteri_id,Ad,Soyad,DogumTarih,Adres,TelNo) 
VALUES('2','Ali','Özkan','13/02/1992','Samsun','(513) 256-8965');

INSERT INTO MUSTERILER(Musteri_id,Ad,Soyad,DogumTarih,Adres,TelNo) 
VALUES('3','Yusuf','Demir','24/05/1980','Isparta','(523) 653-9852)');

COMMIT;

INSERT INTO ARACLAR(Arac_id,PlakaNo,Marka,Model_,Renk,KiraBedel) 
VALUES(1,'06XX99','Volkswagen','Polo','Beyaz','300');

INSERT INTO ARACLAR(Arac_id,PlakaNo,Marka,Model_,Renk,KiraBedel) 
VALUES(2,'05YY12','Toyota','C-HR','Kýrmýzý','400');

INSERT INTO ARACLAR(Arac_id,PlakaNo,Marka,Model_,Renk,KiraBedel) 
VALUES(3,'34ZZ11','Ford','Fokus','Siyah','500');

COMMIT;

INSERT INTO KIRA_BILGILERI(Kira_id,Kira_Musteri_id,Kira_Arac_id,Kiralama_Tarihi,Teslim_Tarihi,TeslimDurumu) 
VALUES('1','1','2','12/04/2020','15/04/2020','Edildi');
INSERT INTO KIRA_BILGILERI(Kira_id,Kira_Musteri_id,Kira_Arac_id,Kiralama_Tarihi,Teslim_Tarihi,TeslimDurumu) 
VALUES('2','2','1','15/5/2020','18/05/2020','Edilmedi');
INSERT INTO KIRA_BILGILERI(Kira_id,Kira_Musteri_id,Kira_Arac_id,Kiralama_Tarihi,Teslim_Tarihi,TeslimDurumu) 
VALUES('3','3','3','19/06/2020','25/06/2020','Edilmedi');

COMMIT;

--SYNONYM--

CREATE SYNONYM KIRALAMA_MUSTERILER
FOR MUSTERILER;

--VÝEW--

CREATE VIEW MUSTERITAKIBI AS

(SELECT musteri_id,Kiralama_Tarihi,Teslim_Tarihi,TeslimDurumu
FROM KIRA_BILGILERI
JOIN MUSTERILER ON MUSTERILER.musterý_id = kýra_býlgýlerý.kýra_musterý_ýd)
;





