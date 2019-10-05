CREATE TABLE [pdr].[c171_pozycja] (
    [c171_pozycja_id] INT         NOT NULL,
    [do_dnia]         VARCHAR (1) NOT NULL,
    [do_godziny]      VARCHAR (5) NOT NULL,
    [do_godziny2]     VARCHAR (5) NULL,
    [od_dnia]         VARCHAR (1) NOT NULL,
    [od_godziny]      VARCHAR (5) NOT NULL,
    [od_godziny2]     VARCHAR (5) NULL,
    [c171_sezon_id]   INT         NULL,
    PRIMARY KEY CLUSTERED ([c171_pozycja_id] ASC) ON [FG_PDR],
    CONSTRAINT [c171_pozycja_c171_sezon_id_fkey] FOREIGN KEY ([c171_sezon_id]) REFERENCES [pdr].[c171_sezon] ([c171_sezon_id])
);

