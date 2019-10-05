CREATE TABLE [tr].[SkontrolowanePozycjeTowaryWrazliwe] (
    [SID]                         INT             NOT NULL,
    [SIDSkontrolowanejPozycji]    INT             NULL,
    [IDSlownikaTowarowWrazliwych] INT             NULL,
    [JednostkaMiaryPole31]        DECIMAL (14, 3) NULL,
    [KodPoziomuKontroli]          CHAR (1)        NULL,
    CONSTRAINT [PK_SkontrolowanePozycjeTowaryWrazliwe] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_SkontrolowanePozycjeTowaryWrazliwe_IDSlownikaTowarowWrazliwych_SlownikTowarowWrazliwych_SID] FOREIGN KEY ([IDSlownikaTowarowWrazliwych]) REFERENCES [tr].[SlownikTowarowWrazliwych] ([SID]),
    CONSTRAINT [FK_SkontrolowanePozycjeTowaryWrazliwe_SIDSkontrolowanejPozycji_SzczegolySkontrolowanejPozycji_SID] FOREIGN KEY ([SIDSkontrolowanejPozycji]) REFERENCES [tr].[SzczegolySkontrolowanejPozycji] ([SID])
);

