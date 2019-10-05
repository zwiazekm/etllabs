﻿CREATE TABLE [aes2].[ecs_query_exportquery] (
    [q_query_decl_id]          NUMERIC (19)    NOT NULL,
    [q_acceptance_date]        DATETIME2 (3)   NULL,
    [q_co_exit]                NVARCHAR (8)    NULL,
    [q_co_export]              NVARCHAR (8)    NULL,
    [q_co_request]             NVARCHAR (8)    NULL,
    [q_container_indicator]    TINYINT         NULL,
    [q_control_date_limit]     DATETIME2 (3)   NULL,
    [q_control_result_code]    NVARCHAR (2)    NULL,
    [q_country_dep_code]       NVARCHAR (2)    NULL,
    [q_dest_country_code]      NVARCHAR (2)    NULL,
    [q_dispatch_country_code]  NVARCHAR (2)    NULL,
    [q_crn]                    NVARCHAR (70)   NULL,
    [q_request_date]           DATETIME2 (3)   NULL,
    [q_decl_type]              NVARCHAR (9)    NULL,
    [q_decl_submit_time]       DATETIME2 (3)   NULL,
    [q_ead_lang_code]          NVARCHAR (2)    NULL,
    [q_exp_oper_state_type]    NVARCHAR (3)    NULL,
    [q_gross_mass]             NUMERIC (11, 3) NULL,
    [q_identity_of_transport]  NVARCHAR (27)   NULL,
    [q_id_of_tran_lang]        NVARCHAR (2)    NULL,
    [q_issue_date]             DATETIME2 (3)   NULL,
    [q_mrn]                    NVARCHAR (21)   NULL,
    [q_number_of_items]        INT             NULL,
    [q_num_of_packages]        INT             NULL,
    [q_oth_mov_info_reqest]    NVARCHAR (350)  NULL,
    [q_oth_mov_info_req_lang]  NVARCHAR (2)    NULL,
    [q_oth_mov_info_response]  NVARCHAR (350)  NULL,
    [q_oth_mov_info_resp_lang] NVARCHAR (2)    NULL,
    [q_query_reason_code]      NVARCHAR (3)    NULL,
    [s_seals_number]           INT             NULL,
    [q_spec_circum_indicator]  NVARCHAR (1)    NULL,
    [q_status]                 NCHAR (1)       NULL,
    [q_tran_method_of_payment] NVARCHAR (1)    NULL,
    [request_msg_id]           NUMERIC (19)    NULL,
    [dts]                      NCHAR (1)       NOT NULL,
    CONSTRAINT [ecs_query_exportquery$ecs_query__18671506661] PRIMARY KEY CLUSTERED ([q_query_decl_id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_query_exportquery$fk_expquery_reqmsg] FOREIGN KEY ([request_msg_id]) REFERENCES [aes2].[customs_message] ([id])
);


GO
ALTER TABLE [aes2].[ecs_query_exportquery] NOCHECK CONSTRAINT [ecs_query_exportquery$fk_expquery_reqmsg];

