CREATE TABLE [aies].[ICS_DSK_WSP_PODMIOT_GOSP] (
    [ID]                        NUMERIC (19) NOT NULL,
    [DSK_WSP_ADRES_ID]          NUMERIC (19) NULL,
    [DSK_WSP_PODP_DOK_ID]       NUMERIC (19) NULL,
    [EMAIL]                     VARCHAR (35) NULL,
    [EORI]                      VARCHAR (17) NULL,
    [IDENTYFIKATOR]             VARCHAR (18) NOT NULL,
    [NAZWA]                     VARCHAR (70) NULL,
    [REGON]                     VARCHAR (14) NULL,
    [TIN]                       VARCHAR (17) NULL,
    [PLACOWKA_PODMIOTU]         CHAR (2)     NULL,
    [RODZAJ_PRZEDSTAWICIELSTWA] CHAR (3)     NULL,
    CONSTRAINT [pk_ICS_DSK_WSP_PODMIOT_GOSP] PRIMARY KEY CLUSTERED ([ID] ASC)
);

