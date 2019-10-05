CREATE TABLE [stat].[dgt_kopia_v2_kontrahenci] (
    [idKntr]      INT          NOT NULL,
    [Nazwa]       VARCHAR (35) NULL,
    [UlicaNumer]  VARCHAR (35) NULL,
    [KodPocztowy] VARCHAR (9)  NULL,
    [Miejscowosc] VARCHAR (35) NULL,
    [Kraj]        VARCHAR (2)  NULL,
    [TIN]         VARCHAR (12) NULL,
    [Regon]       VARCHAR (14) NULL,
    [Pesel]       VARCHAR (11) NULL,
    [CRP]         VARCHAR (19) NULL,
    [generacjaId] INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_v2_kontrahenci] PRIMARY KEY CLUSTERED ([idKntr] ASC, [generacjaId] ASC) ON [StatDane]
);


GO
CREATE STATISTICS [CRP]
    ON [stat].[dgt_kopia_v2_kontrahenci]([CRP]);


GO
CREATE STATISTICS [KodPocztowy]
    ON [stat].[dgt_kopia_v2_kontrahenci]([KodPocztowy]);


GO
CREATE STATISTICS [Kraj]
    ON [stat].[dgt_kopia_v2_kontrahenci]([Kraj]);


GO
CREATE STATISTICS [Miejscowosc]
    ON [stat].[dgt_kopia_v2_kontrahenci]([Miejscowosc]);


GO
CREATE STATISTICS [Nazwa]
    ON [stat].[dgt_kopia_v2_kontrahenci]([Nazwa]);


GO
CREATE STATISTICS [Pesel]
    ON [stat].[dgt_kopia_v2_kontrahenci]([Pesel]);


GO
CREATE STATISTICS [TIN]
    ON [stat].[dgt_kopia_v2_kontrahenci]([TIN]);


GO
CREATE STATISTICS [UlicaNumer]
    ON [stat].[dgt_kopia_v2_kontrahenci]([UlicaNumer]);

