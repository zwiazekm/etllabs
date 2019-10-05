CREATE TABLE [shz].[StatHaZ_import] (
    [Id]                   INT          IDENTITY (1, 1) NOT NULL,
    [KodTowaru]            VARCHAR (8)  NULL,
    [KodKrajuPochodzenia]  CHAR (2)     NULL,
    [KodKrajuWysylki]      CHAR (2)     NULL,
    [ImporterREGON]        VARCHAR (14) NULL,
    [RokMc]                INT          NULL,
    [KodRodzajuTransakcji] CHAR (2)     NULL,
    [KodTransportu]        CHAR (1)     NULL,
    [KodWarunkowDostawy]   VARCHAR (3)  NULL,
    [KodIzbyCelnej]        CHAR (2)     NULL,
    [KodProceduryCelnej]   VARCHAR (4)  NULL,
    [ZnacznikKatProgowej]  CHAR (1)     NULL,
    [MasaNetto]            BIGINT       NULL,
    [Ilosc]                BIGINT       NULL,
    [WartStatPLN]          BIGINT       NULL,
    [WartStatUSD]          BIGINT       NULL,
    [WartStatEUR]          BIGINT       NULL,
    CONSTRAINT [PK_import] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_SHZ]
);


GO
CREATE NONCLUSTERED INDEX [IX_import_KodTowaru]
    ON [shz].[StatHaZ_import]([KodTowaru] ASC)
    ON [FG_SHZ];


GO
CREATE NONCLUSTERED INDEX [IX_import_RokMc]
    ON [shz].[StatHaZ_import]([RokMc] ASC)
    ON [FG_SHZ];

