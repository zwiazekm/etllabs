﻿CREATE TABLE [aes2].[ecs_exp_declcoexport] (
    [decl_id]                      NUMERIC (19)    NOT NULL,
    [exp_gross_mass]               NUMERIC (18, 3) NULL,
    [exp_gross_mass_br_c]          NVARCHAR (420)  NULL,
    [exp_no_of_items_br_c]         NVARCHAR (420)  NULL,
    [crb_code]                     NVARCHAR (2)    NULL,
    [crb_state_of_seals]           TINYINT         NULL,
    [pad_place]                    NVARCHAR (105)  NULL,
    [pad_capacity]                 NVARCHAR (105)  NULL,
    [pad_phone]                    NVARCHAR (45)   NULL,
    [pad_name]                     NVARCHAR (105)  NULL,
    [pad_date]                     DATETIME        NULL,
    [si_quantity]                  INT             NULL,
    [cr_code]                      NVARCHAR (2)    NULL,
    [lof_co]                       NVARCHAR (8)    NULL,
    [lof_location_desc]            NVARCHAR (105)  NULL,
    [lof_location_code]            NVARCHAR (17)   NULL,
    [pos_location_desc]            NVARCHAR (105)  NULL,
    [pos_location_code]            NVARCHAR (17)   NULL,
    [it_identity_br]               NVARCHAR (31)   NULL,
    [it_identity_br_c]             NVARCHAR (420)  NULL,
    [it_identity]                  NVARCHAR (31)   NULL,
    [it_mode]                      NVARCHAR (2)    NULL,
    [exp_co_of_exit]               NVARCHAR (8)    NULL,
    [exp_co_of_exit_changed_to]    NVARCHAR (8)    NULL,
    [exp_storing]                  TINYINT         NULL,
    [exp_co_of_export]             NVARCHAR (8)    NULL,
    [exp_decl_type_1a]             NVARCHAR (2)    NULL,
    [exp_no_of_items]              INT             NULL,
    [exp_no_of_items_br]           INT             NULL,
    [exp_no_of_packages]           INT             NULL,
    [exp_no_of_packages_br]        INT             NULL,
    [exp_no_of_packages_br_c]      NVARCHAR (420)  NULL,
    [exp_country_of_export]        NVARCHAR (2)    NULL,
    [exp_country_of_destinatnion]  NVARCHAR (2)    NULL,
    [exp_containers]               TINYINT         NULL,
    [exp_gross_mass_br]            NUMERIC (18, 3) NULL,
    [exp_acceptance_date]          DATETIME        NULL,
    [exp_time_to_border_arrival]   DATETIME        NULL,
    [dt_code]                      NVARCHAR (3)    NULL,
    [dt_place]                     NVARCHAR (105)  NULL,
    [dt_place_code]                NVARCHAR (1)    NULL,
    [w_location_code]              NVARCHAR (35)   NULL,
    [w_type]                       NVARCHAR (1)    NULL,
    [w_country]                    NVARCHAR (2)    NULL,
    [tab_country]                  NVARCHAR (2)    NULL,
    [tab_identity]                 NVARCHAR (31)   NULL,
    [tab_mode]                     NVARCHAR (2)    NULL,
    [sc_street_and_number]         NVARCHAR (105)  NULL,
    [sc_post_code]                 NVARCHAR (9)    NULL,
    [sc_city]                      NVARCHAR (105)  NULL,
    [sc_co]                        NVARCHAR (8)    NULL,
    [sc_name]                      NVARCHAR (105)  NULL,
    [sc_country]                   NVARCHAR (2)    NULL,
    [td_amount]                    NUMERIC (17, 2) NULL,
    [td_exchange_rate]             NUMERIC (11, 5) NULL,
    [td_nature_of_transation]      NVARCHAR (2)    NULL,
    [td_currency]                  NVARCHAR (3)    NULL,
    [exp_decl_type_1b]             NVARCHAR (1)    NULL,
    [exp_crn]                      NVARCHAR (210)  NULL,
    [exp_un_dangerous_goods]       NVARCHAR (4)    NULL,
    [exp_taxes_amount]             NUMERIC (17, 2) NULL,
    [exp_specific_circumstance]    NVARCHAR (1)    NULL,
    [exp_digital_signature]        TINYINT         NULL,
    [exp_time_to_release_decision] DATETIME        NULL,
    [exp_time_to_exit_results]     DATETIME        NULL,
    [exp_time_to_send_exp_confirm] DATETIME        NULL,
    [exp_sp]                       TINYINT         NULL,
    [exp_exit_date]                DATETIME        NULL,
    [exp_exit_stopped_date]        DATETIME        NULL,
    [exp_release_date]             DATETIME        NULL,
    [exp_status]                   NCHAR (1)       NOT NULL,
    [exp_time_to_auto_acceptance]  DATETIME        NULL,
    [exp_transport_charges_mp]     NVARCHAR (1)    NULL,
    [exp_tran_char_mp_di]          NVARCHAR (1)    NULL,
    [exp_tran_char_mp_di_c]        NVARCHAR (140)  NULL,
    [exp_crn_di]                   NVARCHAR (70)   NULL,
    [exp_crn_di_c]                 NVARCHAR (140)  NULL,
    [exp_supp_decl_delivery_date]  DATETIME        NULL,
    [exp_co_of_supplement]         NVARCHAR (8)    NULL,
    [exp_time_to_delivery_suppl]   DATETIME        NULL,
    [exp_supplement_decl]          TINYINT         NULL,
    [printead]                     NUMERIC (1)     NULL,
    [from_emcs]                    TINYINT         NULL,
    [exp_co_of_present]            NVARCHAR (8)    NULL,
    [transit]                      BIT             NOT NULL,
    [presentation_goods_co]        NVARCHAR (8)    NULL,
    [centralised_customs]          BIT             NOT NULL,
    [crp_code]                     NVARCHAR (2)    NULL,
    [crp_state_of_seals]           TINYINT         NULL,
    [transit_over]                 NVARCHAR (1)    NULL,
    [tqsVersion]                   TINYINT         NOT NULL,
    [reject_to_date]               DATETIME        NULL,
    [tqsSent]                      BIT             NOT NULL,
    [canc_from_office]             BIT             DEFAULT ((0)) NOT NULL,
    CONSTRAINT [ecs_exp_declcoexport$pk_ecs_exp_declcoexport] PRIMARY KEY CLUSTERED ([decl_id] ASC)
);

