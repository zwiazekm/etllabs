CREATE TABLE [osoz].[zwrot_kwoty_zabezpieczenia] (
    [id]                BIGINT          NOT NULL,
    [czas_modyfikacji]  DATETIME        NULL,
    [calosciowy]        BIT             NOT NULL,
    [data_zwrotu]       DATETIME        NOT NULL,
    [kwota_glowna]      NUMERIC (19, 2) NOT NULL,
    [kwota_zwrotu]      NUMERIC (19, 2) NOT NULL,
    [oprocentowanie]    NUMERIC (19, 2) NOT NULL,
    [podstawa_zwrotu]   VARCHAR (255)   NOT NULL,
    [zabezpieczenie_id] BIGINT          NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk4c0913b012fbda82] FOREIGN KEY ([zabezpieczenie_id]) REFERENCES [osoz].[zabezpieczenia] ([id])
);

