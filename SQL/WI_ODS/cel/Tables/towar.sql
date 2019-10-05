CREATE TABLE [cel].[towar] (
    [id_dok]        VARCHAR (30)    NOT NULL,
    [PozId]         NUMERIC (2)     NOT NULL,
    [OpisTowaru]    VARCHAR (1024)  NULL,
    [LiczbaOpak]    NUMERIC (14)    NULL,
    [OpisOpak]      VARCHAR (255)   NULL,
    [MasaNetto]     NUMERIC (14)    NULL,
    [MasaBrutto]    NUMERIC (14)    NULL,
    [WarTowaru]     NUMERIC (14, 2) NULL,
    [IloscTowaru]   NUMERIC (14)    NULL,
    [JednMiary]     VARCHAR (10)    NULL,
    [MiejscZlozTow] VARCHAR (80)    NULL,
    [KrajPoch]      VARCHAR (2)     NULL,
    [KodTowaru]     VARCHAR (10)    NULL,
    [Procedura]     VARCHAR (4)     NULL,
    [KrajWysylki]   VARCHAR (2)     NULL,
    CONSTRAINT [PK_TOWAR] PRIMARY KEY CLUSTERED ([id_dok] ASC, [PozId] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_TOWAR_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);

