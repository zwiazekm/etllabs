CREATE TABLE [zab].[Hipoteka] (
    [IdHipoteki]            INT             NOT NULL,
    [NumerKsiegiWieczystej] VARCHAR (50)    NOT NULL,
    [WartoscHipoteki]       DECIMAL (19, 2) NOT NULL,
    CONSTRAINT [PK_Hipoteka] PRIMARY KEY CLUSTERED ([IdHipoteki] ASC) ON [FG_ZAB]
);

