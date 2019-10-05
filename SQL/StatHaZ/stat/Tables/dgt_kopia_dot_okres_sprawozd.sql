CREATE TABLE [stat].[dgt_kopia_dot_okres_sprawozd] (
    [id_pod]      VARCHAR (35)    NOT NULL,
    [nr_poz]      INT             NULL,
    [RokMc]       INT             NOT NULL,
    [typ]         CHAR (1)        NOT NULL,
    [status]      CHAR (1)        NULL,
    [id_jedn]     VARCHAR (20)    NOT NULL,
    [wsk_popraw]  CHAR (1)        NULL,
    [operator]    VARCHAR (40)    NULL,
    [data_zmiany] DATETIME        NULL,
    [roznica_V_I] DECIMAL (14, 2) NULL,
    [generacjaId] INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dot_okres_sprawozd] PRIMARY KEY CLUSTERED ([id_pod] ASC, [RokMc] ASC, [typ] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [data_zmiany]
    ON [stat].[dgt_kopia_dot_okres_sprawozd]([data_zmiany]);


GO
CREATE STATISTICS [id_jedn]
    ON [stat].[dgt_kopia_dot_okres_sprawozd]([id_jedn]);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dgt_kopia_dot_okres_sprawozd]([nr_poz]);


GO
CREATE STATISTICS [operator]
    ON [stat].[dgt_kopia_dot_okres_sprawozd]([operator]);


GO
CREATE STATISTICS [roznica_V_I]
    ON [stat].[dgt_kopia_dot_okres_sprawozd]([roznica_V_I]);

