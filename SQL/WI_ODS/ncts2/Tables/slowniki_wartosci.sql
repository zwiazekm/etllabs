﻿CREATE TABLE [ncts2].[slowniki_wartosci] (
    [id]             BIGINT          NOT NULL,
    [slownik_typ_id] BIGINT          NULL,
    [kod]            NVARCHAR (100)  NULL,
    [wazny_od]       DATETIME        NULL,
    [wazny_do]       DATETIME        NULL,
    [opis]           NVARCHAR (2000) NULL,
    [opis_en]        NVARCHAR (2000) NULL,
    CONSTRAINT [slowniki_wartosci_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [slowniki_wartosci_slownik_typ_id_id_fk] FOREIGN KEY ([slownik_typ_id]) REFERENCES [ncts2].[slowniki_typy] ([id])
);

