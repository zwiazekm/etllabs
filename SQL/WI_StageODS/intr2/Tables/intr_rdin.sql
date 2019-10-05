CREATE TABLE [intr2].[intr_rdin] (
    [NIP]               NVARCHAR (10) NULL,
    [rok]               INT           NULL,
    [miesiac]           INT           NULL,
    [wersja_dek]        INT           NULL,
    [kod_us]            NVARCHAR (4)  NULL,
    [trans_nabycie]     DECIMAL (14)  NULL,
    [trans_dostawa]     DECIMAL (14)  NULL,
    [poprawnosc]        NCHAR (1)     NULL,
    [status_us]         NCHAR (1)     NULL,
    [rodz_dekl]         NCHAR (1)     NULL,
    [data_aktualizacji] DATETIME2 (3) NOT NULL,
    [id_rdin]           BIGINT        NOT NULL,
    CONSTRAINT [intr_rdin$PK_INTR_RDIN] PRIMARY KEY CLUSTERED ([id_rdin] ASC)
);

