CREATE TABLE [tr].[InformacjeoTowarachWrazliwych] (
    [SID]                                    INT             NOT NULL,
    [IDSlownikaTowarowWrazliwych]            INT             NULL,
    [JednostkaMiaryPole31]                   DECIMAL (14, 3) NOT NULL,
    [SIDPozycjiTowarowejOperacjiTranzytowej] INT             NULL,
    CONSTRAINT [PK_InformacjeoTowarachWrazliwych] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_InformacjeoTowarachWrazliwych_KlasaTowarowWrazliwych_SlownikTowarowWrazliwych_SID] FOREIGN KEY ([IDSlownikaTowarowWrazliwych]) REFERENCES [tr].[SlownikTowarowWrazliwych] ([SID])
);

