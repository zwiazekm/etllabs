CREATE TABLE [stat].[dgt_procedura_wersja] (
    [id_proc]          INT           IDENTITY (1, 1) NOT NULL,
    [nazwa_procedury]  VARCHAR (255) NULL,
    [wersja_procedury] VARCHAR (255) NULL,
    [data_od]          DATE          NOT NULL,
    [data_do]          DATE          NOT NULL,
    PRIMARY KEY CLUSTERED ([id_proc] ASC)
);


GO
CREATE STATISTICS [wersja_procedury]
    ON [stat].[dgt_procedura_wersja]([wersja_procedury]);

