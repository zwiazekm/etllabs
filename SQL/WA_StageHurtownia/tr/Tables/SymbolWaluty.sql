CREATE TABLE [tr].[SymbolWaluty] (
    [IDWaluty]        CHAR (3)        NOT NULL,
    [KodJezykaWaluty] CHAR (2)        NOT NULL,
    [KursWymiany]     DECIMAL (14, 6) NULL,
    [NazwaWaluty]     VARCHAR (140)   NULL,
    CONSTRAINT [PK_SymbolWaluty] PRIMARY KEY CLUSTERED ([IDWaluty] ASC)
);

