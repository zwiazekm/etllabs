CREATE TABLE [aies].[ref_custom_office] (
    [id]                NUMERIC (19)  NOT NULL,
    [slw_id]            NUMERIC (19)  NULL,
    [code]              VARCHAR (8)   NOT NULL,
    [short_name]        NVARCHAR (35) NOT NULL,
    [from_date]         DATETIME      NULL,
    [to_date]           DATETIME      NULL,
    [overriding_code]   VARCHAR (8)   NULL,
    [full_name]         VARCHAR (255) NULL,
    [street_and_number] VARCHAR (35)  NULL,
    [post_code]         VARCHAR (9)   NULL,
    [city]              VARCHAR (35)  NULL,
    [country]           VARCHAR (2)   NULL,
    CONSTRAINT [pk_ref_custom_office] PRIMARY KEY CLUSTERED ([id] ASC)
);

