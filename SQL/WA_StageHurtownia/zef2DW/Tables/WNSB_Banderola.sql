CREATE TABLE [zef2DW].[WNSB_Banderola] (
    [IdentyfikatorDokumentu]              BIGINT          NOT NULL,
    [BanderolaFormat]                     NVARCHAR (7)    NULL,
    [BanderolaSymbol2]                    NVARCHAR (255)  NULL,
    [BanderolaSymbol]                     NVARCHAR (255)  NULL,
    [BanderolaIlosc]                      DECIMAL (19, 2) NULL,
    [BanderolaWartosc2]                   DECIMAL (19, 2) NULL,
    [BanderolaWartosc]                    DECIMAL (19, 2) NULL,
    [BanderolaKosztWytworzenia2]          DECIMAL (19, 2) NULL,
    [BanderolaKosztWytworzenia]           DECIMAL (19, 2) NULL,
    [BanderolaSumaNaleznosci]             DECIMAL (19, 2) NULL,
    [BanderolaSumaWytworzenia]            DECIMAL (19, 2) NULL,
    [BanderolaRodzajBanderoli]            NVARCHAR (13)   NULL,
    [RodzajWyrobow]                       NVARCHAR (255)  NULL,
    [BanderolaWyroby]                     NVARCHAR (11)   NULL,
    [BanderolaTytulPlatnosciWytworzenia2] NVARCHAR (255)  NULL,
    [BanderolaTytulPlatnosciWytworzenia]  NVARCHAR (255)  NULL,
    [BanderolaTytulPlatnosci2]            NVARCHAR (255)  NULL,
    [BanderolaTytulPlatnosci]             NVARCHAR (255)  NULL,
    [DataArch]                            DATE            NULL,
    [ID_Pismo_xml]                        BIGINT          NULL,
    [operacja]                            NVARCHAR (1)    NULL
);

