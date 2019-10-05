CREATE TABLE [aes2].[ecs_exp_cancellation_request] (
    [id]                            NUMERIC (19)    NOT NULL,
    [msg_id]                        NVARCHAR (22)   NULL,
    [return_mail]                   NVARCHAR (80)   NULL,
    [reason_of_request]             NVARCHAR (1050) NULL,
    [date_of_request]               DATETIME2 (3)   NULL,
    [date_of_cancellation_decision] DATETIME2 (3)   NULL,
    [justification_of_decision]     NVARCHAR (1050) NULL,
    [status]                        NCHAR (1)       NOT NULL,
    [declcoexport_decl_id]          NUMERIC (19)    NOT NULL,
    [return_post]                   NVARCHAR (2)    NULL,
    CONSTRAINT [ecs_exp_cancellation_request$pk_ecs_exp_cancellation_reques] PRIMARY KEY CLUSTERED ([id] ASC)
);

