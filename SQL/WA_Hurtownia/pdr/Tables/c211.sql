CREATE TABLE [pdr].[c211] (
    [c211_id]              INT             NOT NULL,
    [bledne_logowania]     INT             NULL,
    [creation_tm]          DATETIME        NULL,
    [hasla_senc]           IMAGE           NULL,
    [haslo_awaryjne]       NVARCHAR (20)   NULL,
    [haslo_senc]           IMAGE           NULL,
    [kraj]                 VARCHAR (2)     NOT NULL,
    [last_modification_tm] DATETIME        NULL,
    [login]                NVARCHAR (40)   NULL,
    [loginaktywny]         BIT             NULL,
    [nazwisko_imie]        NVARCHAR (80)   NOT NULL,
    [placowka_edycji]      VARCHAR (8)     NULL,
    [rin]                  VARCHAR (17)    NOT NULL,
    [urzad_rejestrowy]     VARCHAR (8)     NULL,
    [valid_from]           DATE            NULL,
    [valid_to]             DATE            NULL,
    [zmiana_hasla]         DATE            NULL,
    [hasla]                NVARCHAR (1024) NULL,
    [haslo]                NVARCHAR (40)   NULL,
    [version_]             BIGINT          CONSTRAINT [DF__c211__version___53AD53A4] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK__c211__B9AA76E3640C7000] PRIMARY KEY CLUSTERED ([c211_id] ASC) ON [FG_PDR]
);

