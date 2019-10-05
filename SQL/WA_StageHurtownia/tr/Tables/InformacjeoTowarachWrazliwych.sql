CREATE TABLE [tr].[InformacjeoTowarachWrazliwych] (
    [SID]                                    INT             NOT NULL,
    [IDSlownikaTowarowWrazliwych]            INT             NULL,
    [JednostkaMiaryPole31]                   DECIMAL (14, 3) NOT NULL,
    [SIDPozycjiTowarowejOperacjiTranzytowej] INT             NULL,
    CONSTRAINT [PK_InformacjeoTowarachWrazliwych] PRIMARY KEY CLUSTERED ([SID] ASC)
);

