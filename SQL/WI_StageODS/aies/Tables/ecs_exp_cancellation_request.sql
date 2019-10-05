CREATE TABLE [aies].[ecs_exp_cancellation_request] (
    [id]                            NUMERIC (19)   NOT NULL,
    [msg_id]                        VARCHAR (22)   NULL,
    [return_mail]                   VARCHAR (80)   NULL,
    [reason_of_request]             NVARCHAR (350) NULL,
    [date_of_request]               DATETIME       NULL,
    [date_of_cancellation_decision] DATETIME       NULL,
    [justification_of_decision]     NVARCHAR (350) NULL,
    [status]                        CHAR (1)       NOT NULL,
    [declcoexport_decl_id]          NUMERIC (19)   NOT NULL,
    [return_post]                   VARCHAR (2)    NULL,
    CONSTRAINT [pk_ecs_exp_cancellation_reques] PRIMARY KEY CLUSTERED ([id] ASC)
);

