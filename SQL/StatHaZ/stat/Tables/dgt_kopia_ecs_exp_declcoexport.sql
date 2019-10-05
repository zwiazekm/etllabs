CREATE TABLE [stat].[dgt_kopia_ecs_exp_declcoexport] (
    [decl_id]                      NUMERIC (19)    NOT NULL,
    [exp_gross_mass]               NUMERIC (18, 3) NULL,
    [exp_gross_mass_br_c]          NVARCHAR (140)  NULL,
    [exp_no_of_items_br_c]         NVARCHAR (140)  NULL,
    [crb_code]                     VARCHAR (2)     NULL,
    [crb_state_of_seals]           TINYINT         NULL,
    [pad_place]                    NVARCHAR (35)   NULL,
    [pad_capacity]                 NVARCHAR (35)   NULL,
    [pad_phone]                    NVARCHAR (15)   NULL,
    [pad_name]                     NVARCHAR (35)   NULL,
    [pad_date]                     DATETIME        NULL,
    [si_quantity]                  INT             NULL,
    [cr_code]                      VARCHAR (2)     NULL,
    [lof_co]                       VARCHAR (8)     NULL,
    [lof_location_desc]            NVARCHAR (35)   NULL,
    [lof_location_code]            VARCHAR (17)    NULL,
    [pos_location_desc]            NVARCHAR (35)   NULL,
    [pos_location_code]            VARCHAR (17)    NULL,
    [it_identity_br]               VARCHAR (31)    NULL,
    [it_identity_br_c]             NVARCHAR (140)  NULL,
    [it_identity]                  VARCHAR (31)    NULL,
    [it_mode]                      VARCHAR (2)     NULL,
    [exp_co_of_exit]               VARCHAR (8)     NULL,
    [exp_co_of_exit_changed_to]    VARCHAR (8)     NULL,
    [exp_storing]                  TINYINT         NULL,
    [exp_co_of_export]             VARCHAR (8)     NULL,
    [exp_decl_type_1a]             VARCHAR (2)     NULL,
    [exp_no_of_items]              INT             NULL,
    [exp_no_of_items_br]           INT             NULL,
    [exp_no_of_packages]           INT             NULL,
    [exp_no_of_packages_br]        INT             NULL,
    [exp_no_of_packages_br_c]      NVARCHAR (140)  NULL,
    [exp_country_of_export]        VARCHAR (2)     NULL,
    [exp_country_of_destinatnion]  VARCHAR (2)     NULL,
    [exp_containers]               TINYINT         NULL,
    [exp_gross_mass_br]            NUMERIC (18, 3) NULL,
    [exp_acceptance_date]          DATETIME        NULL,
    [exp_time_to_border_arrival]   DATETIME        NULL,
    [dt_code]                      VARCHAR (3)     NULL,
    [dt_place]                     NVARCHAR (35)   NULL,
    [dt_place_code]                VARCHAR (1)     NULL,
    [w_location_code]              VARCHAR (14)    NULL,
    [w_type]                       VARCHAR (1)     NULL,
    [w_country]                    VARCHAR (2)     NULL,
    [tab_country]                  VARCHAR (2)     NULL,
    [tab_identity]                 VARCHAR (31)    NULL,
    [tab_mode]                     VARCHAR (2)     NULL,
    [sc_street_and_number]         NVARCHAR (35)   NULL,
    [sc_post_code]                 VARCHAR (9)     NULL,
    [sc_city]                      NVARCHAR (35)   NULL,
    [sc_co]                        VARCHAR (8)     NULL,
    [sc_name]                      NVARCHAR (35)   NULL,
    [sc_country]                   VARCHAR (2)     NULL,
    [td_amount]                    NUMERIC (17, 2) NULL,
    [td_exchange_rate]             NUMERIC (11, 5) NULL,
    [td_nature_of_transation]      VARCHAR (2)     NULL,
    [td_currency]                  VARCHAR (3)     NULL,
    [exp_decl_type_1b]             VARCHAR (1)     NULL,
    [exp_crn]                      NVARCHAR (70)   NULL,
    [exp_un_dangerous_goods]       VARCHAR (4)     NULL,
    [exp_taxes_amount]             NUMERIC (17, 2) NULL,
    [exp_specific_circumstance]    VARCHAR (1)     NULL,
    [exp_digital_signature]        TINYINT         NULL,
    [exp_time_to_release_decision] DATETIME        NULL,
    [exp_time_to_exit_results]     DATETIME        NULL,
    [exp_time_to_send_exp_confirm] DATETIME        NULL,
    [exp_sp]                       TINYINT         NULL,
    [exp_exit_date]                DATETIME        NULL,
    [exp_exit_stopped_date]        DATETIME        NULL,
    [exp_release_date]             DATETIME        NULL,
    [exp_status]                   CHAR (1)        NOT NULL,
    [exp_time_to_auto_acceptance]  DATETIME        NULL,
    [generacjaId]                  INT             NOT NULL,
    CONSTRAINT [PK_dgt_kopia_ecs_exp_declcoexport] PRIMARY KEY CLUSTERED ([decl_id] ASC, [generacjaId] ASC)
);


GO
CREATE STATISTICS [cr_code]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([cr_code]);


GO
CREATE STATISTICS [crb_code]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([crb_code]);


GO
CREATE STATISTICS [crb_state_of_seals]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([crb_state_of_seals]);


GO
CREATE STATISTICS [decl_id]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([decl_id]);


GO
CREATE STATISTICS [dt_code]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([dt_code]);


GO
CREATE STATISTICS [dt_place]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([dt_place]);


GO
CREATE STATISTICS [dt_place_code]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([dt_place_code]);


GO
CREATE STATISTICS [exp_acceptance_date]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_acceptance_date]);


GO
CREATE STATISTICS [exp_co_of_exit]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_co_of_exit]);


GO
CREATE STATISTICS [exp_co_of_exit_changed_to]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_co_of_exit_changed_to]);


GO
CREATE STATISTICS [exp_co_of_export]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_co_of_export]);


GO
CREATE STATISTICS [exp_containers]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_containers]);


GO
CREATE STATISTICS [exp_country_of_destinatnion]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_country_of_destinatnion]);


GO
CREATE STATISTICS [exp_country_of_export]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_country_of_export]);


GO
CREATE STATISTICS [exp_crn]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_crn]);


GO
CREATE STATISTICS [exp_decl_type_1a]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_decl_type_1a]);


GO
CREATE STATISTICS [exp_decl_type_1b]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_decl_type_1b]);


GO
CREATE STATISTICS [exp_digital_signature]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_digital_signature]);


GO
CREATE STATISTICS [exp_exit_date]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_exit_date]);


GO
CREATE STATISTICS [exp_exit_stopped_date]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_exit_stopped_date]);


GO
CREATE STATISTICS [exp_gross_mass]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_gross_mass]);


GO
CREATE STATISTICS [exp_gross_mass_br]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_gross_mass_br]);


GO
CREATE STATISTICS [exp_gross_mass_br_c]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_gross_mass_br_c]);


GO
CREATE STATISTICS [exp_no_of_items]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_no_of_items]);


GO
CREATE STATISTICS [exp_no_of_items_br]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_no_of_items_br]);


GO
CREATE STATISTICS [exp_no_of_items_br_c]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_no_of_items_br_c]);


GO
CREATE STATISTICS [exp_no_of_packages]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_no_of_packages]);


GO
CREATE STATISTICS [exp_no_of_packages_br]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_no_of_packages_br]);


GO
CREATE STATISTICS [exp_no_of_packages_br_c]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_no_of_packages_br_c]);


GO
CREATE STATISTICS [exp_release_date]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_release_date]);


GO
CREATE STATISTICS [exp_sp]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_sp]);


GO
CREATE STATISTICS [exp_specific_circumstance]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_specific_circumstance]);


GO
CREATE STATISTICS [exp_status]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_status]);


GO
CREATE STATISTICS [exp_storing]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_storing]);


GO
CREATE STATISTICS [exp_taxes_amount]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_taxes_amount]);


GO
CREATE STATISTICS [exp_time_to_auto_acceptance]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_time_to_auto_acceptance]);


GO
CREATE STATISTICS [exp_time_to_border_arrival]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_time_to_border_arrival]);


GO
CREATE STATISTICS [exp_time_to_exit_results]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_time_to_exit_results]);


GO
CREATE STATISTICS [exp_time_to_release_decision]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_time_to_release_decision]);


GO
CREATE STATISTICS [exp_time_to_send_exp_confirm]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_time_to_send_exp_confirm]);


GO
CREATE STATISTICS [exp_un_dangerous_goods]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([exp_un_dangerous_goods]);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([generacjaId]);


GO
CREATE STATISTICS [it_identity]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([it_identity]);


GO
CREATE STATISTICS [it_identity_br]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([it_identity_br]);


GO
CREATE STATISTICS [it_identity_br_c]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([it_identity_br_c]);


GO
CREATE STATISTICS [it_mode]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([it_mode]);


GO
CREATE STATISTICS [lof_co]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([lof_co]);


GO
CREATE STATISTICS [lof_location_code]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([lof_location_code]);


GO
CREATE STATISTICS [lof_location_desc]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([lof_location_desc]);


GO
CREATE STATISTICS [pad_capacity]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([pad_capacity]);


GO
CREATE STATISTICS [pad_date]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([pad_date]);


GO
CREATE STATISTICS [pad_name]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([pad_name]);


GO
CREATE STATISTICS [pad_phone]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([pad_phone]);


GO
CREATE STATISTICS [pad_place]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([pad_place]);


GO
CREATE STATISTICS [pos_location_code]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([pos_location_code]);


GO
CREATE STATISTICS [pos_location_desc]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([pos_location_desc]);


GO
CREATE STATISTICS [sc_city]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([sc_city]);


GO
CREATE STATISTICS [sc_co]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([sc_co]);


GO
CREATE STATISTICS [sc_country]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([sc_country]);


GO
CREATE STATISTICS [sc_name]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([sc_name]);


GO
CREATE STATISTICS [sc_post_code]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([sc_post_code]);


GO
CREATE STATISTICS [sc_street_and_number]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([sc_street_and_number]);


GO
CREATE STATISTICS [si_quantity]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([si_quantity]);


GO
CREATE STATISTICS [tab_country]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([tab_country]);


GO
CREATE STATISTICS [tab_identity]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([tab_identity]);


GO
CREATE STATISTICS [tab_mode]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([tab_mode]);


GO
CREATE STATISTICS [td_amount]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([td_amount]);


GO
CREATE STATISTICS [td_currency]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([td_currency]);


GO
CREATE STATISTICS [td_exchange_rate]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([td_exchange_rate]);


GO
CREATE STATISTICS [td_nature_of_transation]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([td_nature_of_transation]);


GO
CREATE STATISTICS [w_country]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([w_country]);


GO
CREATE STATISTICS [w_location_code]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([w_location_code]);


GO
CREATE STATISTICS [w_type]
    ON [stat].[dgt_kopia_ecs_exp_declcoexport]([w_type]);

