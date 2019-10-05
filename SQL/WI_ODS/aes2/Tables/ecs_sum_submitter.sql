﻿CREATE TABLE [aes2].[ecs_sum_submitter] (
    [id]                       NUMERIC (19)   NOT NULL,
    [street_and_no]            NVARCHAR (255) NULL,
    [postcode]                 NVARCHAR (255) NULL,
    [city]                     NVARCHAR (255) NULL,
    [name_f]                   NVARCHAR (255) NULL,
    [country]                  NVARCHAR (255) NULL,
    [tin]                      NVARCHAR (255) NULL,
    [regon]                    NVARCHAR (14)  NULL,
    [eori]                     NVARCHAR (17)  NULL,
    [sumdeclcoexit_decl_id]    NUMERIC (19)   NULL,
    [email]                    NVARCHAR (70)  NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)   NULL,
    CONSTRAINT [ecs_sum_submitter$ecs_sum_su_8814351831] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_sum_submitter$fk_submitter_sumdecl_co_exit] FOREIGN KEY ([sumdeclcoexit_decl_id]) REFERENCES [aes2].[ecs_sum_declcoexit] ([decl_id])
);

