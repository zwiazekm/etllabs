CREATE TABLE [aimp2].[DSK_TowarKontener] (
    [IdKontenera]    NUMERIC (19)  NOT NULL,
    [IdTowarDSK]     NUMERIC (19)  NULL,
    [NumerKontenera] NVARCHAR (17) NULL,
    CONSTRAINT [DSK_TowarKontener_PK] PRIMARY KEY CLUSTERED ([IdKontenera] ASC)
);

