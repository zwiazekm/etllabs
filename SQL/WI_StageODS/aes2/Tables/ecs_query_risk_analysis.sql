﻿CREATE TABLE [aes2].[ecs_query_risk_analysis] (
    [id]                        NUMERIC (19)   NOT NULL,
    [item_number]               INT            NULL,
    [risk_analysis_lang]        NVARCHAR (2)   NULL,
    [risk_analysis_result_code] NVARCHAR (5)   NULL,
    [risk_analysis_text]        NVARCHAR (350) NULL,
    [exportquery_id]            NUMERIC (19)   NULL,
    CONSTRAINT [ecs_query_risk_analysis$ecs_query__19276748841] PRIMARY KEY CLUSTERED ([id] ASC)
);

