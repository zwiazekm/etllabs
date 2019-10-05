CREATE TABLE [aimp2].[ais_zcp_natural_pers_add_info] (
    [ID]                    NUMERIC (19) NOT NULL,
    [ZCP_NATURAL_PERSON_ID] NUMERIC (19) NULL,
    [CODE]                  NVARCHAR (5) NULL,
    [version]               INT          NULL,
    CONSTRAINT [ais_zcp_natural_pers_add_info_PK] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIMP2],
    CONSTRAINT [ais_zcp_natural_pers_add_info$FK_ICS_ZCP_NATURAL_PERSON] FOREIGN KEY ([ZCP_NATURAL_PERSON_ID]) REFERENCES [aimp2].[ICS_ZCP_NATURAL_PERSON] ([ID])
);

