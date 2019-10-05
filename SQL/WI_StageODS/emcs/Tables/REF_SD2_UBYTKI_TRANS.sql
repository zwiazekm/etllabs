CREATE TABLE [emcs].[REF_SD2_UBYTKI_TRANS] (
    [ID]                   BIGINT          NOT NULL,
    [REF_SD2_PODMIOTY_NRA] VARCHAR (13)    NOT NULL,
    [REF_SD2_PODMIOTY_TYP] VARCHAR (5)     NOT NULL,
    [KOD]                  NVARCHAR (4)    NOT NULL,
    [NORMA]                NUMERIC (10, 5) NOT NULL,
    [SPOSOB_WYLICZENIA]    NVARCHAR (3)    NOT NULL,
    [OBOWIAZUJE_OD]        DATE            NOT NULL,
    [OBOWIAZUJE_DO]        DATE            NULL,
    CONSTRAINT [UBT_PK] PRIMARY KEY CLUSTERED ([ID] ASC)
);

