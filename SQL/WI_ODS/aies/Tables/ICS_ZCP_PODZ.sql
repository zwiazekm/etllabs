CREATE TABLE [aies].[ICS_ZCP_PODZ] (
    [ID]                  NUMERIC (19) NOT NULL,
    [ZCP_ID]              NUMERIC (19) NULL,
    [MRN]                 VARCHAR (18) NULL,
    [PODZ_NO]             NUMERIC (5)  NULL,
    [PROPRIETARY_PODZ_NO] VARCHAR (35) NULL,
    CONSTRAINT [pk_ICS_ZCP_PODZ] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

