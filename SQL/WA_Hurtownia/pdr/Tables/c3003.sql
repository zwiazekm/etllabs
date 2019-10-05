CREATE TABLE [pdr].[c3003] (
    [c3003_id]                  INT           NOT NULL,
    [code]                      VARCHAR (10)  NOT NULL,
    [creation_tm]               DATETIME      NULL,
    [last_modification_tm]      DATETIME      NULL,
    [nazwakodgrupyzatrudnienia] NVARCHAR (80) NOT NULL,
    [valid_from]                DATE          NOT NULL,
    [valid_to]                  DATE          NULL,
    [version_]                  BIGINT        DEFAULT ((0)) NOT NULL,
    [zablokowane]               BIT           NULL,
    PRIMARY KEY CLUSTERED ([c3003_id] ASC) ON [FG_PDR]
);

