CREATE TABLE [pta].[AD_Podmiot] (
    [NRA]                    VARCHAR (13)   NOT NULL,
    [Typ]                    VARCHAR (5)    NOT NULL,
    [Nazwa]                  NVARCHAR (300) NOT NULL,
    [NIP]                    NVARCHAR (35)  NOT NULL,
    [REGON]                  NVARCHAR (14)  NULL,
    [KodKraju]               CHAR (2)       NOT NULL,
    [Ulica]                  NVARCHAR (70)  NULL,
    [NrDomu]                 NVARCHAR (11)  NOT NULL,
    [NrLokalu]               NVARCHAR (240) NULL,
    [Miejscowosc]            NVARCHAR (60)  NULL,
    [KodPocztowy]            VARCHAR (10)   NOT NULL,
    [Poczta]                 NVARCHAR (60)  NULL,
    [UCNadzoru]              VARCHAR (8)    NULL,
    [ObowiazujeOd]           DATE           NOT NULL,
    [ObowiazujeDo]           DATE           NOT NULL,
    [Wysylajacy]             VARCHAR (13)   NULL,
    [IntDomyslny]            CHAR (1)       NULL,
    [UCWydania]              VARCHAR (8)    NOT NULL,
    [CzyDostawaBezposrednia] BIT            DEFAULT ('0') NULL,
    [Wlasciciel]             VARCHAR (13)   NULL,
    CONSTRAINT [PK_AD_Podmiot] PRIMARY KEY CLUSTERED ([NRA] ASC, [Typ] ASC)
);

