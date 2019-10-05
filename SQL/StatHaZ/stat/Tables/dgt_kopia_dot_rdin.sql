CREATE TABLE [stat].[dgt_kopia_dot_rdin] (
    [nr_poz]        DECIMAL (11) NULL,
    [nip]           VARCHAR (10) NULL,
    [rok]           DECIMAL (4)  NULL,
    [miesiac]       DECIMAL (2)  NULL,
    [wersja_dek]    DECIMAL (1)  NULL,
    [kod_us]        VARCHAR (4)  NULL,
    [trans_nabycie] DECIMAL (14) NULL,
    [trans_dostawa] DECIMAL (14) NULL,
    [poprawnosc]    VARCHAR (1)  NULL,
    [status_us]     VARCHAR (1)  NULL,
    [rodz_dekl]     VARCHAR (1)  NULL,
    [generacjaId]   INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dot_rdin] PRIMARY KEY CLUSTERED ([generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_dot_rdin]([generacjaId]);


GO
CREATE STATISTICS [kod_us]
    ON [stat].[dgt_kopia_dot_rdin]([kod_us]);


GO
CREATE STATISTICS [miesiac]
    ON [stat].[dgt_kopia_dot_rdin]([miesiac]);


GO
CREATE STATISTICS [nip]
    ON [stat].[dgt_kopia_dot_rdin]([nip]);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dgt_kopia_dot_rdin]([nr_poz]);


GO
CREATE STATISTICS [poprawnosc]
    ON [stat].[dgt_kopia_dot_rdin]([poprawnosc]);


GO
CREATE STATISTICS [rodz_dekl]
    ON [stat].[dgt_kopia_dot_rdin]([rodz_dekl]);


GO
CREATE STATISTICS [rok]
    ON [stat].[dgt_kopia_dot_rdin]([rok]);


GO
CREATE STATISTICS [status_us]
    ON [stat].[dgt_kopia_dot_rdin]([status_us]);


GO
CREATE STATISTICS [trans_dostawa]
    ON [stat].[dgt_kopia_dot_rdin]([trans_dostawa]);


GO
CREATE STATISTICS [trans_nabycie]
    ON [stat].[dgt_kopia_dot_rdin]([trans_nabycie]);


GO
CREATE STATISTICS [wersja_dek]
    ON [stat].[dgt_kopia_dot_rdin]([wersja_dek]);

