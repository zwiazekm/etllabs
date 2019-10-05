CREATE TABLE [pdr].[c232_pozycja] (
    [c232_pozycja_id] INT         NOT NULL,
    [do_dnia]         VARCHAR (1) NOT NULL,
    [do_godziny]      VARCHAR (5) NOT NULL,
    [do_godziny2]     VARCHAR (5) NULL,
    [od_dnia]         VARCHAR (1) NOT NULL,
    [od_godziny]      VARCHAR (5) NOT NULL,
    [od_godziny2]     VARCHAR (5) NULL,
    [c232_sezon_id]   INT         NULL,
    PRIMARY KEY CLUSTERED ([c232_pozycja_id] ASC) ON [FG_PDR],
    CONSTRAINT [c232_pozycja_c232_sezon_id_fkey] FOREIGN KEY ([c232_sezon_id]) REFERENCES [pdr].[c232_sezon] ([c232_sezon_id])
);

