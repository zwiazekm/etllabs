CREATE TABLE [osoz].[procedury_pdr] (
    [id]                 BIGINT        NOT NULL,
    [czas_modyfikacji]   DATETIME      NULL,
    [kod]                VARCHAR (2)   NOT NULL,
    [nazwa]              VARCHAR (255) NULL,
    [procedura_celna_id] BIGINT        NULL,
    [aktywna]            BIT           NOT NULL,
    [id_pdr]             INT           NULL,
    CONSTRAINT [PK__procedur__3213E83F8806BBAD] PRIMARY KEY CLUSTERED ([id] ASC)
);

