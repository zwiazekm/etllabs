CREATE TABLE [aes2].[ecs_query_consignee] (
    [id]             NUMERIC (19)   NOT NULL,
    [city]           NVARCHAR (255) NULL,
    [country]        NVARCHAR (255) NULL,
    [name_f]         NVARCHAR (255) NULL,
    [postcode]       NVARCHAR (255) NULL,
    [street_and_no]  NVARCHAR (255) NULL,
    [tin]            NVARCHAR (255) NULL,
    [exportquery_id] NUMERIC (19)   NULL,
    [email]          NVARCHAR (70)  NULL,
    CONSTRAINT [ecs_query_consignee$ecs_query__21426276451] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_query_consignee$fk_consignee_exportquery] FOREIGN KEY ([exportquery_id]) REFERENCES [aes2].[ecs_query_exportquery] ([q_query_decl_id])
);

