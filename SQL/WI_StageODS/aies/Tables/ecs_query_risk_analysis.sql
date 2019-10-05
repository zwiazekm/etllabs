CREATE TABLE [aies].[ecs_query_risk_analysis] (
    [id]                        NUMERIC (19)  NOT NULL,
    [item_number]               INT           NULL,
    [risk_analysis_lang]        VARCHAR (2)   NULL,
    [risk_analysis_result_code] VARCHAR (5)   NULL,
    [risk_analysis_text]        VARCHAR (350) NULL,
    [exportquery_id]            NUMERIC (19)  NULL,
    CONSTRAINT [ecs_query__19276748841] PRIMARY KEY CLUSTERED ([id] ASC)
);

