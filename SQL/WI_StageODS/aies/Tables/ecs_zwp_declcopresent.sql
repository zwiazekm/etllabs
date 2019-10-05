﻿CREATE TABLE [aies].[ecs_zwp_declcopresent] (
    [decl_id]                      NUMERIC (19)    NOT NULL,
    [zwp_gross_mass]               NUMERIC (18, 3) NULL,
    [zwp_gross_mass_pt_c]          VARCHAR (510)   NULL,
    [zwp_no_of_items_pt_c]         VARCHAR (280)   NULL,
    [crb_code]                     VARCHAR (2)     NULL,
    [crb_state_of_seals]           TINYINT         NULL,
    [pad_place]                    VARCHAR (70)    NULL,
    [pad_date]                     DATETIME        NULL,
    [s_quantity]                   INT             NULL,
    [cr_code]                      VARCHAR (2)     NULL,
    [log_co]                       VARCHAR (8)     NULL,
    [log_location_desc]            VARCHAR (510)   NULL,
    [log_location_code]            VARCHAR (17)    NULL,
    [pos_location_desc]            VARCHAR (510)   NULL,
    [pos_location_code]            VARCHAR (17)    NULL,
    [it_identity_pt]               VARCHAR (255)   NULL,
    [it_identity_pt_c]             VARCHAR (510)   NULL,
    [it_identity]                  VARCHAR (510)   NULL,
    [zwp_ecs_decl]                 TINYINT         NULL,
    [zwp_co_of_exit]               VARCHAR (8)     NULL,
    [zwp_co_of_exit_declared]      VARCHAR (8)     NULL,
    [zwp_co_of_exit_changed_to]    VARCHAR (8)     NULL,
    [zwp_storing]                  TINYINT         NULL,
    [zwp_co_of_export]             VARCHAR (8)     NULL,
    [zwp_decl_type_1a]             VARCHAR (2)     NULL,
    [zwp_no_of_items]              INT             NULL,
    [zwp_no_of_items_pt]           INT             NULL,
    [zwp_no_of_package]            INT             NULL,
    [zwp_no_of_packages_pt]        INT             NULL,
    [zwp_no_of_packages_pt_c]      VARCHAR (280)   NULL,
    [zwp_country_of_export]        VARCHAR (2)     NULL,
    [zwp_country_of_dest]          VARCHAR (2)     NULL,
    [zwp_containers]               TINYINT         NULL,
    [zwp_gross_mass_pt]            NUMERIC (18, 3) NULL,
    [zwp_acceptance_date]          DATETIME        NULL,
    [zwp_issuing_date]             DATETIME        NULL,
    [zwp_ead_language]             VARCHAR (2)     NULL,
    [zwp_time_to_send_exit_result] DATETIME        NULL,
    [zwp_time_to_border_arrival]   DATETIME        NULL,
    [zwp_presentation_date]        DATETIME        NULL,
    [zwp_notification_date]        DATETIME        NULL,
    [zwp_status]                   CHAR (1)        NOT NULL,
    [zwp_exit_date]                DATETIME        NULL,
    [zwp_present_stopped_date]     DATETIME        NULL,
    [zwp_com_ref_num]              VARCHAR (70)    NULL,
    [zwp_com_ref_num_di]           VARCHAR (70)    NULL,
    [zwp_com_ref_num_di_c]         VARCHAR (140)   NULL,
    [zwp_dec_sub_tim]              DATETIME        NULL,
    [zwp_tra_cha_met]              VARCHAR (1)     NULL,
    [zwp_tra_cha_met_di]           VARCHAR (1)     NULL,
    [zwp_tra_cha_met_di_c]         VARCHAR (140)   NULL,
    [zwp_spe_cir_ind]              VARCHAR (1)     NULL,
    [pad_realDate]                 DATETIME        NULL,
    [crb_code_before_transit]      VARCHAR (2)     NULL,
    [transit]                      BIT             NOT NULL,
    CONSTRAINT [pk_ecs_ext_declcopresent] PRIMARY KEY CLUSTERED ([decl_id] ASC)
);

