CREATE TABLE [zef2].[Priorytet] (
    [IDPriorytetu] INT           NOT NULL,
    [Nazwa]        NVARCHAR (15) NULL,
    [operacja]     NVARCHAR (1)  NULL,
    CONSTRAINT [PK_Priorytet] PRIMARY KEY CLUSTERED ([IDPriorytetu] ASC) WITH (FILLFACTOR = 90)
);

