CREATE TABLE [aies].[ecs_los_declcoexit] (
    [exp_acceptance_date]    DATETIME        NULL,
    [exp_exit_agreementDate] DATETIME        NULL,
    [exp_co_of_exit]         VARCHAR (8)     NULL,
    [los_co_of_lodg]         VARCHAR (8)     NULL,
    [crn]                    VARCHAR (70)    NULL,
    [exp_digital_signature]  TINYINT         NULL,
    [gross_mass]             NUMERIC (18, 3) NULL,
    [exp_no_of_items]        INT             NULL,
    [exp_no_of_packages]     INT             NULL,
    [peculiar_circumstances] VARCHAR (1)     NULL,
    [pad_date]               DATETIME        NULL,
    [pad_phone]              VARCHAR (15)    NULL,
    [pad_place]              VARCHAR (35)    NULL,
    [exp_status]             CHAR (1)        NULL,
    [transport_fee_pay_type] VARCHAR (1)     NULL,
    [decl_id]                NUMERIC (19)    NOT NULL,
    [exp_agreement_date]     DATETIME        NULL,
    [log_co]                 VARCHAR (8)     NULL,
    [log_location_desc]      VARCHAR (255)   NULL,
    [log_location_code]      VARCHAR (255)   NULL,
    CONSTRAINT [ecs_los_de_20758674311] PRIMARY KEY CLUSTERED ([decl_id] ASC)
);

