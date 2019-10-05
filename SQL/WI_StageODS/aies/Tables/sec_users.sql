CREATE TABLE [aies].[sec_users] (
    [id]         NUMERIC (19)  NOT NULL,
    [login]      VARCHAR (255) NOT NULL,
    [department] VARCHAR (20)  NULL,
    [usr_name]   NVARCHAR (80) NOT NULL,
    [version]    INT           NULL,
    [status]     TINYINT       NOT NULL,
    CONSTRAINT [pk_sec_users] PRIMARY KEY CLUSTERED ([id] ASC)
);

