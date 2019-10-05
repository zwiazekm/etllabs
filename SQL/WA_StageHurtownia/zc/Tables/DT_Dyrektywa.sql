CREATE TABLE [zc].[DT_Dyrektywa] (
    [IdDok]                 VARCHAR (30)   NOT NULL,
    [AutorProfilu]          VARCHAR (40)   NULL,
    [RodzajDyrektywy]       CHAR (1)       NULL,
    [RodzajDyrektywyPid]    INT            NULL,
    [Adresat]               VARCHAR (16)   NULL,
    [Status]                CHAR (1)       NULL,
    [Tresc]                 VARCHAR (1024) NULL,
    [NrDyrektywy]           NUMERIC (5)    NOT NULL,
    [IdProfilu]             VARCHAR (40)   NULL,
    [KomentarzDyspozytora]  VARCHAR (512)  NULL,
    [KomentarzPoRealizacji] VARCHAR (512)  NULL,
    CONSTRAINT [PK_DT_Dyrektywa] PRIMARY KEY CLUSTERED ([IdDok] ASC, [NrDyrektywy] ASC)
);

