﻿CREATE TABLE [cel].[dok_sad] (
    [id_dok]          VARCHAR (30)    NOT NULL,
    [typ_dok]         VARCHAR (2)     NULL,
    [P1Symbol]        VARCHAR (2)     NULL,
    [P1Kod]           CHAR (1)        NULL,
    [P1SymTran]       VARCHAR (4)     NULL,
    [P4]              NUMERIC (3)     NULL,
    [P5]              NUMERIC (2)     NULL,
    [P6]              NUMERIC (7)     NULL,
    [P7]              VARCHAR (40)    NULL,
    [P9Agencja]       CHAR (1)        NULL,
    [P9NazwiskoImie]  VARCHAR (40)    NULL,
    [P9Tel]           VARCHAR (20)    NULL,
    [P11]             VARCHAR (2)     NULL,
    [P12]             NUMERIC (14, 2) NULL,
    [P13]             CHAR (1)        NULL,
    [P15a]            VARCHAR (2)     NULL,
    [P17a]            VARCHAR (2)     NULL,
    [P19]             CHAR (1)        NULL,
    [P20KodDost]      VARCHAR (3)     NULL,
    [P20MiejsceDost]  VARCHAR (35)    NULL,
    [P20KrajDost]     VARCHAR (2)     NULL,
    [P22SymbolWal]    VARCHAR (3)     NULL,
    [P22Wartosc]      NUMERIC (14, 2) NULL,
    [P23]             NUMERIC (12, 4) NULL,
    [P24]             VARCHAR (2)     NULL,
    [P25]             VARCHAR (2)     NULL,
    [P29IdJedn]       VARCHAR (6)     NULL,
    [P29Pas]          VARCHAR (2)     NULL,
    [P35]             NUMERIC (14)    NULL,
    [P48]             VARCHAR (20)    NULL,
    [P49SCWOC]        CHAR (1)        NULL,
    [P49NrRodz]       VARCHAR (9)     NULL,
    [P49Rok]          NUMERIC (4)     NULL,
    [P49WOC]          VARCHAR (255)   NULL,
    [P53UCPrzezn]     VARCHAR (40)    NULL,
    [P53Kraj]         VARCHAR (2)     NULL,
    [DataFormPrzyj]   DATETIME        NULL,
    [WPGPUC]          CHAR (1)        NULL,
    [OdpPU]           CHAR (1)        NULL,
    [ZwolTowar]       CHAR (1)        NULL,
    [Zefir]           CHAR (1)        NULL,
    [SymDokZ]         VARCHAR (40)    NULL,
    [PotwWywozu]      CHAR (1)        NULL,
    [Status]          CHAR (1)        NULL,
    [EtapBilans]      CHAR (1)        NULL,
    [PDPUTermin]      DATETIME        NULL,
    [ZPozRejDlugCeln] VARCHAR (20)    NULL,
    [ZNrWykSzczeg]    VARCHAR (30)    NULL,
    [ZPozWykSzczeg]   NUMERIC (7)     NULL,
    CONSTRAINT [PK_DOK_SAD] PRIMARY KEY CLUSTERED ([id_dok] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL],
    CONSTRAINT [FK_DOK_SAD_REFERENCE_DOK_INFO] FOREIGN KEY ([id_dok]) REFERENCES [cel].[dok_info] ([id_dok])
);

