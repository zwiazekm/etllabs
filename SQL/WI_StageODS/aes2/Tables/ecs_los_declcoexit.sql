﻿CREATE TABLE [aes2].[ecs_los_declcoexit] (
    [exp_acceptance_date]    DATETIME2 (3)   NULL,
    [exp_exit_agreementDate] DATETIME2 (3)   NULL,
    [exp_co_of_exit]         NVARCHAR (8)    NULL,
    [los_co_of_lodg]         NVARCHAR (8)    NULL,
    [crn]                    NVARCHAR (70)   NULL,
    [exp_digital_signature]  TINYINT         NULL,
    [gross_mass]             NUMERIC (18, 3) NULL,
    [exp_no_of_items]        INT             NULL,
    [exp_no_of_packages]     INT             NULL,
    [peculiar_circumstances] NVARCHAR (1)    NULL,
    [pad_date]               DATETIME2 (3)   NULL,
    [pad_phone]              NVARCHAR (15)   NULL,
    [pad_place]              NVARCHAR (35)   NULL,
    [exp_status]             NCHAR (1)       NULL,
    [transport_fee_pay_type] NVARCHAR (1)    NULL,
    [decl_id]                NUMERIC (19)    NOT NULL,
    [exp_agreement_date]     DATETIME2 (3)   NULL,
    [log_co]                 NVARCHAR (8)    NULL,
    [log_location_desc]      NVARCHAR (255)  NULL,
    [log_location_code]      NVARCHAR (255)  NULL,
    CONSTRAINT [ecs_los_declcoexit$ecs_los_de_20758674311] PRIMARY KEY CLUSTERED ([decl_id] ASC)
);

