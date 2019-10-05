CREATE TABLE [aies].[ecs_exp_card3_receipient] (
    [id]                   NUMERIC (19)  NOT NULL,
    [street_and_no]        NVARCHAR (35) NULL,
    [postcode]             VARCHAR (9)   NULL,
    [city]                 NVARCHAR (35) NULL,
    [name_f]               NVARCHAR (35) NULL,
    [country]              VARCHAR (2)   NULL,
    [declcoexport_decl_id] NUMERIC (19)  NOT NULL,
    CONSTRAINT [pk_ecs_exp_card3_receipient] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

