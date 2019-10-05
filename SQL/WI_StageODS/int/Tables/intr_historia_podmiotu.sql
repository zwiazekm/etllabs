CREATE TABLE [int].[intr_historia_podmiotu] (
    [id_poz]        VARCHAR (30)  NOT NULL,
    [id_pod]        VARCHAR (35)  NULL,
    [data_zmiany]   DATETIME      NULL,
    [operator]      VARCHAR (30)  NULL,
    [nazwa_dw]      VARCHAR (30)  NULL,
    [pozycja]       SMALLINT      NULL,
    [nazwa_danej]   VARCHAR (255) NULL,
    [wartosc_przed] VARCHAR (255) NULL,
    [wartosc_po]    VARCHAR (255) NULL,
    [komentarz]     VARCHAR (255) NULL,
    CONSTRAINT [PK_INTR_HISTORIA_PODMIOTU] PRIMARY KEY CLUSTERED ([id_poz] ASC) WITH (FILLFACTOR = 90)
);

