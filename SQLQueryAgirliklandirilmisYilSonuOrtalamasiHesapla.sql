Create View vAðýrlýklandýrýlmýþYýlSonuOrtalamasýHesapla
as


select * from Ders
--bu viewi kullanan son view öðrencinin aðýrlýklandýrýlmýþ not orltamasý bulan ders kredileri kullanýlacak


--select * from [dbo].[vAðýrlýklýDersNotuHesapla]
SELECT s.DersId, x.ÖðrenciId,
CASE WHEN SýnavTipi = 'vize1' THEN (Notu * 0.3) WHEN SýnavTipi = 'vize2' THEN (Notu * 0.3) ELSE (Notu * 0.4) END 
AS AðrýlýklýDersNotu
FROM     dbo.Sýnav AS s 
INNER JOIN
(SELECT ÖðrenciId, SýnavId, Notu FROM dbo.vSonuç2) AS x ON s.SýnavId = x.SýnavId order by ÖðrenciId



select v.ÖðrenciId, (Sum(DersKredisi*v.AðrýlýklýDersNotu)/6) as YýlSonuNotu 
from [dbo].[vAðýrlýklýDersNotuHesapla] v 
join Ders d on v.DersId = d.DersId 
group by v.ÖðrenciId order by v.ÖðrenciId


