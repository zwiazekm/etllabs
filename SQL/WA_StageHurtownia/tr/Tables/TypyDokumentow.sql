CREATE TABLE [tr].[TypyDokumentow] (
    [Id]                          VARCHAR (6)   NOT NULL,
    [CzyTranzytowy]               BIT           NULL,
    [NazwaPL]                     VARCHAR (350) NULL,
    [NazwaEN]                     VARCHAR (350) NULL,
    [CzyWysylanyDoDomenyWspolnej] BIT           NULL,
    [ZalaczonyCzyPoprzedni]       CHAR (1)      NOT NULL,
    CONSTRAINT [PK_TypyDokumentow] PRIMARY KEY CLUSTERED ([Id] ASC)
);

