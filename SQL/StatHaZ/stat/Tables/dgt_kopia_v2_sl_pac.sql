CREATE TABLE [stat].[dgt_kopia_v2_sl_pac] (
    [id_jedn]     CHAR (22)    NOT NULL,
    [id_jedn_nad] CHAR (8)     NULL,
    [nazwa_jedn]  VARCHAR (80) NULL,
    [nazwa]       VARCHAR (80) NULL,
    [granica]     VARCHAR (30) NULL,
    [generacjaId] INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_v2_sl_pac] PRIMARY KEY CLUSTERED ([id_jedn] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [granica]
    ON [stat].[dgt_kopia_v2_sl_pac]([granica]);


GO
CREATE STATISTICS [id_jedn_nad]
    ON [stat].[dgt_kopia_v2_sl_pac]([id_jedn_nad]);


GO
CREATE STATISTICS [nazwa]
    ON [stat].[dgt_kopia_v2_sl_pac]([nazwa]);


GO
CREATE STATISTICS [nazwa_jedn]
    ON [stat].[dgt_kopia_v2_sl_pac]([nazwa_jedn]);

