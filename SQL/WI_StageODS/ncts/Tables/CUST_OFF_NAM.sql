CREATE TABLE [ncts].[CUST_OFF_NAM] (
    [STATUS]           CHAR (1)       NULL,
    [PREF_SUFF_LEV]    CHAR (1)       NULL,
    [CUST_OFF_ACT_SID] INT            NOT NULL,
    [LANG_ID]          CHAR (2)       NOT NULL,
    [CUST_OFF_ID]      VARCHAR (8)    NOT NULL,
    [NAM]              NVARCHAR (105) NULL,
    [PREF]             CHAR (1)       NOT NULL,
    [CITY]             NVARCHAR (105) NULL,
    [STR_AND_NUMB]     NVARCHAR (105) NULL,
    [PREF_SUFF_NAM]    NVARCHAR (105) NULL,
    [ADD_SPAC]         CHAR (1)       NOT NULL
);

