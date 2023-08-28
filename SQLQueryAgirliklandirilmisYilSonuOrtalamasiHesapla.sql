Create View vA��rl�kland�r�lm��Y�lSonuOrtalamas�Hesapla
as


select * from Ders
--bu viewi kullanan son view ��rencinin a��rl�kland�r�lm�� not orltamas� bulan ders kredileri kullan�lacak


--select * from [dbo].[vA��rl�kl�DersNotuHesapla]
SELECT s.DersId, x.��renciId,
CASE WHEN S�navTipi = 'vize1' THEN (Notu * 0.3) WHEN S�navTipi = 'vize2' THEN (Notu * 0.3) ELSE (Notu * 0.4) END 
AS A�r�l�kl�DersNotu
FROM     dbo.S�nav AS s 
INNER JOIN
(SELECT ��renciId, S�navId, Notu FROM dbo.vSonu�2) AS x ON s.S�navId = x.S�navId order by ��renciId



select v.��renciId, (Sum(DersKredisi*v.A�r�l�kl�DersNotu)/6) as Y�lSonuNotu 
from [dbo].[vA��rl�kl�DersNotuHesapla] v 
join Ders d on v.DersId = d.DersId 
group by v.��renciId order by v.��renciId


