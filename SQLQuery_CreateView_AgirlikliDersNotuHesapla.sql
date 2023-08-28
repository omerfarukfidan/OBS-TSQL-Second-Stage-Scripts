create view vAðýrlýklýDersNotuHesapla
as
select DersId,ÖðrenciId, CASE WHEN SýnavTipi = 'vize1' THEN (Notu*0.3) WHEN SýnavTipi = 'vize2' THEN (Notu*0.3) ELSE (Notu*0.4) END AS AðrýlýklýDersNotu
 from Sýnav s join (select * from [dbo].[vSonuç2])x on s.SýnavId = x.SýnavId 