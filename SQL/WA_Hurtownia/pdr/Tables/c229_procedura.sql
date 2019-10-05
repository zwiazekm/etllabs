CREATE TABLE [pdr].[c229_procedura] (
    [c229_procedura_id] INT         NOT NULL,
    [kod_procedury]     VARCHAR (2) NOT NULL,
    [c229_id]           INT         NULL,
    PRIMARY KEY CLUSTERED ([c229_procedura_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c229_procedura_c229_id] FOREIGN KEY ([c229_id]) REFERENCES [pdr].[c229] ([c229_id])
);

