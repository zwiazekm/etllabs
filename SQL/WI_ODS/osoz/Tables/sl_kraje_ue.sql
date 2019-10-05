CREATE TABLE [osoz].[sl_kraje_ue] (
    [id]                  BIGINT        NOT NULL,
    [czas_modyfikacji]    DATETIME      NULL,
    [aktywna]             BIT           NOT NULL,
    [kod]                 VARCHAR (2)   NOT NULL,
    [nazwa]               VARCHAR (255) NOT NULL,
    [opis]                VARCHAR (255) NULL,
    [waznosc_komunikatow] INT           NULL,
    [id_pdr]              INT           NULL,
    PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ]
);

