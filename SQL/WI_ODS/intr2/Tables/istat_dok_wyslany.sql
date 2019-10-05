CREATE TABLE [intr2].[istat_dok_wyslany] (
    [id_dok_zrd]        NVARCHAR (30) NULL,
    [id_dok]            NVARCHAR (30) NULL,
    [identyfikator]     NVARCHAR (30) NULL,
    [typ]               NVARCHAR (20) NOT NULL,
    [data_wyslania]     DATETIME2 (3) NULL,
    [data_dostarczenia] DATETIME2 (3) NULL,
    [xml]               NTEXT         NOT NULL,
    [podtyp]            NCHAR (1)     NULL,
    [id]                BIGINT        NOT NULL,
    CONSTRAINT [istat_dok_wyslany$PK_istat_dok_wyslany] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_INTR2],
    CONSTRAINT [istat_dok_wyslany$FK_ISTAT_DOK_WYSL_REFERENCE_DEKL_WYN] FOREIGN KEY ([id_dok]) REFERENCES [intr2].[istat_dekl_wynik_dok] ([id_dok]),
    CONSTRAINT [istat_dok_wyslany$FK_ISTAT_DOK_WYSL_REFERENCE_DOK_ZR] FOREIGN KEY ([id_dok_zrd]) REFERENCES [intr2].[istat_dok_zrodlowy] ([id_dok_zrd])
) TEXTIMAGE_ON [FG_INTR2];

