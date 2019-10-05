﻿CREATE TABLE [zef].[dok_sad] (
    [id_dok]            VARCHAR (30)    NOT NULL,
    [plat_id_komor]     VARCHAR (20)    NULL,
    [plat_id_kontr]     NUMERIC (10)    NULL,
    [gwar_id_komorki]   VARCHAR (20)    NULL,
    [gwar_id_kontr]     NUMERIC (10)    NULL,
    [plat_id_centr]     NUMERIC (10)    NULL,
    [gwar_id_centr]     NUMERIC (10)    NULL,
    [nr_dok_spraw]      VARCHAR (30)    NULL,
    [id_proc]           CHAR (6)        NULL,
    [data_powiad]       DATETIME        NULL,
    [form_plat]         CHAR (6)        NULL,
    [term_plat]         DATETIME        NULL,
    [poz_rej_dlug]      NUMERIC (15)    NULL,
    [data_wygas_dlugu]  DATETIME        NULL,
    [nr_wyk_szczeg]     VARCHAR (30)    NULL,
    [poz_wyk_szczeg]    INT             NULL,
    [typ]               CHAR (1)        NULL,
    [id_jedn]           VARCHAR (20)    NULL,
    [dat_powst_dlugu]   DATETIME        NULL,
    [data_zak]          DATETIME        NULL,
    [kwota_zab]         NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [okres_tor]         DATETIME        NULL,
    [typ_odroczenia]    CHAR (10)       NULL,
    [termin_plat_odr]   DATETIME        NULL,
    [id_dok_odroczenia] VARCHAR (30)    NULL,
    [sym_odroczenia]    VARCHAR (30)    NULL,
    [data_od]           DATETIME        NULL,
    [data_do]           DATETIME        NULL,
    [okres_rozl]        DATETIME        NULL,
    [ter_odrocz]        INT             NULL,
    [id_proc_celina]    CHAR (2)        NULL,
    [data_zwol_towar]   DATETIME        NULL,
    [celina_zwol_towar] CHAR (1)        NULL,
    [rodzaj]            CHAR (1)        NULL,
    [kwota_dod_zab]     NUMERIC (20, 2) DEFAULT ((0)) NULL,
    [flg_dod_zab]       CHAR (1)        NULL,
    [cln_typ_sad]       CHAR (1)        NULL,
    [data_zab]          DATETIME        NULL,
    [us]                CHAR (1)        NULL,
    [sasp]              VARCHAR (30)    NULL,
    CONSTRAINT [PK_DOK_SAD] PRIMARY KEY CLUSTERED ([id_dok] ASC)
);

