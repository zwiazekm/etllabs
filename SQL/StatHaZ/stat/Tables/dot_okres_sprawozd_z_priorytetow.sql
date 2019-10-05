CREATE TABLE [stat].[dot_okres_sprawozd_z_priorytetow] (
    [id_pod]      VARCHAR (35)    NOT NULL,
    [priorytet]   VARCHAR (1)     NULL,
    [nr_poz]      INT             NULL,
    [rok]         INT             NULL,
    [typ]         CHAR (1)        NULL,
    [miesiac]     INT             NULL,
    [status]      CHAR (1)        NULL,
    [id_jedn]     VARCHAR (20)    NOT NULL,
    [wsk_popraw]  CHAR (1)        NULL,
    [operator]    VARCHAR (40)    NULL,
    [data_zmiany] DATETIME        NULL,
    [roznica_V_I] DECIMAL (14, 2) NULL
);

