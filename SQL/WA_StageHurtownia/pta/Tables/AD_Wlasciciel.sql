CREATE TABLE [pta].[AD_Wlasciciel] (
    [Id]            BIGINT       NOT NULL,
    [NRA]           VARCHAR (13) NOT NULL,
    [Typ]           VARCHAR (5)  NOT NULL,
    [WlascicielNRA] VARCHAR (13) NOT NULL,
    [WlascicielTyp] VARCHAR (5)  DEFAULT ('AWK') NOT NULL,
    CONSTRAINT [PK_AD_Wlasciciel] PRIMARY KEY CLUSTERED ([Id] ASC)
);

