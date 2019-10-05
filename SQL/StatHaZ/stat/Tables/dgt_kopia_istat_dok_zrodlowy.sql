CREATE TABLE [stat].[dgt_kopia_istat_dok_zrodlowy] (
    [id_dok_zrd]        VARCHAR (30)  NOT NULL,
    [sym_dok_zrd]       VARCHAR (40)  NULL,
    [rodz_dok_zrd]      VARCHAR (4)   NULL,
    [sposob_wpr_zrd]    CHAR (1)      NULL,
    [data_wpr_zrd]      DATETIME      NULL,
    [wprowadzil]        VARCHAR (40)  NULL,
    [xml]               TEXT          NULL,
    [id_dok_dekl_wynik] VARCHAR (30)  NULL,
    [err_xml]           TEXT          NULL,
    [id_jedn]           VARCHAR (20)  NULL,
    [regon]             VARCHAR (14)  NULL,
    [czy_potw]          CHAR (1)      NULL,
    [email]             VARCHAR (128) NULL,
    [id_pliku]          VARCHAR (100) NULL,
    [generacjaId]       INT           NOT NULL,
    CONSTRAINT [PK_dgt_kopia_istat_dok_zrodlowy] PRIMARY KEY CLUSTERED ([id_dok_zrd] ASC, [generacjaId] ASC) ON [StatIndeksy]
) TEXTIMAGE_ON [StatDane];


GO
CREATE STATISTICS [czy_potw]
    ON [stat].[dgt_kopia_istat_dok_zrodlowy]([czy_potw]);


GO
CREATE STATISTICS [data_wpr_zrd]
    ON [stat].[dgt_kopia_istat_dok_zrodlowy]([data_wpr_zrd]);


GO
CREATE STATISTICS [email]
    ON [stat].[dgt_kopia_istat_dok_zrodlowy]([email]);


GO
CREATE STATISTICS [id_pliku]
    ON [stat].[dgt_kopia_istat_dok_zrodlowy]([id_pliku]);


GO
CREATE STATISTICS [wprowadzil]
    ON [stat].[dgt_kopia_istat_dok_zrodlowy]([wprowadzil]);

