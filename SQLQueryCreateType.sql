USE [OBS]
GO

/****** Object:  UserDefinedTableType [dbo].[tOptik]    Script Date: 18.08.2023 11:15:12 ******/
DROP TYPE [dbo].[tOptik]
GO

/****** Object:  UserDefinedTableType [dbo].[tOptik]    Script Date: 18.08.2023 11:15:12 ******/
CREATE TYPE [dbo].[tOptik] AS TABLE(
	[S�navId] [int] NULL,
	[��renciId] [int] NULL,
	[SoruNo] [int] NULL,
	[Cevap] [varchar](1) NULL
)
GO

select * from ��renci


