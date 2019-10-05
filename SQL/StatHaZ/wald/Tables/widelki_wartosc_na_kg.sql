CREATE TABLE [wald].[widelki_wartosc_na_kg] (
    [kod_towarowy]  VARCHAR (8)     NOT NULL,
    [minimum_SAD]   DECIMAL (20, 2) NULL,
    [maksimum_SAD]  DECIMAL (20, 2) NULL,
    [minimum_INTR]  DECIMAL (20, 2) NULL,
    [maksimum_INTR] DECIMAL (20, 2) NULL,
    [pk]            BIGINT          IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_widelki_wartosc_na_kg] PRIMARY KEY CLUSTERED ([pk] ASC) ON [WaldDane]
);

