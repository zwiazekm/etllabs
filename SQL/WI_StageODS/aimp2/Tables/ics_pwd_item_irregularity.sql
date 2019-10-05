CREATE TABLE [aimp2].[ics_pwd_item_irregularity] (
    [id]          NUMERIC (19)    NOT NULL,
    [pwd_item]    NUMERIC (19)    NOT NULL,
    [description] NVARCHAR (1024) NOT NULL,
    [version]     INT             NOT NULL,
    CONSTRAINT [ics_pwd_item_irregularity$PK_ics_pwd_item_irregularity] PRIMARY KEY CLUSTERED ([id] ASC)
);

