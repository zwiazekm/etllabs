CREATE TABLE [stat].[dgt_kopia_ecs_exp_exporter] (
    [id]                   NUMERIC (19)  NOT NULL,
    [street_and_no]        NVARCHAR (35) NULL,
    [postcode]             VARCHAR (9)   NULL,
    [city]                 NVARCHAR (35) NULL,
    [name_f]               NVARCHAR (35) NULL,
    [country]              VARCHAR (2)   NULL,
    [tin]                  VARCHAR (17)  NULL,
    [regon]                VARCHAR (14)  NULL,
    [declcoexport_decl_id] NUMERIC (19)  NOT NULL,
    [generacjaId]          INT           NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_exporter] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [city]
    ON [stat].[dgt_kopia_ecs_exp_exporter]([city]);


GO
CREATE STATISTICS [country]
    ON [stat].[dgt_kopia_ecs_exp_exporter]([country]);


GO
CREATE STATISTICS [declcoexport_decl_id]
    ON [stat].[dgt_kopia_ecs_exp_exporter]([declcoexport_decl_id]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_exporter]([generacjaId]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_exporter]([id]);


GO
CREATE STATISTICS [name_f]
    ON [stat].[dgt_kopia_ecs_exp_exporter]([name_f]);


GO
CREATE STATISTICS [postcode]
    ON [stat].[dgt_kopia_ecs_exp_exporter]([postcode]);


GO
CREATE STATISTICS [regon]
    ON [stat].[dgt_kopia_ecs_exp_exporter]([regon]);


GO
CREATE STATISTICS [street_and_no]
    ON [stat].[dgt_kopia_ecs_exp_exporter]([street_and_no]);


GO
CREATE STATISTICS [tin]
    ON [stat].[dgt_kopia_ecs_exp_exporter]([tin]);

