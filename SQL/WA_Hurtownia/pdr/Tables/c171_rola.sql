CREATE TABLE [pdr].[c171_rola] (
    [c171_rola_id]    INT         NOT NULL,
    [rola]            VARCHAR (3) NOT NULL,
    [transport]       VARCHAR (3) NOT NULL,
    [c171_pozycja_id] INT         NULL,
    PRIMARY KEY CLUSTERED ([c171_rola_id] ASC) ON [FG_PDR],
    CONSTRAINT [c171_rola_c171_pozycja_id_fkey] FOREIGN KEY ([c171_pozycja_id]) REFERENCES [pdr].[c171_pozycja] ([c171_pozycja_id])
);

