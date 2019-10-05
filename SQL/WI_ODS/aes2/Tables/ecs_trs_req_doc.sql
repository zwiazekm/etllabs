CREATE TABLE [aes2].[ecs_trs_req_doc] (
    [ID]          NUMERIC (19)  NOT NULL,
    [TRS_ITEM_ID] NUMERIC (19)  NOT NULL,
    [POZ_ID]      INT           NULL,
    [KOD]         NVARCHAR (4)  NULL,
    [NR]          NVARCHAR (35) NULL,
    [UWAGI]       NVARCHAR (26) NULL,
    [VERSION]     INT           NOT NULL,
    CONSTRAINT [ecs_trs_req_doc$ecs_trs_re_13245287211] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AES2],
    CONSTRAINT [ecs_trs_req_doc$FK_ecs_trs_req_doc] FOREIGN KEY ([TRS_ITEM_ID]) REFERENCES [aes2].[ecs_trs_goods_item] ([ID])
);

