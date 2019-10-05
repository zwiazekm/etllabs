﻿CREATE TABLE [emcs2].[REF_SD2_PODMIOTY] (
    [NRA]                      VARCHAR (13)    COLLATE Polish_CS_AS NOT NULL,
    [TYP]                      NVARCHAR (15)   NOT NULL,
    [NAZWA]                    NVARCHAR (900)  NOT NULL,
    [NIP]                      NVARCHAR (105)  NOT NULL,
    [REGON]                    NVARCHAR (42)   NULL,
    [KOD_KRAJU]                NVARCHAR (6)    NOT NULL,
    [ULICA]                    NVARCHAR (210)  NULL,
    [NR_DOMU]                  NVARCHAR (33)   NOT NULL,
    [NR_LOKALU]                NVARCHAR (30)   NULL,
    [MIEJSCOWOSC]              NVARCHAR (180)  NULL,
    [KOD_POCZTOWY]             NVARCHAR (30)   NOT NULL,
    [POCZTA]                   NVARCHAR (180)  NULL,
    [UC_NADZORU]               VARCHAR (8)     NULL,
    [OBOWIAZUJE_OD]            DATETIME2 (0)   NOT NULL,
    [OBOWIAZUJE_DO]            DATETIME2 (0)   NOT NULL,
    [WYSYLAJACY]               VARCHAR (13)    NULL,
    [INT_DOMYSLNY]             NVARCHAR (3)    NULL,
    [INT_PODSTAWOWY_EMAIL]     NVARCHAR (381)  NULL,
    [INT_EMAIL]                NVARCHAR (720)  NULL,
    [INT_WS_LOGIN]             NVARCHAR (60)   NULL,
    [INT_WS_HASLO]             NVARCHAR (60)   NULL,
    [INT_WS_ADRES]             NVARCHAR (3072) NULL,
    [UC_WYDANIA]               VARCHAR (8)     NOT NULL,
    [INT_WS_EMCS_HASLO]        NVARCHAR (60)   NULL,
    [INT_WS_X509_THUMBPRINT]   NVARCHAR (750)  NULL,
    [CZY_DOSTAWA_BEZPOSREDNIA] CHAR (1)        NULL,
    [WLASCICIEL]               VARCHAR (13)    NULL,
    [ID_SISC]                  VARCHAR (50)    NULL,
    CONSTRAINT [PK_REF_SD2_PODMIOTY] PRIMARY KEY CLUSTERED ([NRA] ASC, [TYP] ASC)
);

