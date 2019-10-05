CREATE TABLE [ncts2].[towary_wrazliwe] (
    [towar_id]                     BIGINT          NULL,
    [kod]                          NVARCHAR (2)    NULL,
    [ilosc]                        NUMERIC (14, 3) NULL,
    [poz_id]                       INT             NULL,
    [id]                           BIGINT          NOT NULL,
    [tryb_utworzenia_pozycji]      NVARCHAR (1)    NULL,
    [iteracja_uwag_rozladunkowych] SMALLINT        NULL,
    CONSTRAINT [towary_wrazliwe_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

