CREATE TABLE [osoz].[gwarancje] (
    [id]                         BIGINT          NOT NULL,
    [czas_modyfikacji]           DATETIME        NULL,
    [data_wystawienia_gwarancji] DATETIME        NOT NULL,
    [kwota_gwarancji]            NUMERIC (19, 2) NOT NULL,
    [numer_gwarancji]            VARCHAR (70)    NOT NULL,
    [gwarancja_wazna_do]         DATETIME2 (7)   NULL,
    [gwarancja_wazna_od]         DATETIME2 (7)   NULL,
    [forma_zabezpieczenia_id]    BIGINT          NOT NULL,
    [gwarant_id]                 BIGINT          NOT NULL,
    CONSTRAINT [PK__gwarancj__3213E83F03F4EB88] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_OSOZ],
    CONSTRAINT [fk6a9be8f028675d32] FOREIGN KEY ([gwarant_id]) REFERENCES [osoz].[gwaranci] ([id]),
    CONSTRAINT [fk6a9be8f04792384d] FOREIGN KEY ([forma_zabezpieczenia_id]) REFERENCES [osoz].[forma_zabezpieczenia] ([id])
);

