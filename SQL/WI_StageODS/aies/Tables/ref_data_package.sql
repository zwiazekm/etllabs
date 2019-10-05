CREATE TABLE [aies].[ref_data_package] (
    [id]           NUMERIC (19)  NOT NULL,
    [guid]         VARCHAR (40)  NOT NULL,
    [package_name] VARCHAR (255) NOT NULL,
    CONSTRAINT [pk_ref_data_package] PRIMARY KEY CLUSTERED ([id] ASC)
);

