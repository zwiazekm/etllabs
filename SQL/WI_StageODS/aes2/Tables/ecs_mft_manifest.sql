CREATE TABLE [aes2].[ecs_mft_manifest] (
    [decl_id]                 NUMERIC (19)    NOT NULL,
    [mf_gross_mass]           NUMERIC (18, 3) NULL,
    [cr_code]                 NVARCHAR (2)    NULL,
    [mf_co_of_exit]           NVARCHAR (8)    NOT NULL,
    [mf_no_of_items]          INT             NULL,
    [mf_no_of_packages]       NUMERIC (19)    NULL,
    [mf_date_of_presentation] DATETIME2 (3)   NULL,
    [mf_status]               NCHAR (1)       NOT NULL,
    [pad_place]               NVARCHAR (105)  NULL,
    [pad_date]                DATETIME2 (3)   NULL,
    [mf_acceptance_date]      DATETIME2 (3)   NULL,
    CONSTRAINT [ecs_mft_manifest$pk_ecs_mft_manifest] PRIMARY KEY CLUSTERED ([decl_id] ASC)
);

