CREATE TABLE [zef].[sprawoz_meld] (
    [id_dok]     VARCHAR (30)  NOT NULL,
    [dat_wykon]  DATETIME      NULL,
    [miesiac]    SMALLINT      NULL,
    [rok]        SMALLINT      NULL,
    [data_od]    DATETIME      NULL,
    [data_do]    DATETIME      NULL,
    [adresat]    VARCHAR (255) NULL,
    [okres_od]   INT           NULL,
    [okres_do]   INT           NULL,
    [symbol_ekd] VARCHAR (20)  NULL,
    [regon]      VARCHAR (20)  NULL,
    [miejsc]     VARCHAR (30)  NULL,
    CONSTRAINT [PK_SPRAWOZ_MELD] PRIMARY KEY CLUSTERED ([id_dok] ASC)
);

