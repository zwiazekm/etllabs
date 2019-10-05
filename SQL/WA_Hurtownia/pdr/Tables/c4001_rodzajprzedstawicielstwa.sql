CREATE TABLE [pdr].[c4001_rodzajprzedstawicielstwa] (
    [c4001_rodzajprzedstawicielstwa_id] BIGINT       NOT NULL,
    [rodzaj]                            VARCHAR (10) NULL,
    [c4001_uprawnienia_id]              BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([c4001_rodzajprzedstawicielstwa_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4001_rodzajprzedstawicielstwa_c4001_uprawnienia_id_fkey] FOREIGN KEY ([c4001_uprawnienia_id]) REFERENCES [pdr].[c4001_uprawnienia] ([c4001_uprawnienia_id])
);

