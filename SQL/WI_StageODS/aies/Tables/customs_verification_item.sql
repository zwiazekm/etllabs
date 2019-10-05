CREATE TABLE [aies].[customs_verification_item] (
    [id]          NUMERIC (19)  NOT NULL,
    [author]      VARCHAR (255) NULL,
    [decl_id]     NUMERIC (19)  NOT NULL,
    [executor]    VARCHAR (255) NULL,
    [item_type]   CHAR (3)      NOT NULL,
    [item_number] INT           NULL,
    [status]      CHAR (1)      NOT NULL,
    [war_code]    VARCHAR (5)   NULL,
    [war_ue_code] VARCHAR (5)   NULL,
    [origin]      CHAR (1)      NOT NULL,
    [profile]     VARCHAR (255) NULL,
    [pointer]     VARCHAR (255) NULL,
    [version]     INT           NULL,
    CONSTRAINT [customs_ve_id_9468154041] PRIMARY KEY CLUSTERED ([id] ASC)
);

