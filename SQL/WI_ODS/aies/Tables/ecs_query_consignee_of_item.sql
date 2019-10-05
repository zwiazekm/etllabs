CREATE TABLE [aies].[ecs_query_consignee_of_item] (
    [id]            NUMERIC (19)  NOT NULL,
    [city]          VARCHAR (255) NULL,
    [country]       VARCHAR (255) NULL,
    [name_f]        VARCHAR (255) NULL,
    [postcode]      VARCHAR (255) NULL,
    [street_and_no] VARCHAR (255) NULL,
    [tin]           VARCHAR (255) NULL,
    [gi_id]         NUMERIC (19)  NULL,
    [email]         VARCHAR (35)  NULL,
    CONSTRAINT [ecs_query__4271455361] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

