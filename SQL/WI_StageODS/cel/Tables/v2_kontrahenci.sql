CREATE TABLE [cel].[v2_kontrahenci] (
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
    [QuasiId]     INT          NULL,
    CONSTRAINT [PK_V2_KONTRAHENCI] PRIMARY KEY CLUSTERED ([idKntr] ASC) WITH (FILLFACTOR = 90)
);

