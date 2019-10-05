CREATE TABLE [aimp2].[DSK_InformacjaDodatkowa] (
    [IdInfDod]        NUMERIC (19)   NOT NULL,
    [IdDok]           NUMERIC (19)   NULL,
    [IdTowarDSK]      NUMERIC (19)   NULL,
    [KodInfDodatk]    NCHAR (5)      NULL,
    [KodInfDodatkPid] INT            NULL,
    [OpisInfDodatk]   NVARCHAR (512) NULL,
    CONSTRAINT [DSK_InformacjaDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInfDod] ASC)
);

