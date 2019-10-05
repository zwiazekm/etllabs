﻿CREATE TABLE [her].[ad_kat_org] (
    [iduni]             INT           NOT NULL,
    [id0]               INT           NULL,
    [id]                INT           NULL,
    [idpow]             INT           NULL,
    [idwar]             INT           NULL,
    [poz]               INT           NULL,
    [poziom]            INT           NULL,
    [polozenie]         VARCHAR (255) NULL,
    [symbol]            VARCHAR (50)  NOT NULL,
    [nazwa]             VARCHAR (200) NULL,
    [stan]              INT           NULL,
    [status]            INT           NULL,
    [idprac]            INT           NULL,
    [dataod]            DATETIME      NULL,
    [datado]            DATETIME      NULL,
    [idroz_od]          INT           NULL,
    [idroz_do]          INT           NULL,
    [idkod_od]          INT           NULL,
    [idkod_do]          INT           NULL,
    [idrodz]            INT           NULL,
    [idpion]            INT           NULL,
    [idtyp]             INT           NULL,
    [idpoczta]          INT           NULL,
    [idgmina]           INT           NULL,
    [idpowiat]          INT           NULL,
    [idwoj]             INT           NULL,
    [idkraj]            INT           NULL,
    [miejscowosc]       VARCHAR (50)  NULL,
    [ulica]             VARCHAR (50)  NULL,
    [dom]               VARCHAR (50)  NULL,
    [lokal]             VARCHAR (50)  NULL,
    [nuts]              VARCHAR (50)  NULL,
    [opis]              VARCHAR (500) NULL,
    [idzak]             INT           NULL,
    [k_zak]             VARCHAR (9)   NULL,
    [k_je]              VARCHAR (9)   NULL,
    [k_fi]              VARCHAR (50)  NULL,
    [k_dod]             VARCHAR (50)  NULL,
    [idstru]            INT           NULL,
    [k_pl]              VARCHAR (50)  NULL,
    [k_gm]              VARCHAR (50)  NULL,
    [k_pr]              VARCHAR (50)  NULL,
    [k_wi]              VARCHAR (50)  NULL,
    [k_cz]              VARCHAR (50)  NULL,
    [k_pz]              VARCHAR (50)  NULL,
    [k_pt]              VARCHAR (50)  NULL,
    [add_user]          INT           NULL,
    [add_data]          DATETIME      NULL,
    [up_user]           INT           NULL,
    [up_data]           DATETIME      NULL,
    [opis2]             VARCHAR (500) NULL,
    [email]             VARCHAR (255) NULL,
    [link]              VARCHAR (255) NULL,
    [tery]              VARCHAR (255) NULL,
    [idteryt]           INT           NULL,
    [idobszar]          INT           NULL,
    [idregion]          INT           NULL,
    [szczebel]          SMALLINT      NULL,
    [tel]               VARCHAR (50)  NULL,
    [tel2]              VARCHAR (50)  NULL,
    [fax]               VARCHAR (50)  NULL,
    [datalik]           DATETIME      NULL,
    [poczta]            VARCHAR (50)  NULL,
    [gmina]             VARCHAR (50)  NULL,
    [powiat]            VARCHAR (50)  NULL,
    [idjo]              INT           NULL,
    [pozycja_mld]       INT           NULL,
    [kodSowa]           VARCHAR (50)  NULL,
    [idPionSzkol]       INT           NULL,
    [isOddzial]         BIT           NULL,
    [idOddzTyp]         INT           NULL,
    [idOddzRodzaj]      INT           NULL,
    [idOddzRuch]        INT           NULL,
    [isDaily]           BIT           NULL,
    [timeFrom]          DATETIME      NULL,
    [timeTo]            DATETIME      NULL,
    [idEtatKier]        INT           NULL,
    [polozenieEtatKier] VARCHAR (255) NULL,
    [idWorkMode]        INT           NULL,
    CONSTRAINT [PK_ad_kat_org] PRIMARY KEY CLUSTERED ([iduni] ASC) WITH (FILLFACTOR = 90)
);

