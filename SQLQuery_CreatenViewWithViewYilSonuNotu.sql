Create View vAğırlıklandırılmışYılSonuOrtalamasıHesapla
as
select v.ÖğrenciId, (Sum(DersKredisi*v.AğrılıklıDersNotu)/Sum(DersKredisi
)) as YılSonuNotu 
from [dbo].[vAğırlıklıDersNotuHesapla] v 
join Ders d on v.DersId = d.DersId 
group by v.ÖğrenciId 

select * from vAğırlıklandırılmışYılSonuOrtalamasıHesapla
