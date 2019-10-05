CREATE TABLE [intr2].[istat_blad_zrodlowy] (
    [id_bledu]    NVARCHAR (30)   NOT NULL,
    [id_dok]      NVARCHAR (30)   NULL,
    [sym_dok]     NVARCHAR (40)   NULL,
    [kod]         NVARCHAR (255)  NULL,
    [komunikat]   NVARCHAR (1360) NULL,
    [identity_id] BIGINT          NOT NULL,
    [pozycja]     INT             NULL,
    CONSTRAINT [istat_blad_zrodlowy$PK_ISTAT_BLAD_ZRODLOWY] PRIMARY KEY CLUSTERED ([id_bledu] ASC) ON [FG_INTR2]
);

