CREATE TABLE [fk].[Decyzja65] (
    [IdDok]                VARCHAR (30)    NOT NULL,
    [IdPodmiotu]           INT             NULL,
    [IdKomorki]            VARCHAR (20)    NULL,
    [IDRodzajuDokumentu]   CHAR (4)        NULL,
    [NumerDecyzji]         VARCHAR (30)    NULL,
    [DataDecyzji]          DATETIME        NULL,
    [OdsetkiZaplacone]     DECIMAL (38, 2) NULL,
    [Status]               CHAR (1)        NULL,
    [NumerDokumentuSprawy] VARCHAR (30)    NULL,
    CONSTRAINT [PK_DEC65] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_FK],
    CONSTRAINT [FK_Decyzja65_IdDokIdKomorkiIdPodmiotu_EwidencjaNaleznosci_IdDokIdPodmiotuIdKomorki] FOREIGN KEY ([IdDok], [IdPodmiotu], [IdKomorki]) REFERENCES [fk].[EwidencjaNaleznosci] ([IdDok], [IdPodmiotu], [IdKomorki]),
    CONSTRAINT [FK_Decyzja65_IdPodmiotuIdKomorki_Podmiot_IdPodmiotuIdKomorki] FOREIGN KEY ([IdPodmiotu], [IdKomorki]) REFERENCES [fk].[Podmiot] ([IdPodmiotu], [IdKomorki])
);

