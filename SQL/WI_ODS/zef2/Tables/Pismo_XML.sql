CREATE TABLE [zef2].[Pismo_XML] (
    [IDPisma]                INT            NULL,
    [DaneXML]                NVARCHAR (MAX) NULL,
    [xDaneXML]               XML            NULL,
    [DataDanych]             DATETIME       NULL,
    [DataArch]               DATETIME       NOT NULL,
    [ID_Pismo_xml]           INT            NOT NULL,
    [ProcName]               NVARCHAR (50)  NOT NULL,
    [uid]                    NVARCHAR (500) NULL,
    [DataZlozeniaDeklaracji] NVARCHAR (200) NULL,
    CONSTRAINT [PK_Pismo_xml] PRIMARY KEY CLUSTERED ([ID_Pismo_xml] ASC, [DataArch] ASC, [ProcName] ASC) ON [FG_ZEF2]
) TEXTIMAGE_ON [FG_ZEF2];


GO
ALTER TABLE [zef2].[Pismo_XML] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);


GO
CREATE NONCLUSTERED INDEX [IDPisma]
    ON [zef2].[Pismo_XML]([IDPisma] ASC)
    ON [FG_ZEF2];


GO
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20160509-130148]
    ON [zef2].[Pismo_XML]([ID_Pismo_xml] ASC)
    ON [FG_ZEF2];

