CREATE TABLE [dsc].[Slownik] (
    [Tr]            SMALLINT      NOT NULL,
    [Kod]           VARCHAR (9)   NOT NULL,
    [ID]            INT           NOT NULL,
    [NazwaSkrocona] VARCHAR (100) NOT NULL,
    [Nazwa]         VARCHAR (100) NOT NULL,
    [NazwaPelna]    VARCHAR (500) NOT NULL,
    CONSTRAINT [PK_Slownik] PRIMARY KEY CLUSTERED ([Tr] ASC, [Kod] ASC)
);

