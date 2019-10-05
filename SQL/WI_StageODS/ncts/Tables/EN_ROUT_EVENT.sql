CREATE TABLE [ncts].[EN_ROUT_EVENT] (
    [ARR_NOT_EVENT] CHAR (1)       NULL,
    [MRN]           VARCHAR (21)   NOT NULL,
    [SEQ]           DECIMAL (4)    NOT NULL,
    [PLAC]          NVARCHAR (105) NULL,
    [PLAC_LNG]      CHAR (2)       NULL,
    [NUMB_OF_SEALS] DECIMAL (4)    NULL,
    [AL_IN_NCTS]    CHAR (1)       NULL,
    [USER_ID]       VARCHAR (7)    NULL,
    [CUST_OFF_ID]   VARCHAR (8)    NULL,
    [COUNTRY_ID]    CHAR (2)       NULL,
    CONSTRAINT [PK_EN_ROUT_EVENT] PRIMARY KEY CLUSTERED ([MRN] ASC, [SEQ] ASC)
);

