CREATE TABLE [cel].[sl_status_sad] (
    [status] CHAR (1)     NOT NULL,
    [opis]   VARCHAR (20) NULL,
    CONSTRAINT [PK_sl_status_sad] PRIMARY KEY CLUSTERED ([status] ASC) WITH (FILLFACTOR = 90)
);

