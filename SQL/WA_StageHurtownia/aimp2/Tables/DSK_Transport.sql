CREATE TABLE [aimp2].[DSK_Transport] (
    [IdTransportu]                           NUMERIC (19)  NOT NULL,
    [IdDok]                                  NUMERIC (19)  NOT NULL,
    [OznaczenieSrodkaTransportuPrzybycie]    NCHAR (2)     NULL,
    [OznaczenieSrodkaTransportuPrzybyciePid] INT           NULL,
    [ZnakiSrodkaTransportuPrzybycie]         NVARCHAR (35) NULL,
    CONSTRAINT [DSK_Transport_PK] PRIMARY KEY CLUSTERED ([IdTransportu] ASC)
);

