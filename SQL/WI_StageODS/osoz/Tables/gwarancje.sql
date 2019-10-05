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
    CONSTRAINT [PK__gwarancj__3213E83F9A286F79] PRIMARY KEY CLUSTERED ([id] ASC)
);

