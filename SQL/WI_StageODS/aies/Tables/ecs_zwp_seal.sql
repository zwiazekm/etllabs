CREATE TABLE [aies].[ecs_zwp_seal] (
    [id]                    NUMERIC (19)  NOT NULL,
    [identity_f]            NVARCHAR (40) NULL,
    [declcopresent_decl_id] NUMERIC (19)  NOT NULL,
    CONSTRAINT [pk_ecs_zwp_seal] PRIMARY KEY CLUSTERED ([id] ASC)
);

