CREATE TABLE [pdr].[c228_urzad_objecia] (
    [c228_urzad_objecia_id] INT         NOT NULL,
    [kod_urzedu]            VARCHAR (8) NOT NULL,
    [c228_id]               INT         NULL,
    PRIMARY KEY CLUSTERED ([c228_urzad_objecia_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c228_urzad_objecia_c228_id] FOREIGN KEY ([c228_id]) REFERENCES [pdr].[c228] ([c228_id])
);

