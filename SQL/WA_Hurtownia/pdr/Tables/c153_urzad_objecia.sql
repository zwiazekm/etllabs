CREATE TABLE [pdr].[c153_urzad_objecia] (
    [c153_urzad_objecia_id] INT         NOT NULL,
    [czas_na_decyzje]       INT         NULL,
    [czas_na_powiadomienie] INT         NULL,
    [kod_urzedu]            VARCHAR (8) NOT NULL,
    [c153_id]               INT         NULL,
    PRIMARY KEY CLUSTERED ([c153_urzad_objecia_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c153_urzad_objecia_c153_id] FOREIGN KEY ([c153_id]) REFERENCES [pdr].[c153] ([c153_id])
);

