CREATE TABLE [pdr].[c228_procedura] (
    [c228_procedura_id] INT         NOT NULL,
    [kod_procedury]     VARCHAR (2) NOT NULL,
    [c228_id]           INT         NULL,
    PRIMARY KEY CLUSTERED ([c228_procedura_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c228_procedura_c228_id] FOREIGN KEY ([c228_id]) REFERENCES [pdr].[c228] ([c228_id])
);

