CREATE TABLE [cel].[sl_p13] (
    [code]        CHAR (10)    NOT NULL,
    [description] VARCHAR (50) NULL,
    CONSTRAINT [PK_sl_p13] PRIMARY KEY CLUSTERED ([code] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

