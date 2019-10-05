CREATE TABLE [aimp2].[ICS_ZCP_EAD_INFO_ITEM] (
    [ID]          NUMERIC (19)    NOT NULL,
    [NUMBER]      INT             NULL,
    [CN_CODE]     NVARCHAR (8)    NULL,
    [MASS_NETTO]  NUMERIC (16, 6) NULL,
    [EAD_INFO_ID] NUMERIC (19)    NOT NULL,
    [V_STATE]     NCHAR (1)       NULL,
    [EMCS_TRYB]   NCHAR (2)       NULL,
    [ITEM_NO]     NUMERIC (5)     NULL,
    [version]     INT             NOT NULL,
    CONSTRAINT [ICS_ZCP_EAD_INFO_ITEM$ICS_ZCP_EA_6866224581] PRIMARY KEY CLUSTERED ([ID] ASC)
);

