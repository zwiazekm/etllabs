CREATE TABLE [zef2].[WersjaZefir] (
    [id]                BIGINT        IDENTITY (1, 1) NOT NULL,
    [data_aktualizacji] DATETIME      NOT NULL,
    [wersja]            BIGINT        NOT NULL,
    [baza_zrodlowa]     NVARCHAR (10) NOT NULL,
    [czy_powodzenie]    NCHAR (1)     NULL,
    CONSTRAINT [PK_a2.WersjaZefir] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_ZEF2]
);

