Create View vA��rl�kland�r�lm��Y�lSonuOrtalamas�Hesapla
as
select v.��renciId, (Sum(DersKredisi*v.A�r�l�kl�DersNotu)/Sum(DersKredisi
)) as Y�lSonuNotu 
from [dbo].[vA��rl�kl�DersNotuHesapla] v 
join Ders d on v.DersId = d.DersId 
group by v.��renciId 

select * from vA��rl�kland�r�lm��Y�lSonuOrtalamas�Hesapla
