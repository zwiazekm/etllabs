CREATE TABLE [stat].[dot_okres_sprawozd] (
    [id_pod]      VARCHAR (35)    NOT NULL,
    [nr_poz]      INT             NULL,
    [RokMc]       INT             NULL,
    [typ]         CHAR (1)        NULL,
    [status]      CHAR (1)        NULL,
    [id_jedn]     VARCHAR (20)    NOT NULL,
    [wsk_popraw]  CHAR (1)        NULL,
    [operator]    VARCHAR (40)    NULL,
    [data_zmiany] DATETIME        NULL,
    [roznica_V_I] DECIMAL (14, 2) NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_dot_okres_sprawozd_id_pod]
    ON [stat].[dot_okres_sprawozd]([id_pod] ASC, [RokMc] ASC, [typ] ASC, [status] ASC, [wsk_popraw] ASC);


GO
CREATE STATISTICS [data_zmiany]
    ON [stat].[dot_okres_sprawozd]([data_zmiany]);


GO
CREATE STATISTICS [id_jedn]
    ON [stat].[dot_okres_sprawozd]([id_jedn]);


GO
CREATE STATISTICS [nr_poz]
    ON [stat].[dot_okres_sprawozd]([nr_poz]);


GO
CREATE STATISTICS [operator]
    ON [stat].[dot_okres_sprawozd]([operator]);


GO
CREATE STATISTICS [roznica_V_I]
    ON [stat].[dot_okres_sprawozd]([roznica_V_I]);

