CREATE TABLE [aimp2].[ICS_DIRT_IND] (
    [ID]           NUMERIC (19)   NOT NULL,
    [DIRECTIVE_ID] NUMERIC (19)   NOT NULL,
    [NAME]         NVARCHAR (100) NOT NULL,
    [VALUE]        NVARCHAR (100) NULL,
    [show]         BIT            NOT NULL,
    [version]      INT            NOT NULL,
    CONSTRAINT [ICS_DIRT_IND$ICS_DIRT_I_9447193871] PRIMARY KEY CLUSTERED ([ID] ASC)
);

