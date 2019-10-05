CREATE TABLE [aimp2].[ICS_ZCP_TRANSPORT_INTERNAL] (
    [ID]                           NUMERIC (19)  NOT NULL,
    [ZCP_ID]                       NUMERIC (19)  NULL,
    [CODE]                         NVARCHAR (4)  NULL,
    [MARKINGS]                     NVARCHAR (35) NULL,
    [TRANSPORT_AFFIL_ACTIVE_MEANS] NVARCHAR (2)  NULL,
    [TRANSPORT_MEANS_ID]           NUMERIC (2)   NULL,
    [version]                      INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_TRANSPORT_INTERNAL$PK_ICS_ZCP_TRANSPORT_INTERNAL] PRIMARY KEY CLUSTERED ([ID] ASC)
);

