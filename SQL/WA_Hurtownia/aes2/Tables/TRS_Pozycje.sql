CREATE TABLE [aes2].[TRS_Pozycje] (
    [Id]                               NUMERIC (19)    NOT NULL,
    [IdDokTRS]                         NUMERIC (19)    NULL,
    [NrPozycjiTranzytowej]             INT             NULL,
    [TypDeklaracjiPrzekazanyPrzezNCTS] NVARCHAR (5)    NULL,
    [KrajPochodzenia]                  NVARCHAR (2)    NULL,
    [KrajPochodzeniaPid]               INT             NULL,
    [KrajPrzeznaczenia]                NVARCHAR (2)    NULL,
    [KrajPrzeznaczeniaPid]             INT             NULL,
    [OpisTowaru]                       NVARCHAR (280)  NULL,
    [MasaNetto]                        NUMERIC (16, 6) NULL,
    [MasaBrutto]                       NUMERIC (16, 6) NULL,
    [KodTowarowy]                      NVARCHAR (10)   NULL,
    [KodTowarowyPid]                   INT             NULL,
    [Wersja]                           INT             NOT NULL,
    [MRNEksportowy]                    NVARCHAR (35)   NULL,
    CONSTRAINT [TRS_Pozycje$PK_TRS_Pozycje] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__TRS_Pozycje_IdDokTRS__TRS_Dokument_id] FOREIGN KEY ([IdDokTRS]) REFERENCES [aes2].[TRS_Dokument] ([Id])
);

