create view vA��rl�kl�DersNotuHesapla
as
select DersId,��renciId, CASE WHEN S�navTipi = 'vize1' THEN (Notu*0.3) WHEN S�navTipi = 'vize2' THEN (Notu*0.3) ELSE (Notu*0.4) END AS A�r�l�kl�DersNotu
 from S�nav s join (select * from [dbo].[vSonu�2])x on s.S�navId = x.S�navId 