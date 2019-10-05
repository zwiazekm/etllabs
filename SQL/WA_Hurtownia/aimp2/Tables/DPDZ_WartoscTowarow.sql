CREATE TABLE [aimp2].[DPDZ_WartoscTowarow] (
    [IdWartosci]              NUMERIC (19)    NOT NULL,
    [IdTowarDPDZ]             NUMERIC (19)    NULL,
    [WartoscTowarow]          NUMERIC (16, 2) NULL,
    [WartoscStatystyczna]     NUMERIC (16, 2) NOT NULL,
    [MetodaWartosciowania]    NVARCHAR (3)    NULL,
    [MetodaWartosciowaniaPid] INT             NULL,
    CONSTRAINT [DPDZ_WartoscTowarow_PK] PRIMARY KEY CLUSTERED ([IdWartosci] ASC) ON [FG_AIMP2],
    CONSTRAINT [DPDZ_WartoscTowarow$FK_DPDZ_Towar] FOREIGN KEY ([IdTowarDPDZ]) REFERENCES [aimp2].[DPDZ_Towar] ([IdPozycji])
);

