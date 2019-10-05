CREATE TABLE [pdr].[c153_tranzyt] (
    [c153_tranzyt_id] INT         NOT NULL,
    [kod_tranzytu]    VARCHAR (4) NOT NULL,
    [c153_id]         INT         NULL,
    PRIMARY KEY CLUSTERED ([c153_tranzyt_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c153_tranzyt_c153_id] FOREIGN KEY ([c153_id]) REFERENCES [pdr].[c153] ([c153_id])
);

