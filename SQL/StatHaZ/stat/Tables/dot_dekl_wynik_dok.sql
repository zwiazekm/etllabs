CREATE TABLE [stat].[dot_dekl_wynik_dok] (
    [id]                  VARCHAR (35) NOT NULL,
    [status]              VARCHAR (1)  NULL,
    [nip_zobowiazanego]   VARCHAR (10) NULL,
    [regon_zobowiazanego] VARCHAR (14) NULL,
    [typ]                 VARCHAR (1)  NULL,
    [RokMc]               INT          NULL,
    [numer]               DECIMAL (2)  NULL,
    CONSTRAINT [PK_dot_dekl_wynik_dok] PRIMARY KEY CLUSTERED ([id] ASC) ON [StatIndeksy]
);


GO
CREATE NONCLUSTERED INDEX [idx_dot_dwd_nip_zobowiazanego]
    ON [stat].[dot_dekl_wynik_dok]([nip_zobowiazanego] ASC)
    ON [StatIndeksy];


GO
CREATE NONCLUSTERED INDEX [idx_dwp_typ]
    ON [stat].[dot_dekl_wynik_dok]([typ] ASC)
    ON [StatIndeksy];

