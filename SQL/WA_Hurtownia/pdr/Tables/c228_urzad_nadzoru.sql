CREATE TABLE [pdr].[c228_urzad_nadzoru] (
    [c228_urzad_nadzoru_id] INT         NOT NULL,
    [kod_urzedu]            VARCHAR (8) NOT NULL,
    [c228_id]               INT         NULL,
    PRIMARY KEY CLUSTERED ([c228_urzad_nadzoru_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c228_urzad_nadzoru_c228_id] FOREIGN KEY ([c228_id]) REFERENCES [pdr].[c228] ([c228_id])
);

