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
    CONSTRAINT [istat_dok_wyslany$PK_istat_dok_wyslany] PRIMARY KEY CLUSTERED ([id] ASC)
);

