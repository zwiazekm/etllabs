CREATE TABLE [stat].[dgt_kopia_slowniki] (
    [id_rodz_slow] VARCHAR (6)     NOT NULL,
    [id_slown]     VARCHAR (6)     NOT NULL,
    [symbol]       VARCHAR (10)    NULL,
    [nazwa]        VARCHAR (80)    NULL,
    [rodzaj]       CHAR (1)        NULL,
    [typ]          CHAR (1)        NULL,
    [kwota]        DECIMAL (20, 2) NULL,
    [kwota2]       DECIMAL (20, 2) NULL,
    [kwota3]       DECIMAL (20, 2) NULL,
    [data]         DATETIME        NULL,
    [liczba]       INT             NULL,
    [opis]         VARCHAR (255)   NULL,
    [raport]       VARCHAR (6)     NULL,
    [data_od]      DATETIME        NULL,
    [data_do]      DATETIME        NULL,
    [kwota4]       DECIMAL (20, 4) NULL,
    [generacjaId]  INT             NOT NULL
);


GO
CREATE STATISTICS [data]
    ON [stat].[dgt_kopia_slowniki]([data]);


GO
CREATE STATISTICS [kwota3]
    ON [stat].[dgt_kopia_slowniki]([kwota3]);


GO
CREATE STATISTICS [kwota4]
    ON [stat].[dgt_kopia_slowniki]([kwota4]);


GO
CREATE STATISTICS [liczba]
    ON [stat].[dgt_kopia_slowniki]([liczba]);


GO
CREATE STATISTICS [nazwa]
    ON [stat].[dgt_kopia_slowniki]([nazwa]);


GO
CREATE STATISTICS [opis]
    ON [stat].[dgt_kopia_slowniki]([opis]);


GO
CREATE STATISTICS [raport]
    ON [stat].[dgt_kopia_slowniki]([raport]);


GO
CREATE STATISTICS [rodzaj]
    ON [stat].[dgt_kopia_slowniki]([rodzaj]);


GO
CREATE STATISTICS [typ]
    ON [stat].[dgt_kopia_slowniki]([typ]);

