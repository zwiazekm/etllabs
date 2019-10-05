CREATE TABLE [zef].[dok_wplaty] (
    [id_dok]         VARCHAR (30)    NOT NULL,
    [nr_poz]         SMALLINT        NULL,
    [form_plat]      CHAR (6)        NULL,
    [sernum]         CHAR (20)       NULL,
    [rodzaj]         CHAR (2)        NULL,
    [bank_dluz]      VARCHAR (80)    NULL,
    [konto_dluz]     VARCHAR (60)    NULL,
    [bank_wierz]     VARCHAR (80)    NULL,
    [konto_wierz]    VARCHAR (60)    NULL,
    [kwota]          NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [tyt_plat]       VARCHAR (9)     NULL,
    [kwota_rozl]     NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [id_jedn]        VARCHAR (20)    NULL,
    [id_ksieg_kas]   SMALLINT        NULL,
    [poz_wyk_szczeg] INT             NULL,
    [rozdzial]       VARCHAR (9)     NULL,
    [paragraf]       VARCHAR (9)     NULL,
    [zad_inwest]     VARCHAR (9)     NULL,
    CONSTRAINT [PK_DOK_WPLATY] PRIMARY KEY CLUSTERED ([id_dok] ASC)
);

