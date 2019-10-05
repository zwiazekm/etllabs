CREATE TABLE [pdr].[c153_miejsceobjecia] (
    [c153_miejsceobjecia_id] INT          NOT NULL,
    [kod_miejsca]            VARCHAR (17) NOT NULL,
    [c153_id]                INT          NULL,
    PRIMARY KEY CLUSTERED ([c153_miejsceobjecia_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c153_miejsceobjecia_c153_id] FOREIGN KEY ([c153_id]) REFERENCES [pdr].[c153] ([c153_id])
);

