CREATE TABLE [osoz].[gwarancje_na_zabezpieczeniach] (
    [id]                                BIGINT          NOT NULL,
    [czas_modyfikacji]                  DATETIME        NULL,
    [kwota_gwarancji_na_zabezpieczeniu] NUMERIC (19, 2) NOT NULL,
    [status_wpisu]                      VARCHAR (1)     NOT NULL,
    [gwarancja_id]                      BIGINT          NOT NULL,
    [zabezpieczenie_id]                 BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fkb4e1619612fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id]),
    CONSTRAINT [fkb4e161968f999d72] FOREIGN KEY ([gwarancja_id]) REFERENCES [osoz].[gwarancje] ([id])
);

