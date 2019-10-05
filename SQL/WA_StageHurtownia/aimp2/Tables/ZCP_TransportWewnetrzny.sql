CREATE TABLE [aimp2].[ZCP_TransportWewnetrzny] (
    [IdTransportu]                              NUMERIC (19)  NOT NULL,
    [IdDok]                                     NUMERIC (19)  NULL,
    [RodzajTransportu]                          NVARCHAR (4)  NULL,
    [RodzajTransportuPid]                       INT           NULL,
    [ZnakiSrodkaTransportu]                     NVARCHAR (35) NULL,
    [PrzynaleznoscPanstwowaSrodkaTransportu]    NVARCHAR (2)  NULL,
    [PrzynaleznoscPanstwowaSrodkaTransportuPid] INT           NULL,
    [OznaczenieSrodkaTransportu]                NUMERIC (2)   NULL,
    [OznaczenieSrodkaTransportuPid]             BIGINT        NULL,
    CONSTRAINT [ZCP_TransportWewnetrzny_PK] PRIMARY KEY CLUSTERED ([IdTransportu] ASC)
);

