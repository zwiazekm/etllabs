CREATE TABLE [ncts2].[kontenery] (
    [id]                           BIGINT        NOT NULL,
    [towar_id]                     BIGINT        NULL,
    [nr]                           NVARCHAR (17) NULL,
    [poz_id]                       INT           NULL,
    [tryb_utworzenia_pozycji]      NVARCHAR (1)  NULL,
    [iteracja_uwag_rozladunkowych] SMALLINT      NULL,
    CONSTRAINT [kontenery_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

