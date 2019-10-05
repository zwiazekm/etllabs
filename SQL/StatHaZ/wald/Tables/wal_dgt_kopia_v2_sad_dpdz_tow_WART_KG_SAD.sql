﻿CREATE TABLE [wald].[wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD] (
    [stat]                 CHAR (1)        NULL,
    [koment]               VARCHAR (50)    NULL,
    [uname]                NVARCHAR (50)   NULL,
    [idDokNr]              BIGINT          NOT NULL,
    [PozId]                SMALLINT        NOT NULL,
    [OpisTowaru]           VARCHAR (1000)  NULL,
    [KodTowarowy]          VARCHAR (8)     NULL,
    [KodTaric]             VARCHAR (2)     NULL,
    [KrajPochodzenia]      VARCHAR (2)     NULL,
    [MasaBrutto]           DECIMAL (14, 3) NULL,
    [Preferencje]          CHAR (3)        NULL,
    [Procedura]            VARCHAR (4)     NULL,
    [ProceduraSzczegoly]   VARCHAR (3)     NULL,
    [MasaNetto]            DECIMAL (14, 3) NULL,
    [IloscUzupelniajacaJm] DECIMAL (11)    NULL,
    [WartoscPozycji]       DECIMAL (17, 2) NULL,
    [WartoscStatystyczna]  BIGINT          NULL,
    [generacjaId]          INT             NOT NULL,
    [wart_kg]              NUMERIC (38, 2) NULL,
    CONSTRAINT [PK_wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) ON [WaldDane]
);


GO

CREATE TRIGGER [wald].[uname_wart_kg_sad] ON wald.wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD 
FOR UPDATE
AS
update [wald].[wal_dgt_kopia_v2_sad_dpdz_tow_WART_KG_SAD] 
set uname=suser_sname()
where idDokNr in(select idDokNr from deleted) and PozId in(select PozId from deleted)