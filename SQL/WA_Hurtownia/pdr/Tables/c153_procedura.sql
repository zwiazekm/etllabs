CREATE TABLE [pdr].[c153_procedura] (
    [c153_procedura_id] INT         NOT NULL,
    [kod_procedury]     VARCHAR (2) NOT NULL,
    [c153_id]           INT         NULL,
    PRIMARY KEY CLUSTERED ([c153_procedura_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c153_procedura_c153_id] FOREIGN KEY ([c153_id]) REFERENCES [pdr].[c153] ([c153_id])
);

