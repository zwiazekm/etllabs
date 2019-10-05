CREATE TABLE [osoz].[inna_forma] (
    [id]                      BIGINT          NOT NULL,
    [czas_modyfikacji]        DATETIME        NULL,
    [kwota]                   NUMERIC (19, 2) NULL,
    [opis_innej_formy]        TEXT            NOT NULL,
    [status_wpisu]            VARCHAR (1)     NOT NULL,
    [forma_zabezpieczenia_id] BIGINT          NOT NULL,
    [pokwitowanie_id]         BIGINT          NULL,
    [zabezpieczenie_id]       BIGINT          NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk4df092e212fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id]),
    CONSTRAINT [fk4df092e24792384d] FOREIGN KEY ([forma_zabezpieczenia_id]) REFERENCES [osoz].[forma_zabezpieczenia] ([id]),
    CONSTRAINT [fk4df092e2cac4ee22] FOREIGN KEY ([pokwitowanie_id]) REFERENCES [osoz].[pokwitowania] ([id])
) TEXTIMAGE_ON [FG_OSOZ];

