CREATE TABLE [aimp2].[ZCP_TowarInformacjaDodatkowa] (
    [IdInfDod]        NUMERIC (19)   NOT NULL,
    [IdTowarZCP]      NUMERIC (19)   NULL,
    [KodInfDodatk]    NVARCHAR (5)   NULL,
    [KodInfDodatkPid] INT            NULL,
    [OpisInfDodatk]   NVARCHAR (512) NULL,
    [DanePokontrolne] NTEXT          NULL,
    CONSTRAINT [ZCP_TowarInformacjaDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInfDod] ASC)
);

