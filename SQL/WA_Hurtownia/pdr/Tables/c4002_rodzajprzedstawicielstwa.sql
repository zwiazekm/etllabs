CREATE TABLE [pdr].[c4002_rodzajprzedstawicielstwa] (
    [c4002_rodzajprzedstawicielstwa_id] BIGINT       NOT NULL,
    [rodzaj]                            VARCHAR (10) NULL,
    [c4002_uprawnienia_id]              BIGINT       NULL,
    PRIMARY KEY CLUSTERED ([c4002_rodzajprzedstawicielstwa_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4002_rodzajprzedstawicielstwa_c4002_uprawnienia_id_fkey] FOREIGN KEY ([c4002_uprawnienia_id]) REFERENCES [pdr].[c4002_uprawnienia] ([c4002_uprawnienia_id])
);

