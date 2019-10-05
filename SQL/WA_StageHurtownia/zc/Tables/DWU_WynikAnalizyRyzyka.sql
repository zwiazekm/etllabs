CREATE TABLE [zc].[DWU_WynikAnalizyRyzyka] (
    [Id]                        DECIMAL (19)  NOT NULL,
    [NrPozycji]                 INT           NULL,
    [KodAnalizyRyzyka]          VARCHAR (5)   NULL,
    [Cz1KoduAnalizyRyzykaId]    VARCHAR (1)   NULL,
    [Cz1KoduAnalizyRyzykaIdPid] INT           NULL,
    [Cz2KoduAnalizyRyzykaId]    VARCHAR (3)   NULL,
    [Cz2KoduAnalizyRyzykaIdPid] INT           NULL,
    [Cz3KoduAnalizyRyzykaId]    VARCHAR (1)   NULL,
    [Cz3KoduAnalizyRyzykaIdPid] INT           NULL,
    [OpisKoduAnalizyRyzyka]     VARCHAR (350) NULL,
    [IdDokDWU]                  DECIMAL (19)  NULL,
    CONSTRAINT [PK_DWU_WynikAnalizyRyzyka] PRIMARY KEY CLUSTERED ([Id] ASC)
);

