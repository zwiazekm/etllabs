CREATE TABLE [aes2].[ecs_trs_reservation] (
    [ID]            NUMERIC (19)    NOT NULL,
    [ITEM_ID]       NUMERIC (19)    NULL,
    [DECL_ID]       NUMERIC (19)    NULL,
    [DECLCO_ID]     NUMERIC (19)    NULL,
    [POSID]         SMALLINT        NULL,
    [KOD]           NVARCHAR (6)    NULL,
    [MRN]           NVARCHAR (35)   NULL,
    [DECLCO_ITEM]   SMALLINT        NULL,
    [RESERVED_MASS] NUMERIC (11, 3) NULL,
    [VERSION]       INT             NOT NULL,
    [NCTS_COMMENT]  NVARCHAR (380)  NULL,
    CONSTRAINT [ecs_trs_reservation$ecs_trs_re_10650517991] PRIMARY KEY CLUSTERED ([ID] ASC)
);

