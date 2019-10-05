CREATE TABLE [zef2].[Pismo_XML_Historia] (
    [IDPismaXML_Historia]           BIGINT         NOT NULL,
    [DataOd]                        DATETIME       NULL,
    [DataDo]                        DATETIME       NULL,
    [PoprzednieIDPismaXML_Historia] BIGINT         NULL,
    [IDPisma]                       INT            NULL,
    [DaneXML]                       NVARCHAR (MAX) NULL,
    [xDaneXML]                      XML            NULL,
    [DataDanych]                    DATETIME       NULL,
    [DataArch]                      DATETIME       NOT NULL,
    [operacja]                      NVARCHAR (1)   NULL,
    CONSTRAINT [PK_Pismo_xml_Historia] PRIMARY KEY CLUSTERED ([IDPismaXML_Historia] ASC, [DataArch] ASC) WITH (FILLFACTOR = 90)
);

