CREATE TABLE [aies].[ecs_mft_manifest] (
    [decl_id]                 NUMERIC (19)    NOT NULL,
    [mf_gross_mass]           NUMERIC (18, 3) NULL,
    [cr_code]                 VARCHAR (2)     NULL,
    [mf_co_of_exit]           VARCHAR (8)     NOT NULL,
    [mf_no_of_items]          INT             NULL,
    [mf_no_of_packages]       NUMERIC (19)    NULL,
    [mf_date_of_presentation] DATETIME        NULL,
    [mf_status]               CHAR (1)        NOT NULL,
    [pad_place]               NVARCHAR (35)   NULL,
    [pad_date]                DATETIME        NULL,
    [mf_acceptance_date]      DATETIME        NULL,
    CONSTRAINT [pk_ecs_mft_manifest] PRIMARY KEY CLUSTERED ([decl_id] ASC) ON [FG_AIES]
);

