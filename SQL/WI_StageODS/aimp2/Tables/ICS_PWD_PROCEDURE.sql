CREATE TABLE [aimp2].[ICS_PWD_PROCEDURE] (
    [id]        NUMERIC (19) NOT NULL,
    [pwd_id]    NUMERIC (19) NULL,
    [code]      NVARCHAR (2) NULL,
    [prev_code] NVARCHAR (2) NULL,
    [version]   INT          NOT NULL,
    CONSTRAINT [ICS_PWD_PROCEDURE$PK_ICS_PWD_PROCEDURE] PRIMARY KEY CLUSTERED ([id] ASC)
);

