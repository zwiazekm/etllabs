CREATE TABLE [osoz].[potwierdzenia_na_zabezpieczeniu] (
    [id]                     BIGINT          NOT NULL,
    [czas_modyfikacji]       DATETIME        NULL,
    [kwota_na_potwierdzeniu] NUMERIC (19, 2) NOT NULL,
    [status_wpisu]           VARCHAR (1)     NOT NULL,
    [potwierdzenie_id]       BIGINT          NOT NULL,
    [zabezpieczenie_id]      BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk7f4524a012fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id]),
    CONSTRAINT [fk7f4524a0982a9292] FOREIGN KEY ([potwierdzenie_id]) REFERENCES [osoz].[potwierdzenia] ([id])
);

