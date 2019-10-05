CREATE TABLE [aimp2].[DPDZ_Odbiorca] (
    [IdKontrahenta]      NUMERIC (19)  NOT NULL,
    [IdDok]              NUMERIC (19)  NOT NULL,
    [IdentyfikatorFirmy] NVARCHAR (17) NULL,
    [NazwaFirmy]         NVARCHAR (70) NULL,
    [ImieOdbiorcy]       NVARCHAR (30) NULL,
    [NazwiskoOdbiorcy]   NVARCHAR (40) NULL,
    [PESELOdbiorcy]      NVARCHAR (11) NULL,
    [RodzajOdbiorcy]     NVARCHAR (1)  NULL,
    CONSTRAINT [DPDZ_Odbiorca_PK] PRIMARY KEY CLUSTERED ([IdKontrahenta] ASC)
);

