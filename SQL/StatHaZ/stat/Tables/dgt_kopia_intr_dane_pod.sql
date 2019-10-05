CREATE TABLE [stat].[dgt_kopia_intr_dane_pod] (
    [id_pod]       VARCHAR (35)  NOT NULL,
    [nip]          VARCHAR (10)  NULL,
    [regon]        VARCHAR (14)  NULL,
    [pgus]         CHAR (1)      NULL,
    [pkep]         CHAR (1)      NULL,
    [pvat]         CHAR (1)      NULL,
    [pintrastat]   CHAR (1)      NULL,
    [nazwa]        VARCHAR (255) NULL,
    [imie]         VARCHAR (35)  NULL,
    [nazwisko]     VARCHAR (35)  NULL,
    [kod_kraj]     VARCHAR (2)   NULL,
    [kod_gmina]    VARCHAR (7)   NULL,
    [kod_poczt]    VARCHAR (8)   NULL,
    [poczta]       VARCHAR (35)  NULL,
    [miejscowosc]  VARCHAR (35)  NULL,
    [ulica]        VARCHAR (45)  NULL,
    [nr_dom]       VARCHAR (9)   NULL,
    [nr_lok]       VARCHAR (5)   NULL,
    [telefon]      VARCHAR (35)  NULL,
    [faks]         VARCHAR (35)  NULL,
    [email]        VARCHAR (128) NULL,
    [rodz_vat]     CHAR (1)      NULL,
    [data_wprow]   DATETIME      NULL,
    [uwagi]        VARCHAR (512) NULL,
    [status]       VARCHAR (2)   NULL,
    [data_zakoncz] DATETIME      NULL,
    [generacjaId]  INT           NOT NULL,
    CONSTRAINT [PK_dgt_kopia_intr_dane_pod] PRIMARY KEY CLUSTERED ([id_pod] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE NONCLUSTERED INDEX [idx_dp_nip]
    ON [stat].[dgt_kopia_intr_dane_pod]([nip] ASC)
    ON [StatIndeksy];

