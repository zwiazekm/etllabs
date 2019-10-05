CREATE TABLE [aies].[sec_actions] (
    [id]                 NUMERIC (19)  NOT NULL,
    [action_code]        VARCHAR (50)  NOT NULL,
    [action_description] VARCHAR (200) NOT NULL,
    [action_visibility]  TINYINT       NULL,
    CONSTRAINT [sec_action_10441957392] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

