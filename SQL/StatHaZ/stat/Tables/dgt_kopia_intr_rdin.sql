CREATE TABLE [stat].[dgt_kopia_intr_rdin] (
    [id_rdin]       VARCHAR (35) NOT NULL,
    [NIP]           VARCHAR (10) NULL,
    [RokMc]         INT          NULL,
    [wersja_dek]    INT          NULL,
    [kod_us]        VARCHAR (4)  NULL,
    [trans_nabycie] DECIMAL (14) NULL,
    [trans_dostawa] DECIMAL (14) NULL,
    [poprawnosc]    CHAR (1)     NULL,
    [status_us]     CHAR (1)     NULL,
    [rodz_dekl]     CHAR (1)     NULL,
    [Rok]           AS           ([RokMc]/(100)),
    [generacjaId]   INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_intr_rdin] PRIMARY KEY CLUSTERED ([id_rdin] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE NONCLUSTERED INDEX [idx_dgt_kopia_intr_rdin_nip]
    ON [stat].[dgt_kopia_intr_rdin]([NIP] ASC)
    ON [StatIndeksy];


GO
CREATE STATISTICS [kod_us]
    ON [stat].[dgt_kopia_intr_rdin]([kod_us]);


GO
CREATE STATISTICS [poprawnosc]
    ON [stat].[dgt_kopia_intr_rdin]([poprawnosc]);

