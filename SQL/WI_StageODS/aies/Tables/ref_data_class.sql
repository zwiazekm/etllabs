CREATE TABLE [aies].[ref_data_class] (
    [id]                  NUMERIC (19)  NOT NULL,
    [ref_data_id]         NUMERIC (19)  NOT NULL,
    [guid]                VARCHAR (40)  NOT NULL,
    [class_name]          VARCHAR (512) NOT NULL,
    [ref_data_package_id] NUMERIC (19)  NOT NULL,
    [bytecode]            IMAGE         NOT NULL,
    CONSTRAINT [pk_ref_data_class] PRIMARY KEY CLUSTERED ([id] ASC)
);

