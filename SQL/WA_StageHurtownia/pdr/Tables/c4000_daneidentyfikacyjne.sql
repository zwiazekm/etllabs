CREATE TABLE [pdr].[c4000_daneidentyfikacyjne] (
    [c4000_daneidentyfikacyjne_id] BIGINT        NOT NULL,
    [dataurodzenia]                DATE          NULL,
    [haslo]                        NVARCHAR (40) NULL,
    [id1]                          VARCHAR (25)  NULL,
    [id2]                          VARCHAR (255) NULL,
    [imie]                         NVARCHAR (60) NULL,
    [login]                        NVARCHAR (40) NULL,
    [nazwisko]                     NVARCHAR (90) NOT NULL,
    [obywatelstwo]                 VARCHAR (2)   NOT NULL,
    [pesel]                        VARCHAR (11)  NULL,
    [c4000_id]                     BIGINT        NULL,
    PRIMARY KEY CLUSTERED ([c4000_daneidentyfikacyjne_id] ASC)
);

