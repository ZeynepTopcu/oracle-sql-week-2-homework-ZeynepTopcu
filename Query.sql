--1- Kotasý limitsiz olan ürünler hangileridir? ----Telco þemasý için
SELECT * FROM TELCO.product WHERE QUOTA = 'LIMITLESS'; 

--2- Statüsü 'Initial' olan müþterileri bulunuz. ----Telco þemasý için
SELECT * FROM TELCO.customer WHERE STATUS = 'INITIAL'; 

--3-Þehir bilgisi 'ISTANBUL' olan adresleri bulunuz. ----Telco þemasý için
SELECT * FROM TELCO.address WHERE CITY LIKE 'Ist%'; 

--4-Birim fiyatý 150'den büyük olan order_itemlarý bulunuz. ----Sales þemasý için
SELECT* FROM SALES.order_ýtems WHERE unýt_prýce > '150';

--5- Ýþe alým tarihi Mayýs 2016 olan çalýþanlarý bulunuz. ----Sales þemasý için
SELECT * FROM SALES.employees WHERE hýre_date between '01/05/2016' and '31/05/2016';

--6- Adý Charlie ya da Charlsie olan contactlarý bulunuz. ----Sales þemasý için
SELECT * FROM SALES.contacts where fýrst_name = 'Charlie' or fýrst_name = 'Charlsie';

--7-Yýlýn 4. aylarýnda en çok hangi amaçla kredi çekilmi?tir? ----Banking þemasý için
--8- Adet sayýsý 10dan büyük 50den küçük envanterleri bulunuz. ----Sales þemasý için
SELECT * FROM SALES.ýnventorýes where quantýty between 10 and 50;

--9- Birincil iletiþim bilgisi olmayan telefon numaralarýný bulunuz. ----Telco þemasý için
SELECT * FROM TELCO.contact WHERE cnt_type = 'PHONE' AND  ýs_prýmary = '0'; 

--10- Bir sipariþte toplam 100.0000'den fazla ücret ödeyen emirler nedir? ----Sales þemasý için
--11- Bankanýn 50 ve ya 51 yaþýnda kadýn müþterilerinden ayný isme sahip olan müþterisi/müþterileri var mý? Varsa isimleri neler?----Banking þemasý için
--12- Hesap ödeme þekli nakit olmayan hesaplar hangileridir? ----Telco þemasý için
SELECT * FROM TELCO.account WHERE payment_type <> 'CASH';

--13- Statüsü deaktif olan müþterilerin baðlantý kesim tarihleri nedir? ----Telco þemasý için
SELECT dýsconnectýon_date FROM TELCO.customer WHERE STATUS = 'DEACTIVE';

--14- Manager'ý olmayan çalýþanlar hangileridir? ----Sales þemasý için
SELECT * FROM SALES.employees where manager_ýd is null;

--15- State bilgisi boþ olan lokasyonlarý bulunuz.----Sales þemasý için
SELECT * FROM SALES.locatýons WHERE STATE is null ;

--16- Hesap kapanýþ tarihi dolu olan hesaplarý bulunuz. ----Telco þemasý için
SELECT * FROM TELCO.account where account_closýng_date is not null ;

--17- Elektronik fatura mail adresi (E_bill_email) olan hesaplar hangileridir? ----Telco þemasý için
SELECT * FROM TELCO.account where e_býll_emaýl is not null ; 

--18- Durumu iptal olan ve satýcýlarý olmayan emirler hangileridir? ----Sales þemasý için
SELECT * FROM SALES.orders WHERE STATUS ='Canceled' and SALESMAN_ID is null ;

--19- Sözleþme bitiþ tarihi 1 Ocak 2000'den büyük , 1 Ocak 2005'ten küçük olan sözleþmeleri bulunuz. ----Telco þemasý için
SELECT * FROM TELCO.agreement WHERE commýtment_end_date >= '01/01/2000' AND commýtment_end_date <= '01/01/2005';

--20- Ocak 2016 ile Haziran 2016 arasýnda verilen sipariþler hangileridir? ----Sales þemasý için
SELECT * FROM SALES.orders  WHERE order_date BETWEEN '01/01/2016' AND '30/06/2016';

--21- 2005 yýlýndan önce yapýlan ve hala aktif olan subscriptionlar hangileridir? ----Telco þemasý için
SELECT * FROM TELCO.subscrýptýon WHERE actývatýon_date < '01/01/2005' AND STATUS = 'ACTIVE';

--22- Sözleþme baþlangýç tarihi Ocak 2010'dan büyük olan sözleþmeleri bulunuz. ----Telco þemasý için
SELECT * FROM TELCO.agreement WHERE commýtment_start_date > '01/01/2010';

--23- Ýsmi E ile baþlayan müþterileri bulunuz. ----Telco þemasý için
SELECT * FROM TELCO.customer where name LIKE 'E%';

--24- Product tipi 'DSL' ile biten ürünleri bulunuz. ----Telco þemasý için
SELECT * FROM TELCO.product WHERE product_type LIKE '%DSL';

--25- Unvaný 'S' ile baþlamayan çalýþanlarý bulunuz. ----Sales þemasý için
SELECT * FROM SALES.employees WHERE job_týtle NOT LIKE 'S%';

--26- Herhangi bir çeþit Intel Xeon ürünler hangileridir? ----Sales þemasý için
SELECT * FROM SALES.products WHERE product_name LIKE '%Xeon%';

--27- Ýsminde ya da soyisminde 'ü' harfi geçen müþteriler hangileridir? ----Telco þemasý için
SELECT * FROM TELCO.customer WHERE NAME LIKE '%ü%' or SURNAME  lýke '%ü%';

--28- Ýsmi 'C' ile baþlayan kontaklar hangileridir? Soyadýna göre alfabetik sýra ile sýralayalým. ----Sales þemasý için
SELECT * FROM SALES.contacts WHERE fýrst_name LIKE 'C%' ORDER BY 3 

--29- Ürün adý 'Asus' ile baþlayan ve liste fiyatý standart ücretinden küçük olan ürünleri bulunuz. ----Sales þemasý için
SELECT * FROM SALES.products WHERE product_name LIKE 'Asus%' and lýst_prýce < standard_cost;

--30- Ülke kodu UK ve AU olan adresleri bulunuz.----Telco þemasý için
SELECT * FROM TELCO.address WHERE country_cd IN('UK','AU');

--31- 1,2,4,5 id'li kategorilerin bilgilerini bulunuz. ----Sales þemasý için
SELECT * FROM SALES.product_categorýes WHERE category_ýd <> '3'

--32- Taahhüt süresi 240 ve 120 ay olan bütün sözleþmeleri bulmak istiyoruz.----Telco þemasý için
SELECT * FROM TELCO.agreement WHERE commýtment_duratýon IN ('120 MONTHS','240 MONTHS');

--33 Sipariþ durumu 'Shipped'den farklý olan müþterilerin bilgilerini bulunuz. ----Sales þemasý için
SELECT CUSTOMER_ID FROM SALES.orders WHERE status <> 'Shipped';

--34- Adet sayýsý 100e eþit olan envanterlerin product bilgisini bulunuz. ----Sales þemasý için
SELECT PRODUCT_ID FROM SALES.ýnventorýes WHERE quantýty = '100';

--35- Sözleþme alt tipi MAIN olan kaç tane sözleþme vardýr?----Telco þemasý için
SELECT COUNT(*) FROM TELCO.agreement WHERE subtype ='MAIN';

--36- Deaktif müþterilerin sayýsýný bulunuz.----Telco þemasý için
SELECT COUNT(*) FROM TELCO.customer WHERE STATUS = 'DEACTIVE';

--37- Beijing (8 numaralý warehouse)'da kaç farklý envanter vardýr? ----Sales þemasý için
--38- Ýletiþim tipi olarak email ve statusu kullanýmda olan kaç müþteri var?----Telco þemasý için
SELECT COUNT(*) FROM TELCO.contact WHERE cnt_type = 'EMAIL' AND STATUS = 'USED' ;

--39- Liste fiyati 1000 ile 3000 arasinda olan kaç product var?----Sales þemasý için
SELECT COUNT (*) FROM SALES.products WHERE LIST_PRICE BETWEEN '1000' AND '3000';

--40-Hangi yýllarda kaç hesap açýlmýþtýr?----Banking þemasý için
--41- Ýþlemlerin tiplerine göre toplam sayýlarýnýn büyükten küçüðe sýralamasý nedir?----Banking þemasý için
--42- Ýþlemlerin tiplerine göre toplam tutarlarýnýn büyükten küçüðe sýralamasý nedir?----Banking þemasý için
