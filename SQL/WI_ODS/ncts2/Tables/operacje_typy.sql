CREATE TABLE [ncts2].[operacje_typy] (
    [id]                  BIGINT        NOT NULL,
    [operacja]            NVARCHAR (40) NULL,
    [widocznosc_operacji] BIT           NULL,
    CONSTRAINT [operacje_typy_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
);

