CREATE TABLE [tr].[SkontrolowanePozycjeTowaryWrazliwe] (
    [SID]                         INT             NOT NULL,
    [SIDSkontrolowanejPozycji]    INT             NULL,
    [IDSlownikaTowarowWrazliwych] INT             NULL,
    [JednostkaMiaryPole31]        DECIMAL (14, 3) NULL,
    [KodPoziomuKontroli]          CHAR (1)        NULL,
    CONSTRAINT [PK_SkontrolowanePozycjeTowaryWrazliwe] PRIMARY KEY CLUSTERED ([SID] ASC)
);

