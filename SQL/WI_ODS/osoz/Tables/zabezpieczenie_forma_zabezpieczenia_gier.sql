CREATE TABLE [osoz].[zabezpieczenie_forma_zabezpieczenia_gier] (
    [id]                      BIGINT          NOT NULL,
    [czas_modyfikacji]        DATETIME        NULL,
    [status_wpisu]            VARCHAR (1)     NOT NULL,
    [wartosc_zabezpieczenia]  NUMERIC (19, 2) NULL,
    [forma_zabezpieczenia_id] BIGINT          NOT NULL,
    [gwarancja_id]            BIGINT          NULL,
    [hipoteka_id]             BIGINT          NULL,
    [zabezpieczenie_id]       BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk5802a5b112fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id]),
    CONSTRAINT [fk5802a5b14792384d] FOREIGN KEY ([forma_zabezpieczenia_id]) REFERENCES [osoz].[forma_zabezpieczenia] ([id]),
    CONSTRAINT [fk5802a5b18f999d72] FOREIGN KEY ([gwarancja_id]) REFERENCES [osoz].[gwarancje] ([id]),
    CONSTRAINT [fk5802a5b1fc15a22] FOREIGN KEY ([hipoteka_id]) REFERENCES [osoz].[hipoteki] ([id])
);

