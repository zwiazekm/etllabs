CREATE TABLE [aes2].[DWU_WynikAnalizyRyzyka] (
    [Id]                        NUMERIC (19)   NOT NULL,
    [OpisKoduAnalizyRyzyka]     NVARCHAR (350) NULL,
    [KodJezyka]                 NVARCHAR (2)   NULL,
    [NrPozycji]                 INT            NULL,
    [KodAnalizyRyzyka]          NVARCHAR (5)   NULL,
    [Cz1KoduAnalizyRyzykaId]    NVARCHAR (5)   NULL,
    [Cz1KoduAnalizyRyzykaIdPid] INT            NULL,
    [Cz2KoduAnalizyRyzykaId]    NVARCHAR (5)   NULL,
    [Cz2KoduAnalizyRyzykaIdPid] INT            NULL,
    [Cz3KoduAnalizyRyzykaId]    NVARCHAR (5)   NULL,
    [Cz3KoduAnalizyRyzykaIdPid] INT            NULL,
    [IdDokDWU]                  NUMERIC (19)   NULL,
    CONSTRAINT [DWU_WynikAnalizyRyzyka$PK_DWU_WynikAnalizyRyzyka] PRIMARY KEY CLUSTERED ([Id] ASC)
);

