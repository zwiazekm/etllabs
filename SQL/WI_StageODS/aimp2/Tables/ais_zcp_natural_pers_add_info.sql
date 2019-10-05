CREATE TABLE [aimp2].[ais_zcp_natural_pers_add_info] (
    [ID]                    NUMERIC (19) NOT NULL,
    [ZCP_NATURAL_PERSON_ID] NUMERIC (19) NULL,
    [CODE]                  NVARCHAR (5) NULL,
    [version]               INT          NULL,
    CONSTRAINT [ais_zcp_natural_pers_add_info__PK] PRIMARY KEY CLUSTERED ([ID] ASC)
);

