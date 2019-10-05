CREATE TABLE [pdr].[c4000_statusosoby] (
    [c4000_statusosoby_id]   BIGINT      NOT NULL,
    [datado]                 DATE        NULL,
    [dataod]                 DATE        NULL,
    [rejestracjauproszczona] BIT         NULL,
    [status]                 VARCHAR (1) NOT NULL,
    [c4000_id]               BIGINT      NULL,
    PRIMARY KEY CLUSTERED ([c4000_statusosoby_id] ASC)
);

