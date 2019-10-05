CREATE TABLE [MF\FPLC].[klucz_Celin] (
    [status]                CHAR (1)        NULL,
    [Rok]                   INT             NULL,
    [kwartal]               INT             NULL,
    [DataPrzyjecia]         CHAR (10)       NULL,
    [NrCelina]              VARCHAR (40)    NULL,
    [Regon_Importera]       VARCHAR (14)    NULL,
    [NIP_Importera]         VARCHAR (12)    NULL,
    [Importer]              VARCHAR (35)    NULL,
    [Adres_Importera]       VARCHAR (35)    NULL,
    [Miejscowosc_Importera] VARCHAR (35)    NULL,
    [Kraj_Importera]        VARCHAR (2)     NULL,
    [PozId]                 SMALLINT        NOT NULL,
    [Procedura]             VARCHAR (4)     NULL,
    [kwotaAKC]              DECIMAL (17, 2) NULL
);

