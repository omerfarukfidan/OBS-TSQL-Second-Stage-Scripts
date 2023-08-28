--SELECT * from [dbo].[Optik]
create procedure insertpeople   
@tbl tOptik READONLY
AS
begin 

		INSERT INTO Optik(SınavId,ÖğrenciId,SoruNo,Cevap)
		select t.*
		from @tbl t
		LEFT JOIN Optik o ON t.SınavId = o.SınavId AND t.ÖğrenciId = o.ÖğrenciId AND t.SoruNo = o.SoruNo
		where o.SınavId is null

		--delete from Optik
end

--select * from Optik

--select * from CevapAnahtarı
update CevapAnahtarı set SınavId = 123 where SınavId = 35


--set identity_insert sınav on
--insert into Sınav (DersId, SınavTipi, SoruSayısı) values(7, 'final', 41)
--set identity_insert sınav off
--select * from Öğrenci

CREATE VIEW vSınavSonucu  
AS
select o.*, DoğruCevap, case when Cevap = DoğruCevap then 1 when Cevap = ' ' then 0 else -0.25 end Puan 
from Optik o
INNER JOIN CevapAnahtarı c ON c.SınavId = o.SınavId AND c.SoruNo = o.SoruNo

CREATE VIEW vSonuç2   
AS
select ÖğrenciId, SınavId, SUM(Puan)Notu
from vSınavSonucu
group by ÖğrenciId, SınavId

select ÖğrenciId, AVG(Notu) 
from vSonuç2
group by ÖğrenciId

select * from öğrenci