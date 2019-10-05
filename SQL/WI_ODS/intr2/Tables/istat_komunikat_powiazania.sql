CREATE TABLE [intr2].[istat_komunikat_powiazania] (
    [id]             NUMERIC (19)  NOT NULL,
    [id_komunikatu]  NUMERIC (19)  NOT NULL,
    [id_dok_zrd]     NVARCHAR (30) NULL,
    [id_dok_wyn]     NVARCHAR (30) NULL,
    [id_dok_wyslany] BIGINT        NULL,
    [ustalenie]      NUMERIC (19)  NULL,
    CONSTRAINT [istat_komunikat_powiazania$PK_istat_komunikat_powiazania] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_INTR2],
    CONSTRAINT [istat_komunikat_powiazania$FK_istat_komunikat_powiazania__intr_ustalenia] FOREIGN KEY ([ustalenie]) REFERENCES [intr2].[intr_ustalenia] ([identity_id]),
    CONSTRAINT [istat_komunikat_powiazania$FK_istat_komunikat_powiazania__istat_dekl_wynik_dok] FOREIGN KEY ([id_dok_wyn]) REFERENCES [intr2].[istat_dekl_wynik_dok] ([id_dok]),
    CONSTRAINT [istat_komunikat_powiazania$FK_istat_komunikat_powiazania__istat_dok_zrodlowy] FOREIGN KEY ([id_dok_zrd]) REFERENCES [intr2].[istat_dok_zrodlowy] ([id_dok_zrd]),
    CONSTRAINT [istat_komunikat_powiazania$FK_istat_komunikat_powiazania__istat_komunikat] FOREIGN KEY ([id_komunikatu]) REFERENCES [intr2].[istat_komunikat] ([id]),
    CONSTRAINT [istat_komunikat_powiazania$UQ_istat_komunikat_powiazania] UNIQUE NONCLUSTERED ([id_komunikatu] ASC, [id_dok_zrd] ASC, [id_dok_wyn] ASC, [id_dok_wyslany] ASC) ON [FG_INTR2]
);

