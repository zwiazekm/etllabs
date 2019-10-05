CREATE TABLE [aimp2].[ZCP_InformacjaDodatkowa] (
    [IdInformacji]    NUMERIC (19)   NOT NULL,
    [IdDok]           NUMERIC (19)   NULL,
    [KodInfDodatk]    NVARCHAR (5)   NULL,
    [KodInfDodatkPid] INT            NULL,
    [OpisInfDodatk]   NVARCHAR (512) NULL,
    CONSTRAINT [ZCP_InformacjaDodatkowa_PK] PRIMARY KEY CLUSTERED ([IdInformacji] ASC)
);

