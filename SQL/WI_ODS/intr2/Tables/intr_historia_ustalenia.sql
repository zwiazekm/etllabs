CREATE TABLE [intr2].[intr_historia_ustalenia] (
    [nr_ustalenia] INT            NOT NULL,
    [nr_zmiany]    INT            NOT NULL,
    [data]         DATETIME2 (3)  NULL,
    [operator]     NVARCHAR (40)  NULL,
    [nazwa_danej]  NVARCHAR (255) NULL,
    [przed]        NVARCHAR (512) NULL,
    [po]           NVARCHAR (512) NULL,
    [nip]          NVARCHAR (10)  NOT NULL,
    [rok]          INT            NOT NULL,
    [miesiac]      INT            NOT NULL,
    [typ]          NCHAR (1)      NOT NULL,
    CONSTRAINT [intr_historia_ustalenia$PK_INTR_HISTORIA_USTALENIA] PRIMARY KEY CLUSTERED ([nr_ustalenia] ASC, [nr_zmiany] ASC, [nip] ASC, [rok] ASC, [miesiac] ASC, [typ] ASC) ON [FG_INTR2],
    CONSTRAINT [intr_historia_ustalenia$FK_INTR_HIS_UST_INTR_USTAL] FOREIGN KEY ([nr_ustalenia], [nip], [rok], [miesiac], [typ]) REFERENCES [intr2].[intr_ustalenia] ([nr_ustalenia], [nip], [rok], [miesiac], [typ])
);

