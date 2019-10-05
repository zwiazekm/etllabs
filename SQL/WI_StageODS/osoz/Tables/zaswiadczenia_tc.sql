CREATE TABLE [osoz].[zaswiadczenia_tc] (
    [id]                  BIGINT       NOT NULL,
    [czas_modyfikacji]    DATETIME     NULL,
    [numer_seryjny_druku] VARCHAR (25) NOT NULL,
    [rodzaj_druku]        VARCHAR (5)  NOT NULL,
    [zabezpieczenie_id]   BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

