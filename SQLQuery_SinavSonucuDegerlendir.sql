--select * from Optik
--select * from Ders
/*
Select * from S�nav
select * from ��renci
select *from CevapAnahtar�
select * from CevapAnahtar� order by S�navId
select * from Optik

select * from S�navSonucu --��i Optik ve Cevap Anahtar�ndaki kar��la�t�rma sonucu olu�acak puan ile doldurulmal�
select * from ��renciDers --Buradaki Y�lSonuBa�ar�Notu S�navSonucu tablosundan ve S�navdaki kredilere g�re doldurulacak sonras�nda harf notu belirlenecek
*/



declare @i int, @�lkS�navId int, @SonS�nav int, @SoruSay�s� int, @t int = 1, @Puan int = 0, @��renciSay�s� int, @Anl�kNot int = 0, @MovingNot int = 0
select @i = Min(S�navId) from Optik 
select * from Optik where S�navId = @i
select @��renciSay�s� = Max(��renciId) from Optik
select @SonS�nav=Max(S�navId) from Optik

/*
drop table #tbl
SELECT distinct ��renciId
INTO #tbl
FROM Optik
select * from #tbl order by ��renciId
*/ --��renci idlerinin tutuldu�u bir tablo

while @i <= @SonS�nav
	begin
		select @SoruSay�s� = MAX(SoruNo) from CevapAnahtar� where S�navId= @i
		set @Anl�kNot = 0
		set @MovingNot = 0
		set @t = 1
		while @t <= @SoruSay�s�
			begin
				select @Anl�kNot = 1 from Optik o join CevapAnahtar� c on o.S�navId = c.S�navId  where o.SoruNo = @t AND o.S�navId = @i AND o.Cevap = c.Do�ruCevap	
				select @Anl�kNot = -0.25 from Optik o join CevapAnahtar� c on o.S�navId = c.S�navId  where o.SoruNo = @t AND o.S�navId = @i AND o.Cevap <> ' ' AND o.Cevap <> c.Do�ruCevap
				
				set @MovingNot = @MovingNot + @Anl�kNot
				set @t = @t + 1
			end
	
			update S�navSonucu set S�navSonucu = @MovingNot from S�navSonucu s join 
		(Select o.S�navId, o.��renciId from Optik o join CevapAnahtar� c on o.S�navId = c.S�navId  where o.SoruNo = @t AND o.S�navId = @i) as x on x.��renciId = s.��renciId

set @i = @i + 1
end
--select * from Optik o Join CevapAnahtar� c on o.

select * from S�navSonucu