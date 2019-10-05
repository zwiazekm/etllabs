CREATE TABLE [ncts].[ARE_DET] (
    [DAT_START_EC]   DATETIME    NULL,
    [SID]            INT         NOT NULL,
    [CURR_PAR_ID]    VARCHAR (6) NULL,
    [TYP]            CHAR (1)    NULL,
    [GEON_COD]       VARCHAR (6) NULL,
    [DAT_START_NCTS] DATETIME    NULL,
    [DAT_START_TCC]  DATETIME    NULL,
    [TCC_MEMB]       CHAR (1)    NULL,
    [EC_MEMB]        CHAR (1)    NULL,
    [ARE_ACT_SID]    INT         NULL,
    CONSTRAINT [PK_ARE_DET] PRIMARY KEY CLUSTERED ([SID] ASC)
);

