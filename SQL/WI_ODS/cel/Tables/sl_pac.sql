CREATE TABLE [cel].[sl_pac] (
    [id_jedn]     NVARCHAR (10)  NOT NULL,
    [id_jedn_nad] NVARCHAR (10)  NULL,
    [nazwa_jedn]  NVARCHAR (255) NULL,
    [nazwa]       NVARCHAR (250) NULL,
    [granica]     NVARCHAR (1)   NULL,
    CONSTRAINT [PK_sl_pac] PRIMARY KEY CLUSTERED ([id_jedn] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

