CREATE TABLE [aes2].[customs_decl] (
    [id]              NUMERIC (19)  NOT NULL,
    [version]         INT           NOT NULL,
    [return_email]    NVARCHAR (80) NULL,
    [self_ref]        NVARCHAR (22) NULL,
    [ref_no]          NVARCHAR (35) NULL,
    [flag]            NCHAR (1)     NULL,
    [decl_type]       NVARCHAR (3)  NULL,
    [dts]             NCHAR (1)     NOT NULL,
    [emergency]       TINYINT       NULL,
    [return_post]     NVARCHAR (2)  NULL,
    [phase]           INT           NULL,
    [aeo]             TINYINT       NOT NULL,
    [segmentation]    NTEXT         NULL,
    [trad_com_system] NVARCHAR (1)  NULL
);

