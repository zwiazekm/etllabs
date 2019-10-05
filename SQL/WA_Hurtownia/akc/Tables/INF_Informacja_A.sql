﻿CREATE TABLE [akc].[INF_Informacja_A] (
    [IdDok]                              VARCHAR (30)    NOT NULL,
    [IdKomorki]                          VARCHAR (20)    NULL,
    [IdPodmiotu]                         INT             NULL,
    [RodzajInformacji]                   CHAR (1)        NOT NULL,
    [RodzajDokumentu]                    CHAR (4)        NULL,
    [NumerDokumentu]                     VARCHAR (30)    NULL,
    [NumerZalacznika]                    INT             NOT NULL,
    [NumerAkcyzowy]                      VARCHAR (40)    NULL,
    [IzbaCelnaZlozeniaDok]               VARCHAR (20)    NULL,
    [MiejsceZlozeniaDok]                 VARCHAR (20)    NULL,
    [ZnacznikKorekty]                    SMALLINT        NULL,
    [Status]                             CHAR (1)        NULL,
    [OkresSprawozdawczy]                 DATE            NULL,
    [DataRejestrDokWSyst]                DATETIME        NULL,
    [DataZlozeniaDok]                    DATE            NULL,
    [DataWplywuDok]                      DATE            NULL,
    [ZapasPoczatkowy]                    DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasPoczatk]             DECIMAL (19, 3) NULL,
    [IloscWyrobPrzyjetaNaSklad]          DECIMAL (19, 3) NULL,
    [IloscWyprodukWyrobAkc]              DECIMAL (19, 3) NULL,
    [IloscWyrobZuzytychDoProd]           DECIMAL (19, 3) NULL,
    [IloscWyrobZeSklad]                  DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladWprocedZawiesz]    DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladPozaProcedZawiesz] DECIMAL (19, 3) NULL,
    [UbytkiCalkowZniszcz]                DECIMAL (19, 3) NULL,
    [ZapasKoncowy]                       DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasKoncow]              DECIMAL (19, 3) NULL,
    [DataZlozeniaDeklaracjiPierwotnej]   DATE            NULL,
    [CzyOstatniaWersjaDeklaracji]        BIT             NULL,
    CONSTRAINT [PK_INF_Informacja_A] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznika] ASC) ON [FG_AKC],
    CONSTRAINT [FK_INF_Informacja_A_IdKomorkiIdPodmiotu_Podmiot_IdKomorkiIdPodmiotu] FOREIGN KEY ([IdKomorki], [IdPodmiotu]) REFERENCES [akc].[Podmiot] ([IdKomorki], [IdPodmiotu])
);

