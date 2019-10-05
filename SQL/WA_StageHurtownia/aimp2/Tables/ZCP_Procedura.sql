CREATE TABLE [aimp2].[ZCP_Procedura] (
    [IdProcedury]     NUMERIC (19) NOT NULL,
    [IdTowarZCP]      NUMERIC (19) NULL,
    [Kod]             NVARCHAR (3) NOT NULL,
    [KodPid]          INT          NULL,
    [DanePokontrolne] NTEXT        NULL,
    CONSTRAINT [ZCP_Procedura_PK] PRIMARY KEY CLUSTERED ([IdProcedury] ASC)
);

