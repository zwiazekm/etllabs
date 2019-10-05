CREATE TABLE [akc].[ZPNW_Dokument] (
    [IdDok]                            VARCHAR (30) NOT NULL,
    [IdKomorki]                        VARCHAR (20) NULL,
    [IdPodmiotu]                       INT          NULL,
    [RodzajDokumentu]                  CHAR (4)     NULL,
    [NumerDokumentu]                   VARCHAR (30) NULL,
    [IzbaCelnaZlozeniaDok]             VARCHAR (20) NULL,
    [MiejsceZlozeniaDok]               VARCHAR (20) NULL,
    [ZnacznikKorekty]                  SMALLINT     NULL,
    [Status]                           CHAR (1)     NULL,
    [DataRejestrDokWSyst]              DATETIME     NULL,
    [DataZamkniecia]                   DATE         NULL,
    [DataZlozeniaDok]                  DATE         NULL,
    [PrzewidywanaDataDostawy]          DATE         NULL,
    [CzyKorektaWewnetrzna]             BIT          NULL,
    [FormaZabezpieczenia]              VARCHAR (6)  NULL,
    [DataZlozeniaDeklaracjiPierwotnej] DATE         NULL,
    [CzyOstatniaWersjaDeklaracji]      BIT          NULL,
    CONSTRAINT [PK_ZPNW_Dokument] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_AKC],
    CONSTRAINT [FK_ZPNW_Dokument_IdKomorkiIdPodmiotu_Podmiot_IdKomorkiIdPodmiotu] FOREIGN KEY ([IdKomorki], [IdPodmiotu]) REFERENCES [akc].[Podmiot] ([IdKomorki], [IdPodmiotu])
);

