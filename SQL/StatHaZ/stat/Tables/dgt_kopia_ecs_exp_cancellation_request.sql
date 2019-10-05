CREATE TABLE [stat].[dgt_kopia_ecs_exp_cancellation_request] (
    [id]                            NUMERIC (19)   NOT NULL,
    [msg_id]                        VARCHAR (22)   NULL,
    [return_mail]                   VARCHAR (80)   NULL,
    [reason_of_request]             NVARCHAR (350) NULL,
    [date_of_request]               DATETIME       NULL,
    [date_of_cancellation_decision] DATETIME       NULL,
    [justification_of_decision]     NVARCHAR (350) NULL,
    [status]                        CHAR (1)       NOT NULL,
    [declcoexport_decl_id]          NUMERIC (19)   NOT NULL,
    [generacjaId]                   INT            NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_cancellation_request] PRIMARY KEY CLUSTERED ([id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [date_of_cancellation_decision]
    ON [stat].[dgt_kopia_ecs_exp_cancellation_request]([date_of_cancellation_decision]);


GO
CREATE STATISTICS [date_of_request]
    ON [stat].[dgt_kopia_ecs_exp_cancellation_request]([date_of_request]);


GO
CREATE STATISTICS [declcoexport_decl_id]
    ON [stat].[dgt_kopia_ecs_exp_cancellation_request]([declcoexport_decl_id]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_cancellation_request]([generacjaId]);


GO
CREATE STATISTICS [id]
    ON [stat].[dgt_kopia_ecs_exp_cancellation_request]([id]);


GO
CREATE STATISTICS [justification_of_decision]
    ON [stat].[dgt_kopia_ecs_exp_cancellation_request]([justification_of_decision]);


GO
CREATE STATISTICS [msg_id]
    ON [stat].[dgt_kopia_ecs_exp_cancellation_request]([msg_id]);


GO
CREATE STATISTICS [reason_of_request]
    ON [stat].[dgt_kopia_ecs_exp_cancellation_request]([reason_of_request]);


GO
CREATE STATISTICS [return_mail]
    ON [stat].[dgt_kopia_ecs_exp_cancellation_request]([return_mail]);


GO
CREATE STATISTICS [status]
    ON [stat].[dgt_kopia_ecs_exp_cancellation_request]([status]);

