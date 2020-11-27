--1- Kotas� limitsiz olan �r�nler hangileridir? ----Telco �emas� i�in
SELECT * FROM TELCO.product WHERE QUOTA = 'LIMITLESS'; 

--2- Stat�s� 'Initial' olan m��terileri bulunuz. ----Telco �emas� i�in
SELECT * FROM TELCO.customer WHERE STATUS = 'INITIAL'; 

--3-�ehir bilgisi 'ISTANBUL' olan adresleri bulunuz. ----Telco �emas� i�in
SELECT * FROM TELCO.address WHERE CITY LIKE 'Ist%'; 

--4-Birim fiyat� 150'den b�y�k olan order_itemlar� bulunuz. ----Sales �emas� i�in
SELECT* FROM SALES.order_�tems WHERE un�t_pr�ce > '150';

--5- ��e al�m tarihi May�s 2016 olan �al��anlar� bulunuz. ----Sales �emas� i�in
SELECT * FROM SALES.employees WHERE h�re_date between '01/05/2016' and '31/05/2016';

--6- Ad� Charlie ya da Charlsie olan contactlar� bulunuz. ----Sales �emas� i�in
SELECT * FROM SALES.contacts where f�rst_name = 'Charlie' or f�rst_name = 'Charlsie';

--7-Y�l�n 4. aylar�nda en �ok hangi ama�la kredi �ekilmi?tir? ----Banking �emas� i�in
--8- Adet say�s� 10dan b�y�k 50den k���k envanterleri bulunuz. ----Sales �emas� i�in
SELECT * FROM SALES.�nventor�es where quant�ty between 10 and 50;

--9- Birincil ileti�im bilgisi olmayan telefon numaralar�n� bulunuz. ----Telco �emas� i�in
SELECT * FROM TELCO.contact WHERE cnt_type = 'PHONE' AND  �s_pr�mary = '0'; 

--10- Bir sipari�te toplam 100.0000'den fazla �cret �deyen emirler nedir? ----Sales �emas� i�in
--11- Bankan�n 50 ve ya 51 ya��nda kad�n m��terilerinden ayn� isme sahip olan m��terisi/m��terileri var m�? Varsa isimleri neler?----Banking �emas� i�in
--12- Hesap �deme �ekli nakit olmayan hesaplar hangileridir? ----Telco �emas� i�in
SELECT * FROM TELCO.account WHERE payment_type <> 'CASH';

--13- Stat�s� deaktif olan m��terilerin ba�lant� kesim tarihleri nedir? ----Telco �emas� i�in
SELECT d�sconnect�on_date FROM TELCO.customer WHERE STATUS = 'DEACTIVE';

--14- Manager'� olmayan �al��anlar hangileridir? ----Sales �emas� i�in
SELECT * FROM SALES.employees where manager_�d is null;

--15- State bilgisi bo� olan lokasyonlar� bulunuz.----Sales �emas� i�in
SELECT * FROM SALES.locat�ons WHERE STATE is null ;

--16- Hesap kapan�� tarihi dolu olan hesaplar� bulunuz. ----Telco �emas� i�in
SELECT * FROM TELCO.account where account_clos�ng_date is not null ;

--17- Elektronik fatura mail adresi (E_bill_email) olan hesaplar hangileridir? ----Telco �emas� i�in
SELECT * FROM TELCO.account where e_b�ll_ema�l is not null ; 

--18- Durumu iptal olan ve sat�c�lar� olmayan emirler hangileridir? ----Sales �emas� i�in
SELECT * FROM SALES.orders WHERE STATUS ='Canceled' and SALESMAN_ID is null ;

--19- S�zle�me biti� tarihi 1 Ocak 2000'den b�y�k , 1 Ocak 2005'ten k���k olan s�zle�meleri bulunuz. ----Telco �emas� i�in
SELECT * FROM TELCO.agreement WHERE comm�tment_end_date >= '01/01/2000' AND comm�tment_end_date <= '01/01/2005';

--20- Ocak 2016 ile Haziran 2016 aras�nda verilen sipari�ler hangileridir? ----Sales �emas� i�in
SELECT * FROM SALES.orders  WHERE order_date BETWEEN '01/01/2016' AND '30/06/2016';

--21- 2005 y�l�ndan �nce yap�lan ve hala aktif olan subscriptionlar hangileridir? ----Telco �emas� i�in
SELECT * FROM TELCO.subscr�pt�on WHERE act�vat�on_date < '01/01/2005' AND STATUS = 'ACTIVE';

--22- S�zle�me ba�lang�� tarihi Ocak 2010'dan b�y�k olan s�zle�meleri bulunuz. ----Telco �emas� i�in
SELECT * FROM TELCO.agreement WHERE comm�tment_start_date > '01/01/2010';

--23- �smi E ile ba�layan m��terileri bulunuz. ----Telco �emas� i�in
SELECT * FROM TELCO.customer where name LIKE 'E%';

--24- Product tipi 'DSL' ile biten �r�nleri bulunuz. ----Telco �emas� i�in
SELECT * FROM TELCO.product WHERE product_type LIKE '%DSL';

--25- Unvan� 'S' ile ba�lamayan �al��anlar� bulunuz. ----Sales �emas� i�in
SELECT * FROM SALES.employees WHERE job_t�tle NOT LIKE 'S%';

--26- Herhangi bir �e�it Intel Xeon �r�nler hangileridir? ----Sales �emas� i�in
SELECT * FROM SALES.products WHERE product_name LIKE '%Xeon%';

--27- �sminde ya da soyisminde '�' harfi ge�en m��teriler hangileridir? ----Telco �emas� i�in
SELECT * FROM TELCO.customer WHERE NAME LIKE '%�%' or SURNAME  l�ke '%�%';

--28- �smi 'C' ile ba�layan kontaklar hangileridir? Soyad�na g�re alfabetik s�ra ile s�ralayal�m. ----Sales �emas� i�in
SELECT * FROM SALES.contacts WHERE f�rst_name LIKE 'C%' ORDER BY 3 

--29- �r�n ad� 'Asus' ile ba�layan ve liste fiyat� standart �cretinden k���k olan �r�nleri bulunuz. ----Sales �emas� i�in
SELECT * FROM SALES.products WHERE product_name LIKE 'Asus%' and l�st_pr�ce < standard_cost;

--30- �lke kodu UK ve AU olan adresleri bulunuz.----Telco �emas� i�in
SELECT * FROM TELCO.address WHERE country_cd IN('UK','AU');

--31- 1,2,4,5 id'li kategorilerin bilgilerini bulunuz. ----Sales �emas� i�in
SELECT * FROM SALES.product_categor�es WHERE category_�d <> '3'

--32- Taahh�t s�resi 240 ve 120 ay olan b�t�n s�zle�meleri bulmak istiyoruz.----Telco �emas� i�in
SELECT * FROM TELCO.agreement WHERE comm�tment_durat�on IN ('120 MONTHS','240 MONTHS');

--33 Sipari� durumu 'Shipped'den farkl� olan m��terilerin bilgilerini bulunuz. ----Sales �emas� i�in
SELECT CUSTOMER_ID FROM SALES.orders WHERE status <> 'Shipped';

--34- Adet say�s� 100e e�it olan envanterlerin product bilgisini bulunuz. ----Sales �emas� i�in
SELECT PRODUCT_ID FROM SALES.�nventor�es WHERE quant�ty = '100';

--35- S�zle�me alt tipi MAIN olan ka� tane s�zle�me vard�r?----Telco �emas� i�in
SELECT COUNT(*) FROM TELCO.agreement WHERE subtype ='MAIN';

--36- Deaktif m��terilerin say�s�n� bulunuz.----Telco �emas� i�in
SELECT COUNT(*) FROM TELCO.customer WHERE STATUS = 'DEACTIVE';

--37- Beijing (8 numaral� warehouse)'da ka� farkl� envanter vard�r? ----Sales �emas� i�in
--38- �leti�im tipi olarak email ve statusu kullan�mda olan ka� m��teri var?----Telco �emas� i�in
SELECT COUNT(*) FROM TELCO.contact WHERE cnt_type = 'EMAIL' AND STATUS = 'USED' ;

--39- Liste fiyati 1000 ile 3000 arasinda olan ka� product var?----Sales �emas� i�in
SELECT COUNT (*) FROM SALES.products WHERE LIST_PRICE BETWEEN '1000' AND '3000';

--40-Hangi y�llarda ka� hesap a��lm��t�r?----Banking �emas� i�in
--41- ��lemlerin tiplerine g�re toplam say�lar�n�n b�y�kten k����e s�ralamas� nedir?----Banking �emas� i�in
--42- ��lemlerin tiplerine g�re toplam tutarlar�n�n b�y�kten k����e s�ralamas� nedir?----Banking �emas� i�in
