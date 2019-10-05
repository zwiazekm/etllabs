CREATE TABLE [cel].[sl_potwiwywóz] (
    [PotwWywozu] CHAR (10) NOT NULL,
    [opis]       CHAR (10) NULL,
    CONSTRAINT [PK_sl_potwiwywóz] PRIMARY KEY CLUSTERED ([PotwWywozu] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

