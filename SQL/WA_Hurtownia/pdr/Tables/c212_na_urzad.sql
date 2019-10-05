CREATE TABLE [pdr].[c212_na_urzad] (
    [c212_na_urzad_id]           INT         NOT NULL,
    [elektroniczna_dv1]          BIT         NOT NULL,
    [podpis_elektroniczny]       BIT         NOT NULL,
    [urzad]                      VARCHAR (8) NOT NULL,
    [zgloszenie_bez_zalacznikow] BIT         NOT NULL,
    [zgloszenie_przed_towarem]   BIT         NOT NULL,
    [c212_id]                    INT         NULL,
    PRIMARY KEY CLUSTERED ([c212_na_urzad_id] ASC) ON [FG_PDR],
    CONSTRAINT [c212_na_urzad_c212_id_fkey] FOREIGN KEY ([c212_id]) REFERENCES [pdr].[c212] ([c212_id])
);

