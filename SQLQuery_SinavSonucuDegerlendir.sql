--select * from Optik
--select * from Ders
/*
Select * from Sýnav
select * from Öðrenci
select *from CevapAnahtarý
select * from CevapAnahtarý order by SýnavId
select * from Optik

select * from SýnavSonucu --Ýçi Optik ve Cevap Anahtarýndaki karþýlaþtýrma sonucu oluþacak puan ile doldurulmalý
select * from ÖðrenciDers --Buradaki YýlSonuBaþarýNotu SýnavSonucu tablosundan ve Sýnavdaki kredilere göre doldurulacak sonrasýnda harf notu belirlenecek
*/



declare @i int, @ÝlkSýnavId int, @SonSýnav int, @SoruSayýsý int, @t int = 1, @Puan int = 0, @ÖðrenciSayýsý int, @AnlýkNot int = 0, @MovingNot int = 0
select @i = Min(SýnavId) from Optik 
select * from Optik where SýnavId = @i
select @ÖðrenciSayýsý = Max(ÖðrenciId) from Optik
select @SonSýnav=Max(SýnavId) from Optik

/*
drop table #tbl
SELECT distinct ÖðrenciId
INTO #tbl
FROM Optik
select * from #tbl order by ÖðrenciId
*/ --Öðrenci idlerinin tutulduðu bir tablo

while @i <= @SonSýnav
	begin
		select @SoruSayýsý = MAX(SoruNo) from CevapAnahtarý where SýnavId= @i
		set @AnlýkNot = 0
		set @MovingNot = 0
		set @t = 1
		while @t <= @SoruSayýsý
			begin
				select @AnlýkNot = 1 from Optik o join CevapAnahtarý c on o.SýnavId = c.SýnavId  where o.SoruNo = @t AND o.SýnavId = @i AND o.Cevap = c.DoðruCevap	
				select @AnlýkNot = -0.25 from Optik o join CevapAnahtarý c on o.SýnavId = c.SýnavId  where o.SoruNo = @t AND o.SýnavId = @i AND o.Cevap <> ' ' AND o.Cevap <> c.DoðruCevap
				
				set @MovingNot = @MovingNot + @AnlýkNot
				set @t = @t + 1
			end
	
			update SýnavSonucu set SýnavSonucu = @MovingNot from SýnavSonucu s join 
		(Select o.SýnavId, o.ÖðrenciId from Optik o join CevapAnahtarý c on o.SýnavId = c.SýnavId  where o.SoruNo = @t AND o.SýnavId = @i) as x on x.ÖðrenciId = s.ÖðrenciId

set @i = @i + 1
end
--select * from Optik o Join CevapAnahtarý c on o.

select * from SýnavSonucu