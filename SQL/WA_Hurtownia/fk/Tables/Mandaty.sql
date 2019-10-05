CREATE TABLE [fk].[Mandaty] (
    [IdDok]                    VARCHAR (30) NOT NULL,
    [IdKomorki]                VARCHAR (20) NULL,
    [IdPodmiotu]               INT          NULL,
    [IdJednostki]              VARCHAR (20) NULL,
    [IdRodzajuDokumentu]       CHAR (4)     NULL,
    [Status]                   CHAR (1)     NULL,
    [DataKsiegowania]          DATETIME     NULL,
    [DataUkarania]             DATETIME     NULL,
    [DataWystawieniaDokumentu] DATETIME     NULL,
    [DataZamkniecia]           DATETIME     NULL,
    [RodzajMandatu]            CHAR (1)     NULL,
    [SymbolDokumentu]          VARCHAR (30) NULL,
    [TerminPlatnosci]          DATETIME     NULL,
    CONSTRAINT [PK_Mandaty] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_FK],
    CONSTRAINT [FK_Mandaty_IdPodmiotuIdKomorki_Podmiot_IdPodmiotuIdKomorki] FOREIGN KEY ([IdPodmiotu], [IdKomorki]) REFERENCES [fk].[Podmiot] ([IdPodmiotu], [IdKomorki])
);

