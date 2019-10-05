CREATE TABLE [stat].[dgt_kopia_v2_tmp_kontrahenci] (
    [IdDokNr]     BIGINT       NOT NULL,
    [PozId]       INT          NOT NULL,
    [Typ]         VARCHAR (5)  NOT NULL,
    [Nazwa]       VARCHAR (35) NULL,
    [UlicaNumer]  VARCHAR (35) NULL,
    [KodPocztowy] VARCHAR (9)  NULL,
    [Miejscowosc] VARCHAR (35) NULL,
    [Kraj]        VARCHAR (2)  NULL,
    [TIN]         VARCHAR (12) NULL,
    [Regon]       VARCHAR (15) NULL,
    [Pesel]       VARCHAR (11) NULL,
    [EORI]        VARCHAR (20) NULL,
    [generacjaId] INT          NOT NULL,
    CONSTRAINT [PK_dgt_kopia_v2_tmp_kontrahenci] PRIMARY KEY CLUSTERED ([IdDokNr] ASC, [PozId] ASC, [Typ] ASC, [generacjaId] ASC) ON [StatDane]
);

