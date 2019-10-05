CREATE TABLE [aes2].[ecs_followup] (
    [fup_type]             NVARCHAR (31)  NOT NULL,
    [id]                   NUMERIC (19)   NOT NULL,
    [co_of_exit]           NVARCHAR (8)   NULL,
    [co_of_export]         NVARCHAR (8)   NULL,
    [comp_auth_coexp]      NVARCHAR (8)   NULL,
    [response_date]        DATETIME2 (3)  NULL,
    [exit_date]            DATETIME2 (3)  NULL,
    [followup_date]        DATETIME2 (3)  NULL,
    [mrn]                  NVARCHAR (21)  NULL,
    [replied]              TINYINT        NULL,
    [direction]            NCHAR (1)      NULL,
    [email]                NVARCHAR (70)  NULL,
    [reply_answer]         NVARCHAR (280) NULL,
    [reply_info_avail]     INT            NULL,
    [replytodate]          DATETIME2 (3)  NULL,
    [tin]                  NVARCHAR (17)  NULL,
    [initiator_id]         NUMERIC (19)   NULL,
    [declcoexport_decl_id] NUMERIC (19)   NULL,
    [send_date]            DATE           NULL,
    CONSTRAINT [ecs_followup$ecs_follow_17746263342] PRIMARY KEY CLUSTERED ([id] ASC)
);

