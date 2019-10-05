﻿CREATE TABLE [akc].[INF_Informacja_F] (
    [IdDok]                                          VARCHAR (30)    NOT NULL,
    [IdKomorki]                                      VARCHAR (20)    NULL,
    [IdPodmiotu]                                     INT             NULL,
    [RodzajInformacji]                               CHAR (1)        NOT NULL,
    [RodzajDokumentu]                                CHAR (4)        NULL,
    [NumerDokumentu]                                 VARCHAR (30)    NULL,
    [NumerZalacznika]                                INT             NOT NULL,
    [NumerAkcyzowy]                                  VARCHAR (40)    NULL,
    [IzbaCelnaZlozeniaDok]                           VARCHAR (20)    NULL,
    [MiejsceZlozeniaDok]                             VARCHAR (20)    NULL,
    [ZnacznikKorekty]                                SMALLINT        NULL,
    [Status]                                         CHAR (1)        NULL,
    [OkresSprawozdawczy]                             DATE            NULL,
    [DataRejestrDokWSyst]                            DATETIME        NULL,
    [DataZlozeniaDok]                                DATE            NULL,
    [DataWplywuDok]                                  DATE            NULL,
    [ZapasPoczatkowyPapierosySzt]                    DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasPoczatkPapierosy]                DECIMAL (19, 3) NULL,
    [IloscWyrobPrzyjetaNaSkladPapierosySzt]          DECIMAL (19, 3) NULL,
    [IloscWyprodukWyrobAkcPapierosySzt]              DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladPapierosySzt]                  DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladWprocedZawieszPapierosySzt]    DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladPozaProcedZawieszPapierosySzt] DECIMAL (19, 3) NULL,
    [UbytkiCalkowZniszczPapierosySzt]                DECIMAL (19, 3) NULL,
    [ZapasKoncowyPapierosySzt]                       DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasKoncowPapierosy]                 DECIMAL (19, 3) NULL,
    [ZapasPoczatCygaraSzt]                           DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasPoczatkCygara]                   DECIMAL (19, 3) NULL,
    [IloscWyrobPrzyjetaNaSkladCygaraSzt]             DECIMAL (19, 3) NULL,
    [IloscWyprodukWyrobAkcCygaraSzt]                 DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladCygaraSzt]                     DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladWprocedZawieszCygaraSzt]       DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladPozaProcedZawieszCygaraSzt]    DECIMAL (19, 3) NULL,
    [UbytkiCalkowZniszczCygaraSzt]                   DECIMAL (19, 3) NULL,
    [ZapasKoncowyCygaraSzt]                          DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasKoncowCygara]                    DECIMAL (19, 3) NULL,
    [ZapasPoczatTytonKg]                             DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasPoczatkTyton]                    DECIMAL (19, 3) NULL,
    [IloscWyrobPrzyjetaNaSkladTytonKg]               DECIMAL (19, 3) NULL,
    [IloscWyprodukWyrobAkcTytonKg]                   DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladTytonKg]                       DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladWprocedZawieszTytonKg]         DECIMAL (19, 3) NULL,
    [IloscWyrobZeSkladPozaProcedZawieszTytonKg]      DECIMAL (19, 3) NULL,
    [UbytkiCalkowZniszczTytonKg]                     DECIMAL (19, 3) NULL,
    [ZapasKoncowyTytonKg]                            DECIMAL (19, 3) NULL,
    [KwotaOdpowZapasKoncowTyton]                     DECIMAL (19, 3) NULL,
    [DataZlozeniaDeklaracjiPierwotnej]               DATE            NULL,
    [CzyOstatniaWersjaDeklaracji]                    BIT             NULL,
    CONSTRAINT [PK_INF_Informacja_F] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NumerZalacznika] ASC)
);

