CREATE TABLE [zab].[Gwarancja] (
    [IdGwarancji] INT             NOT NULL,
    [Numer]       VARCHAR (70)    NOT NULL,
    [Kwota]       DECIMAL (19, 2) NOT NULL,
    [IdGwaranta]  INT             NOT NULL,
    CONSTRAINT [PK_Gwarancja] PRIMARY KEY CLUSTERED ([IdGwarancji] ASC)
);

