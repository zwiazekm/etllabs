CREATE TABLE [tr].[SzczegolySkontrolowanejPozycji] (
    [SID]                           INT             NOT NULL,
    [MRN]                           VARCHAR (21)    NOT NULL,
    [NumerPozycjiTowarowej]         DECIMAL (5)     NOT NULL,
    [KodCN]                         CHAR (2)        NULL,
    [KodHS]                         VARCHAR (6)     NULL,
    [LokalizacjaKontroli]           CHAR (3)        NOT NULL,
    [MasaBrutto]                    DECIMAL (14, 3) NULL,
    [MasaNetto]                     DECIMAL (14, 3) NULL,
    [NumerWersjiUwagRozladunkowych] DECIMAL (8)     NOT NULL,
    [WskaznikKontroli]              CHAR (2)        NULL,
    CONSTRAINT [PK_SzczegolySkontrolowanejPozycji] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR]
);

