CREATE TABLE [pdr].[c153_zamknieciecelne] (
    [c153_zamknieciecelne_id] INT           NOT NULL,
    [nr]                      NVARCHAR (20) NOT NULL,
    [c153_id]                 INT           NULL,
    PRIMARY KEY CLUSTERED ([c153_zamknieciecelne_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c153_zamknieciecelne_c153_id] FOREIGN KEY ([c153_id]) REFERENCES [pdr].[c153] ([c153_id])
);

