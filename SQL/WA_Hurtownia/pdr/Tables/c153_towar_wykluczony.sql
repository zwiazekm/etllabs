CREATE TABLE [pdr].[c153_towar_wykluczony] (
    [c153_towar_wykluczony_id] INT          NOT NULL,
    [kod_towaru]               VARCHAR (10) NOT NULL,
    [c153_id]                  INT          NULL,
    PRIMARY KEY CLUSTERED ([c153_towar_wykluczony_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c153_towar_wykluczony_c153_id] FOREIGN KEY ([c153_id]) REFERENCES [pdr].[c153] ([c153_id])
);

