CREATE TABLE [ncts2].[opakowania] (
    [towar_id]                     BIGINT        NULL,
    [rodzaj]                       NVARCHAR (3)  NULL,
    [znaki]                        NVARCHAR (42) NULL,
    [liczba_opakowan]              INT           NULL,
    [ilosc_sztuk]                  INT           NULL,
    [id]                           BIGINT        NOT NULL,
    [poz_id]                       INT           NULL,
    [tryb_utworzenia_pozycji]      NVARCHAR (1)  NULL,
    [iteracja_uwag_rozladunkowych] SMALLINT      NULL,
    [znaki_jezyk]                  NVARCHAR (2)  NULL,
    CONSTRAINT [opakowania_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [opakowania_towar_id_towary_fk] FOREIGN KEY ([towar_id]) REFERENCES [ncts2].[towary] ([id])
);

