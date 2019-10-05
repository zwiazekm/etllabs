CREATE TABLE [aies].[ecs_ext_exporter] (
    [id]                 NUMERIC (19)  NOT NULL,
    [street_and_no]      NVARCHAR (35) NULL,
    [postcode]           VARCHAR (9)   NULL,
    [city]               NVARCHAR (35) NULL,
    [name_f]             NVARCHAR (35) NULL,
    [country]            VARCHAR (2)   NULL,
    [tin]                VARCHAR (17)  NULL,
    [declcoexit_decl_id] NUMERIC (19)  NOT NULL,
    [eori]               VARCHAR (17)  NULL,
    [email]              VARCHAR (35)  NULL,
    CONSTRAINT [pk_ecs_ext_exporter] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

