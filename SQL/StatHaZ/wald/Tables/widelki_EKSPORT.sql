CREATE TABLE [wald].[widelki_EKSPORT] (
    [kod_towarowy]  VARCHAR (8)     NULL,
    [znak]          VARCHAR (20)    NULL,
    [kraj_przezn]   VARCHAR (2)     NULL,
    [min]           DECIMAL (20, 2) NULL,
    [max]           DECIMAL (20, 2) NULL,
    [srednia]       DECIMAL (20, 2) NULL,
    [rowki_wejscie] NUMERIC (18)    NULL,
    [rowki_odrzut]  NUMERIC (18)    NULL,
    [pk]            BIGINT          IDENTITY (1, 1) NOT NULL
);


GO
CREATE CLUSTERED INDEX [widelki_EKSPORT_cn_znak_kraj]
    ON [wald].[widelki_EKSPORT]([kod_towarowy] ASC, [znak] ASC, [kraj_przezn] ASC)
    ON [WaldDane];

