CREATE TABLE [pdr].[c228_produkt] (
    [c228_produkt_id] INT          NOT NULL,
    [kod_towaru]      VARCHAR (10) NOT NULL,
    [c228_id]         INT          NULL,
    PRIMARY KEY CLUSTERED ([c228_produkt_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c228_produkt_c228_id] FOREIGN KEY ([c228_id]) REFERENCES [pdr].[c228] ([c228_id])
);

