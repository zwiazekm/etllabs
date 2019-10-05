CREATE TABLE [stat].[dgt_kopia_customs_decl] (
    [id]           NUMERIC (19) NOT NULL,
    [version]      INT          NOT NULL,
    [return_email] VARCHAR (80) NULL,
    [self_ref]     VARCHAR (22) NULL,
    [ref_no]       VARCHAR (35) NULL,
    [flag]         CHAR (1)     NULL,
    [decl_type]    VARCHAR (3)  NULL,
    [dts]          CHAR (1)     NOT NULL,
    [emergency]    TINYINT      NULL,
    [generacjaId]  INT          NOT NULL
) ON [StatDane];


GO
CREATE STATISTICS [decl_type]
    ON [stat].[dgt_kopia_customs_decl]([decl_type]);


GO
CREATE STATISTICS [dts]
    ON [stat].[dgt_kopia_customs_decl]([dts]);


GO
CREATE STATISTICS [emergency]
    ON [stat].[dgt_kopia_customs_decl]([emergency]);


GO
CREATE STATISTICS [flag]
    ON [stat].[dgt_kopia_customs_decl]([flag]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_customs_decl]([generacjaId]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_customs_decl]([id]);


GO
CREATE STATISTICS [ref_no]
    ON [stat].[dgt_kopia_customs_decl]([ref_no]);


GO
CREATE STATISTICS [return_email]
    ON [stat].[dgt_kopia_customs_decl]([return_email]);


GO
CREATE STATISTICS [self_ref]
    ON [stat].[dgt_kopia_customs_decl]([self_ref]);


GO
CREATE STATISTICS [version]
    ON [stat].[dgt_kopia_customs_decl]([version]);

