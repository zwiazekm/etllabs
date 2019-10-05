CREATE TABLE [cel].[dok_inny] (
    [id_dok]                        VARCHAR (30)    NOT NULL,
    [RodzDokZrd]                    VARCHAR (6)     NULL,
    [SymDokZrd]                     VARCHAR (40)    NULL,
    [Procedura]                     VARCHAR (6)     NULL,
    [Uwagi]                         VARCHAR (255)   NULL,
    [Status]                        CHAR (1)        NULL,
    [Wartosc]                       DECIMAL (17, 2) NULL,
    [Waluta]                        VARCHAR (3)     NULL,
    [Pozwolenie]                    VARCHAR (30)    NULL,
    [OdbiorcaEORI]                  VARCHAR (17)    NULL,
    [OdbiorcaTIN]                   VARCHAR (17)    NULL,
    [ZglaszajacyEORI]               VARCHAR (17)    NULL,
    [ZglaszajacyTIN]                VARCHAR (17)    NULL,
    [ZglaszajacyPrzedstawicielstwo] VARCHAR (1)     NULL,
    CONSTRAINT [PK_DOK_INNY] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_INNY_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);

