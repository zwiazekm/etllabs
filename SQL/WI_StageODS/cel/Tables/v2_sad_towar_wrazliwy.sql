CREATE TABLE [cel].[v2_sad_towar_wrazliwy] (
    [idDokNr]             BIGINT          NOT NULL,
    [PozId]               SMALLINT        NOT NULL,
    [TowarWrazliwy_PozId] SMALLINT        NOT NULL,
    [Kod]                 VARCHAR (2)     NULL,
    [Ilosc]               NUMERIC (14, 3) NULL,
    CONSTRAINT [PK_V2_SAD_TOWAR_WRAZLIWY] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC, [TowarWrazliwy_PozId] ASC) WITH (FILLFACTOR = 90)
);

