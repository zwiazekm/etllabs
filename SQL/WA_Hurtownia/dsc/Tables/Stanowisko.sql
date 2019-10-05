CREATE TABLE [dsc].[Stanowisko] (
    [IDStanowisko]     INT           NOT NULL,
    [SymbolStanowisko] VARCHAR (255) NULL,
    CONSTRAINT [PK_Stanowisko] PRIMARY KEY CLUSTERED ([IDStanowisko] ASC) ON [FG_DSC]
);

