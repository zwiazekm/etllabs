CREATE TABLE [int].[intr_okres_sprawozd] (
    [id_pod]      VARCHAR (35)    NOT NULL,
    [nr_poz]      INT             NOT NULL,
    [rok]         INT             NULL,
    [typ]         CHAR (1)        NULL,
    [miesiac]     INT             NULL,
    [status]      CHAR (1)        NULL,
    [id_jedn]     VARCHAR (20)    NOT NULL,
    [wsk_popraw]  CHAR (1)        NULL,
    [operator]    VARCHAR (40)    NULL,
    [data_zmiany] DATETIME        NULL,
    [roznica_V_I] DECIMAL (14, 2) NULL,
    CONSTRAINT [PK_intr_okres_sprawozd] PRIMARY KEY CLUSTERED ([id_pod] ASC, [nr_poz] ASC, [id_jedn] ASC) WITH (FILLFACTOR = 70)
);

