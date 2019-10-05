CREATE TABLE [osoz].[gwaranci] (
    [id]                  BIGINT        NOT NULL,
    [czas_modyfikacji]    DATETIME      NULL,
    [adres_kod_pocztowy]  VARCHAR (6)   NOT NULL,
    [adres_kraj]          VARCHAR (150) NOT NULL,
    [adres_miejscowosc]   VARCHAR (100) NOT NULL,
    [adres_numer_budynku] VARCHAR (10)  NOT NULL,
    [adres_numer_lokalu]  VARCHAR (10)  NULL,
    [adres_ulica]         VARCHAR (255) NULL,
    [nazwa]               VARCHAR (255) NOT NULL,
    [nip]                 VARCHAR (15)  NOT NULL,
    [tin]                 VARCHAR (17)  NULL,
    [aktywna]             BIT           NOT NULL,
    [id_pdr]              INT           NULL,
    CONSTRAINT [PK__gwaranci__3213E83F372244C0] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ]
);

