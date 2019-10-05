CREATE TABLE [ncts2].[UCTranzytowe] (
    [IdOperacjiTranzytowej]           BIGINT       NULL,
    [UCTranzytowy]                    NVARCHAR (8) NULL,
    [CzasPrzybycia]                   DATETIME     NULL,
    [Id]                              BIGINT       NOT NULL,
    [IdPozycji]                       INT          NULL,
    [StatusUCTranzytowy]              NVARCHAR (8) NULL,
    [DataZmianyStatusuUCTranzytowym]  DATETIME     NULL,
    [RyzykoUCTranzytowy]              INT          NULL,
    [StatusAnalizyRyzykaUCTranzytowy] NVARCHAR (1) NULL,
    CONSTRAINT [UCTranzytowe_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

