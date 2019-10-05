CREATE TABLE [aies].[ICS_ZCP_TRANSPORT_INTERNAL] (
    [ID]                           NUMERIC (19) NOT NULL,
    [ZCP_ID]                       NUMERIC (19) NULL,
    [CODE]                         VARCHAR (4)  NULL,
    [MARKINGS]                     VARCHAR (35) NULL,
    [TRANSPORT_AFFIL_ACTIVE_MEANS] VARCHAR (2)  NULL,
    CONSTRAINT [pk_ICS_ZCP_TRANSPORT_INTERNAL] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

