CREATE TABLE [dbo].[Pismo_XML] (
    [IDPisma]      INT            NOT NULL,
    [DaneXML]      NVARCHAR (MAX) NULL,
    [xDaneXML]     XML            NULL,
    [DataDanych]   DATETIME       NULL,
    [DataArch]     DATETIME       NOT NULL,
    [ID_Pismo_xml] INT            IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_Pismo_xml] PRIMARY KEY NONCLUSTERED ([ID_Pismo_xml] ASC, [DataArch] ASC) WITH (FILLFACTOR = 90) ON [FG_ZEF2]
) ON [FG_ZEF2] TEXTIMAGE_ON [FG_ZEF2];

