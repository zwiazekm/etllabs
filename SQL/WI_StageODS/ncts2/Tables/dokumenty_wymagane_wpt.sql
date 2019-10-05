CREATE TABLE [ncts2].[dokumenty_wymagane_wpt] (
    [towar_id]                     BIGINT        NULL,
    [kod]                          NVARCHAR (4)  NULL,
    [nr]                           NVARCHAR (35) NULL,
    [uwagi]                        NVARCHAR (26) NULL,
    [id]                           BIGINT        NOT NULL,
    [poz_id]                       INT           NULL,
    [tryb_utworzenia_pozycji]      NVARCHAR (1)  NULL,
    [iteracja_uwag_rozladunkowych] SMALLINT      NULL,
    [nr_jezyk]                     NVARCHAR (2)  NULL,
    [uwagi_jezyk]                  NVARCHAR (2)  NULL,
    CONSTRAINT [dokumenty_wymagane_wpt_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

