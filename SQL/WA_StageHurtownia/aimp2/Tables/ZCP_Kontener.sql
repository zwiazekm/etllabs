CREATE TABLE [aimp2].[ZCP_Kontener] (
    [IdKontenera]     NUMERIC (19)  NOT NULL,
    [IdDok]           NUMERIC (19)  NULL,
    [NumerKontenera]  NVARCHAR (17) NOT NULL,
    [DanePokontrolne] NTEXT         NULL,
    CONSTRAINT [ZCP_Kontener_PK] PRIMARY KEY CLUSTERED ([IdKontenera] ASC)
);

