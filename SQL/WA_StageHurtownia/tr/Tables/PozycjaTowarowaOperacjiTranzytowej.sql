CREATE TABLE [tr].[PozycjaTowarowaOperacjiTranzytowej] (
    [SID]                          INT             NOT NULL,
    [TypDeklaracji]                VARCHAR (5)     NULL,
    [NumerWersji]                  DECIMAL (3)     NULL,
    [SIDOdbiorcy]                  INT             NULL,
    [SIDOdbiorcyPDR]               INT             NULL,
    [SIDNadawcy]                   INT             NULL,
    [SIDNadawcyPDR]                INT             NULL,
    [CzyTowarWstrzymany]           BIT             NULL,
    [IDKrajuPrzeznaczenia]         CHAR (2)        NULL,
    [IDKrajuWysylki]               CHAR (2)        NULL,
    [NumerPozycjiTowarowej]        DECIMAL (5)     NOT NULL,
    [KodCN]                        CHAR (2)        NULL,
    [KodHS]                        VARCHAR (6)     NULL,
    [KodDlaTowarowNiebezpiecznych] VARCHAR (4)     NULL,
    [MasaBrutto]                   DECIMAL (14, 3) NULL,
    [MasaNetto]                    DECIMAL (14, 3) NULL,
    [MRN]                          VARCHAR (21)    NULL,
    [CRN]                          VARCHAR (70)    NULL,
    [SIDOperacjiTranzytowej]       INT             NULL,
    [OplataTranspMetodaPlatnosci]  CHAR (1)        NULL,
    CONSTRAINT [PK_PozycjaTowarowaOperacjiTranzytowej] PRIMARY KEY CLUSTERED ([SID] ASC)
);

