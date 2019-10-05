CREATE TABLE [pdr].[c229_izba_objecia] (
    [c229_izba_objecia_id] INT         NOT NULL,
    [kod_izby]             VARCHAR (8) NOT NULL,
    [c229_id]              INT         NULL,
    PRIMARY KEY CLUSTERED ([c229_izba_objecia_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c229_izba_objecia_c229_id] FOREIGN KEY ([c229_id]) REFERENCES [pdr].[c229] ([c229_id])
);

