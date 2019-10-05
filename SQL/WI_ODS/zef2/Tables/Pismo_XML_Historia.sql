CREATE TABLE [zef2].[Pismo_XML_Historia] (
    [IDPismaXML_Historia]           BIGINT   NOT NULL,
    [DataOd]                        DATETIME NULL,
    [DataDo]                        DATETIME NULL,
    [PoprzednieIDPismaXML_Historia] BIGINT   NULL,
    [IDPisma]                       INT      NOT NULL,
    [xDaneXML]                      XML      NULL,
    [DataDanych]                    DATETIME NULL,
    [DataArch]                      DATETIME DEFAULT ('9999-12-31 23:59:59.997') NOT NULL,
    CONSTRAINT [PK_Pismo_xml_Historia_NEW] PRIMARY KEY CLUSTERED ([IDPismaXML_Historia] ASC, [DataArch] ASC) WITH (FILLFACTOR = 90) ON [FG_ZEF2]
) TEXTIMAGE_ON [FG_ZEF2];


GO
ALTER TABLE [zef2].[Pismo_XML_Historia] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);

