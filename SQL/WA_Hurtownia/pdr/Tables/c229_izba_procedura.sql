CREATE TABLE [pdr].[c229_izba_procedura] (
    [c229_izba_procedura_id] INT         NOT NULL,
    [kod_procedury]          VARCHAR (2) NOT NULL,
    [c229_izba_objecia_id]   INT         NULL,
    PRIMARY KEY CLUSTERED ([c229_izba_procedura_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c229_izba_procedura_c229_izba_objecia_id] FOREIGN KEY ([c229_izba_objecia_id]) REFERENCES [pdr].[c229_izba_objecia] ([c229_izba_objecia_id])
);

