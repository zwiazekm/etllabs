CREATE TABLE [ncts].[TRADS] (
    [SID]              INT            NOT NULL,
    [TIN]              VARCHAR (17)   NULL,
    [CITY]             NVARCHAR (105) NULL,
    [NAM]              NVARCHAR (105) NULL,
    [POST_COD]         VARCHAR (27)   NULL,
    [STR_AND_NUMB]     NVARCHAR (105) NULL,
    [COUNTRY_ID]       CHAR (2)       NULL,
    [TIN_OR_HOLDER_ID] NUMERIC (1)    CONSTRAINT [DF_TRADS_TIN_OR_HOLDER_ID] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TRADS] PRIMARY KEY CLUSTERED ([SID] ASC)
);

