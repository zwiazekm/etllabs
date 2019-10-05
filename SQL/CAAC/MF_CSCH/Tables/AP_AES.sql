CREATE TABLE [MF\CSCH].[AP_AES] (
    [id_cust_decl]         NUMERIC (19)    NOT NULL,
    [version]              INT             NOT NULL,
    [return_email]         NVARCHAR (80)   NULL,
    [self_ref]             NVARCHAR (22)   NULL,
    [ref_no]               NVARCHAR (35)   NULL,
    [flag]                 NCHAR (1)       NULL,
    [decl_type]            NVARCHAR (3)    NULL,
    [dts]                  NCHAR (1)       NOT NULL,
    [emergency]            TINYINT         NULL,
    [return_post]          NVARCHAR (2)    NULL,
    [phase]                INT             NULL,
    [aeo]                  TINYINT         NOT NULL,
    [segmentation]         NTEXT           NULL,
    [trad_com_system]      NVARCHAR (1)    NULL,
    [id_customs_operation] NUMERIC (19)    NULL,
    [code]                 NVARCHAR (255)  NULL,
    [operator]             NVARCHAR (40)   NULL,
    [annotation]           NVARCHAR (3072) NULL,
    [time_op]              DATETIME2 (3)   NULL,
    [decl_id]              NUMERIC (19)    NULL,
    [kind_of_annotation]   NVARCHAR (3)    NULL
);

