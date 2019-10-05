CREATE TABLE [osoz].[pozwolenia] (
    [id]                          BIGINT          NOT NULL,
    [czas_modyfikacji]            DATETIME        NULL,
    [data_wydania_pozwolenia]     DATETIME2 (7)   NOT NULL,
    [kwota_referencyjna]          NUMERIC (19, 2) NULL,
    [numer_pozwolenia]            VARCHAR (50)    NOT NULL,
    [numer_sprawy]                VARCHAR (50)    NULL,
    [procent_kwoty_referencyjnej] VARCHAR (5)     NULL,
    CONSTRAINT [PK__pozwolen__3213E83F2B8D83F0] PRIMARY KEY CLUSTERED ([id] ASC)
);

