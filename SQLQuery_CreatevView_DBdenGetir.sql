select * from ��renci
select * from ��renciDers
select * from s�nav

select * from [dbo].[CevapAnahtar�]
select * from [dbo].[S�navSonucu]
select * from [dbo].[Optik]

--ilk data table s�navid s�navdaki soru say�s�
--ikinci datatableda s�navid ��rencidi
--sonras�nda s�nav adedince soru say�s�na g�re random soru �retece�im

select S�navId, SoruSay�s� from S�nav --s�navid ve sorusay�s�n� getiren 

select S�navId, o.��renciId from SINAV s 
join ��renciDers o on s.DersId = o.DersId 
JOIN ��renci � ON o.��renciId = �.��renciId

create proc DBdenGetir
as 
begin
select S�navId, SoruSay�s� from S�nav

 select S�navId, o.��renciId from SINAV s 
join ��renciDers o on s.DersId = o.DersId 
JOIN ��renci � ON o.��renciId = �.��renciId
where s.S�navId = 29
end

select * from Optik