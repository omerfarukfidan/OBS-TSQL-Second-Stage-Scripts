select * from Öðrenci
select * from ÖðrenciDers
select * from sýnav

select * from [dbo].[CevapAnahtarý]
select * from [dbo].[SýnavSonucu]
select * from [dbo].[Optik]

--ilk data table sýnavid sýnavdaki soru sayýsý
--ikinci datatableda sýnavid öðrencidi
--sonrasýnda sýnav adedince soru sayýsýna göre random soru üreteceðim

select SýnavId, SoruSayýsý from Sýnav --sýnavid ve sorusayýsýný getiren 

select SýnavId, o.ÖðrenciId from SINAV s 
join ÖðrenciDers o on s.DersId = o.DersId 
JOIN Öðrenci ö ON o.ÖðrenciId = ö.ÖðrenciId

create proc DBdenGetir
as 
begin
select SýnavId, SoruSayýsý from Sýnav

 select SýnavId, o.ÖðrenciId from SINAV s 
join ÖðrenciDers o on s.DersId = o.DersId 
JOIN Öðrenci ö ON o.ÖðrenciId = ö.ÖðrenciId
where s.SýnavId = 29
end

select * from Optik