CREATE TABLE [aes2].[TRS_Dokument] (
    [Id]                               NUMERIC (19)  NOT NULL,
    [NumerWlasny]                      NVARCHAR (21) NULL,
    [DataPrzyjeciaZgloszeniaNCTS]      DATE          NULL,
    [Wersja]                           INT           NOT NULL,
    [Status]                           NCHAR (3)     NULL,
    [MRN]                              NVARCHAR (35) NULL,
    [TypDeklaracjiPrzekazanyPrzezNCTS] NVARCHAR (5)  NULL,
    CONSTRAINT [TRS_Dokument$PK_TRS_Dokument] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2]
);

