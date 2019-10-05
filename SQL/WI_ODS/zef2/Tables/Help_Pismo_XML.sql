CREATE TABLE [zef2].[Help_Pismo_XML] (
    [DataDanych]   DATETIME       NULL,
    [ID_Pismo_xml] INT            NOT NULL,
    [ProcName]     NVARCHAR (MAX) NOT NULL,
    [IsDelete]     NCHAR (1)      NOT NULL,
    [DeleteDate]   DATETIME       NULL,
    CONSTRAINT [PK_Help_Pismo_XML] PRIMARY KEY NONCLUSTERED ([ID_Pismo_xml] ASC) ON [FG_ZEF2]
) ON [FG_ZEF2] TEXTIMAGE_ON [FG_ZEF2];

