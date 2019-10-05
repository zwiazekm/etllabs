CREATE TABLE [aes2].[customs_verification_item] (
    [id]          NUMERIC (19)   NOT NULL,
    [author]      NVARCHAR (255) NULL,
    [decl_id]     NUMERIC (19)   NOT NULL,
    [executor]    NVARCHAR (255) NULL,
    [item_type]   NCHAR (3)      NOT NULL,
    [item_number] INT            NULL,
    [status]      NCHAR (1)      NOT NULL,
    [war_code]    NVARCHAR (5)   NULL,
    [war_ue_code] NVARCHAR (5)   NULL,
    [origin]      NCHAR (1)      NOT NULL,
    [profile]     NVARCHAR (255) NULL,
    [pointer]     NVARCHAR (255) NULL,
    [version]     INT            NULL,
    CONSTRAINT [customs_verification_item$customs_ve_id_9468154041] PRIMARY KEY CLUSTERED ([id] ASC)
);

