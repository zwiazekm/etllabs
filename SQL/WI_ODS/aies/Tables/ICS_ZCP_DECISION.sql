CREATE TABLE [aies].[ICS_ZCP_DECISION] (
    [ID]               NUMERIC (19) NOT NULL,
    [DEC_DATE]         DATETIME     NULL,
    [MRN]              VARCHAR (18) NULL,
    [DEC_NO]           VARCHAR (40) NULL,
    [POS_NO]           NUMERIC (5)  NULL,
    [TYPE]             VARCHAR (4)  NULL,
    [ZCP_OPERATION_ID] NUMERIC (19) NULL,
    CONSTRAINT [pk_ICS_ZCP_DECISION] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

