CREATE TABLE [ncts2].[towary_uwagi] (
    [id]                           BIGINT         NOT NULL,
    [towar_id]                     BIGINT         NULL,
    [uwagi]                        NVARCHAR (140) NULL,
    [uwagi_jezyk]                  NVARCHAR (2)   NULL,
    [tryb_utworzenia_pozycji]      NVARCHAR (1)   NULL,
    [iteracja_uwag_rozladunkowych] SMALLINT       NULL,
    CONSTRAINT [towary_uwagi_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

