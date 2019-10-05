CREATE TABLE [pdr].[c4003_daneidentyfikacyjne] (
    [c4003_daneidentyfikacyjne_id] BIGINT         NOT NULL,
    [datarejestracji]              DATE           NULL,
    [datarozpoczeciadzialalnosci]  DATE           NULL,
    [datawznowieniadzialalnosci]   DATE           NULL,
    [datazawieszeniadzialalnosci]  DATE           NULL,
    [eori]                         VARCHAR (17)   NULL,
    [formaprawna]                  NVARCHAR (1)   NULL,
    [formaprawnatc]                NVARCHAR (50)  NULL,
    [imie]                         NVARCHAR (60)  NULL,
    [krs]                          VARCHAR (10)   NULL,
    [nazwapelna]                   NVARCHAR (300) NULL,
    [nazwaskrocona]                NVARCHAR (35)  NULL,
    [nazwisko]                     NVARCHAR (90)  NULL,
    [nip]                          VARCHAR (10)   NULL,
    [nrtc]                         NVARCHAR (17)  NULL,
    [regon]                        VARCHAR (14)   NULL,
    [rodzajpodmiotu]               CHAR (2)       NOT NULL,
    [szczegolyformyprawnej]        CHAR (2)       NULL,
    [c4003_id]                     BIGINT         NULL,
    [kodjezyka]                    CHAR (2)       NULL,
    CONSTRAINT [PK__tmp_ms_x__87EE428CBFBA050E] PRIMARY KEY CLUSTERED ([c4003_daneidentyfikacyjne_id] ASC)
);

