CREATE TABLE [intr2].[schema_version] (
    [version_rank]   INT             NOT NULL,
    [installed_rank] INT             NOT NULL,
    [version]        NVARCHAR (150)  NOT NULL,
    [description]    NVARCHAR (600)  NOT NULL,
    [type]           NVARCHAR (60)   NOT NULL,
    [script]         NVARCHAR (3000) NOT NULL,
    [checksum]       INT             NULL,
    [installed_by]   NVARCHAR (300)  NOT NULL,
    [installed_on]   DATETIME2 (3)   NOT NULL,
    [execution_time] INT             NOT NULL,
    [success]        BIT             NOT NULL,
    CONSTRAINT [schema_version$schema_version_pk] PRIMARY KEY CLUSTERED ([version] ASC) ON [FG_INTR2]
);

