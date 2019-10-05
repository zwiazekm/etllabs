CREATE TABLE [aimp2].[ZCP_WartoscTowarow] (
    [IdWpisu]                 NUMERIC (19)    NOT NULL,
    [IdTowarZCP]              NUMERIC (19)    NULL,
    [WartoscTowaru]           NUMERIC (16, 2) NULL,
    [WartoscStatystyczna]     NUMERIC (16, 2) NOT NULL,
    [MetodaWartosciowania]    NVARCHAR (3)    NULL,
    [MetodaWartosciowaniaPid] INT             NULL,
    CONSTRAINT [ZCP_WartoscTowarow_PK] PRIMARY KEY CLUSTERED ([IdWpisu] ASC)
);

