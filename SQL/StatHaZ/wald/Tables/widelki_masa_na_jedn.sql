CREATE TABLE [wald].[widelki_masa_na_jedn] (
    [kod_towarowy]  VARCHAR (8)     NULL,
    [minimum_SAD]   DECIMAL (20, 2) NULL,
    [maksimum_SAD]  DECIMAL (20, 2) NULL,
    [minimum_INTR]  DECIMAL (20, 2) NULL,
    [maksimum_INTR] DECIMAL (20, 2) NULL,
    [pk]            BIGINT          IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_widelki_masa_na_jedn] PRIMARY KEY CLUSTERED ([pk] ASC) ON [WaldDane]
);

