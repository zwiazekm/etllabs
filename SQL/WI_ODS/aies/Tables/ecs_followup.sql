CREATE TABLE [aies].[ecs_followup] (
    [fup_type]             VARCHAR (31)  NOT NULL,
    [id]                   NUMERIC (19)  NOT NULL,
    [co_of_exit]           VARCHAR (8)   NULL,
    [co_of_export]         VARCHAR (8)   NULL,
    [comp_auth_coexp]      VARCHAR (8)   NULL,
    [response_date]        DATETIME      NULL,
    [exit_date]            DATETIME      NULL,
    [followup_date]        DATETIME      NULL,
    [mrn]                  VARCHAR (21)  NULL,
    [replied]              TINYINT       NULL,
    [direction]            CHAR (1)      NULL,
    [email]                VARCHAR (35)  NULL,
    [reply_answer]         VARCHAR (280) NULL,
    [reply_info_avail]     INT           NULL,
    [replytodate]          DATETIME      NULL,
    [tin]                  VARCHAR (17)  NULL,
    [initiator_id]         NUMERIC (19)  NULL,
    [declcoexport_decl_id] NUMERIC (19)  NULL,
    [send_date]            DATE          NULL,
    CONSTRAINT [ecs_follow_17746263342] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

