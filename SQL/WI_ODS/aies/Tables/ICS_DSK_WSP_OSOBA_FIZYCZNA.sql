CREATE TABLE [aies].[ICS_DSK_WSP_OSOBA_FIZYCZNA] (
    [ID]                        NUMERIC (19) NOT NULL,
    [DSK_WSP_ADRES_ID]          NUMERIC (19) NULL,
    [DSK_WSP_PODP_DOK_ID]       NUMERIC (19) NULL,
    [IDENTYFIKATOR]             VARCHAR (18) NULL,
    [IMIE]                      VARCHAR (30) NULL,
    [NAZWISKO]                  VARCHAR (40) NULL,
    [NR_IDENTYFIKACYJNY]        VARCHAR (30) NULL,
    [PESEL]                     VARCHAR (11) NULL,
    [PLACOWKA]                  CHAR (2)     NULL,
    [RODZAJ_PRZEDSTAWICIELSTWA] CHAR (3)     NULL,
    CONSTRAINT [pk_ICS_DSK_WSP_OSOBA_FIZYCZNA] PRIMARY KEY CLUSTERED ([ID] ASC) ON [FG_AIES]
);

