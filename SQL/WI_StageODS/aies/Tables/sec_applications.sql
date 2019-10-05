CREATE TABLE [aies].[sec_applications] (
    [app_code] VARCHAR (20) NOT NULL,
    [app_name] VARCHAR (40) NULL,
    CONSTRAINT [pk_sec_applications] PRIMARY KEY CLUSTERED ([app_code] ASC)
);

