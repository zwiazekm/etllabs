CREATE TABLE [ncts2].[upowazniony_odbiorca] (
    [id]                      BIGINT        NOT NULL,
    [data_zapytania]          DATETIME      NULL,
    [data_odpowiedzi]         DATETIME      NULL,
    [status]                  NVARCHAR (10) NULL,
    [tin]                     NVARCHAR (17) NULL,
    [urzad_pytany]            NVARCHAR (8)  NULL,
    [komunikat_zapytania_id]  BIGINT        NULL,
    [komunikat_odpowiedzi_id] BIGINT        NULL,
    [kod_odpowiedzi]          NVARCHAR (1)  NULL,
    [urzad_pytajacy]          NVARCHAR (8)  NULL,
    CONSTRAINT [upowazniony_odbiorca_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [upowazniony_odbiorca_komunikat_odpowiedzi_id_id_fk] FOREIGN KEY ([komunikat_odpowiedzi_id]) REFERENCES [ncts2].[komunikaty] ([id]),
    CONSTRAINT [upowazniony_odbiorca_komunikat_zapytania_id_id_fk] FOREIGN KEY ([komunikat_zapytania_id]) REFERENCES [ncts2].[komunikaty] ([id])
);

