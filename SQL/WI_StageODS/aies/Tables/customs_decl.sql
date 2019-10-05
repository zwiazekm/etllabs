CREATE TABLE [aies].[customs_decl] (
    [id]           NUMERIC (19) NOT NULL,
    [version]      INT          NOT NULL,
    [return_email] VARCHAR (80) NULL,
    [self_ref]     VARCHAR (22) NULL,
    [ref_no]       VARCHAR (35) NULL,
    [flag]         CHAR (1)     NULL,
    [decl_type]    VARCHAR (3)  NULL,
    [dts]          CHAR (1)     NOT NULL,
    [emergency]    TINYINT      NULL,
    [return_post]  VARCHAR (2)  NULL,
    [phase]        INT          NULL,
    CONSTRAINT [pk_customs_decl] PRIMARY KEY CLUSTERED ([id] ASC)
);

