CREATE TABLE [akc].[OplataPaliwowa] (
    [IdDok]                            VARCHAR (30) NOT NULL,
    [IdKomorki]                        VARCHAR (20) NULL,
    [IdPodmiotu]                       INT          NULL,
    [RodzajDokumentu]                  CHAR (4)     NULL,
    [MiejsceZlozeniaDok]               VARCHAR (20) NULL,
    [ZnacznikKorekty]                  SMALLINT     NULL,
    [Status]                           CHAR (1)     NULL,
    [NumerDokumentu]                   VARCHAR (30) NULL,
    [IdDokStowarzysz]                  VARCHAR (30) NULL,
    [NumerDokumentuStowarzysz]         VARCHAR (30) NULL,
    [DataRejestrDokWSyst]              DATETIME     NULL,
    [OkresSprawozdawczy]               DATE         NULL,
    [DataZlozeniaDok]                  DATE         NULL,
    [DataWplywuDok]                    DATE         NULL,
    [TerminPlatnosci]                  DATE         NULL,
    [DataZlozeniaDeklaracjiPierwotnej] DATE         NULL,
    [CzyOstatniaWersjaDeklaracji]      BIT          NULL,
    CONSTRAINT [PK_OplataPaliwowa] PRIMARY KEY CLUSTERED ([IdDok] ASC) ON [FG_AKC],
    CONSTRAINT [FK_OplataPaliwowa_IdKomorkiIdPodmiotu_Podmiot_IdKomorkiIdPodmiotu] FOREIGN KEY ([IdKomorki], [IdPodmiotu]) REFERENCES [akc].[Podmiot] ([IdKomorki], [IdPodmiotu])
);

