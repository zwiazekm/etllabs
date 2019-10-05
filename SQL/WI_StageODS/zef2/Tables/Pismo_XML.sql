CREATE TABLE [zef2].[Pismo_XML] (
    [IDPisma]                INT            NULL,
    [DaneXML]                NVARCHAR (MAX) NULL,
    [xDaneXML]               XML            NULL,
    [DataDanych]             DATETIME       NULL,
    [DataArch]               DATETIME       NOT NULL,
    [ID_Pismo_xml]           INT            NOT NULL,
    [operacja]               NVARCHAR (1)   NULL,
    [ProcName]               NVARCHAR (50)  NULL,
    [uid]                    NVARCHAR (500) NULL,
    [DataZlozeniaDeklaracji] NVARCHAR (200) NULL,
    CONSTRAINT [PK_Pismo_xml] PRIMARY KEY NONCLUSTERED ([ID_Pismo_xml] ASC, [DataArch] ASC)
);

