﻿CREATE TABLE [ARIFORM].[FA_PW_SPR_R_BACKUP] (
    [ID]                       BIGINT         NOT NULL,
    [PRZED_IMP_LICZ]           BIGINT         NULL,
    [PRZED_IMP_LICZ_PROC]      BIGINT         NULL,
    [PRZED_EXP_LICZ]           BIGINT         NULL,
    [PRZED_EXP_LICZ_PROC]      BIGINT         NULL,
    [STAT_POZ_LICZ_UPR_PROC]   INT            NULL,
    [STAT_PROC_LICZ_UPO_NAD]   INT            NULL,
    [STAT_PROC_LICZ_UPO_ODB]   INT            NULL,
    [STAT_PROC_LICZ_JED_POZ_1] INT            NULL,
    [STAT_PROC_LICZ_JED_POZ_2] INT            NULL,
    [STAT_PROC_LICZ_SKLAD_A]   INT            NULL,
    [STAT_PROC_LICZ_SKLAD_B]   INT            NULL,
    [STAT_PROC_LICZ_SKLAD_C]   INT            NULL,
    [STAT_PROC_LICZ_SKLAD_D]   BIGINT         NULL,
    [STAT_PROC_LICZ_SKLAD_E]   INT            NULL,
    [STAT_PROC_LICZ_SKLAD_F]   INT            NULL,
    [PRAC_LICZ_PRAC]           INT            NULL,
    [PRAC_LICZ_PRZY]           INT            NULL,
    [PRAC_LICZ_ZAT]            INT            NULL,
    [PRAC_LICZ_DNI_SZKOL]      INT            NULL,
    [PZK_POZ_PODM_GOS]         SMALLINT       NULL,
    [PZK_POZ_PODR]             SMALLINT       NULL,
    [ID_STR_ORG]               INT            NOT NULL,
    [ID_STATUS]                SMALLINT       NULL,
    [ID_ARCH]                  BIGINT         NOT NULL,
    [KOMENTARZ]                VARCHAR (2000) NULL,
    [LOGIN]                    VARCHAR (255)  NULL,
    [DATA_EDYCJA]              DATETIME       NOT NULL,
    [ROK]                      VARCHAR (4)    NULL
);

