CREATE TABLE [intr2].[istat_komunikat_powiazania] (
    [id]             NUMERIC (19)  NOT NULL,
    [id_komunikatu]  NUMERIC (19)  NOT NULL,
    [id_dok_zrd]     NVARCHAR (30) NULL,
    [id_dok_wyn]     NVARCHAR (30) NULL,
    [id_dok_wyslany] BIGINT        NULL,
    [ustalenie]      NUMERIC (19)  NULL,
    CONSTRAINT [istat_komunikat_powiazania$PK_istat_komunikat_powiazania] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [istat_komunikat_powiazania$UQ_istat_komunikat_powiazania] UNIQUE NONCLUSTERED ([id_komunikatu] ASC, [id_dok_zrd] ASC, [id_dok_wyn] ASC, [id_dok_wyslany] ASC)
);

