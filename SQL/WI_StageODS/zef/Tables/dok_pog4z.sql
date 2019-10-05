CREATE TABLE [zef].[dok_pog4z] (
    [id_dok]          VARCHAR (30)    NOT NULL,
    [zalacznik]       CHAR (2)        NOT NULL,
    [nr_zal]          INT             NOT NULL,
    [numer]           VARCHAR (10)    NULL,
    [okres]           DATETIME        NULL,
    [rodzaj]          VARCHAR (10)    NULL,
    [id_dok_stow]     VARCHAR (30)    NULL,
    [sym_dok_stow]    VARCHAR (40)    NULL,
    [data_wystaw_dok] DATETIME        NULL,
    [opis]            VARCHAR (255)   NULL,
    [p_1]             NUMERIC (20, 2) NULL,
    [p_2]             NUMERIC (20, 2) NULL,
    [p_3]             NUMERIC (20, 2) NULL,
    [p_4]             NUMERIC (20, 2) NULL,
    [p_5]             NUMERIC (20, 2) NULL,
    [p_6]             NUMERIC (20, 2) NULL,
    [nr_poz_ewid]     SMALLINT        NULL,
    [nazwa]           VARCHAR (80)    NULL,
    [data_wyd]        DATETIME        NULL,
    CONSTRAINT [PK_DOK_POG4Z] PRIMARY KEY CLUSTERED ([id_dok] ASC, [zalacznik] ASC, [nr_zal] ASC)
);

