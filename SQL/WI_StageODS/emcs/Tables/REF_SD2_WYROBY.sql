CREATE TABLE [emcs].[REF_SD2_WYROBY] (
    [ID]                   BIGINT          NOT NULL,
    [REF_SD2_PODMIOTY_NRA] VARCHAR (13)    NOT NULL,
    [KATEGORIA]            NVARCHAR (1)    NULL,
    [KOD]                  NVARCHAR (4)    NULL,
    [ILOSC]                NUMERIC (18, 3) NULL,
    [JEDNOSTKA]            NVARCHAR (7)    NULL,
    [REF_SD2_PODMIOTY_TYP] VARCHAR (5)     NOT NULL,
    CONSTRAINT [PK_REF_SD2_WYROBY] PRIMARY KEY CLUSTERED ([ID] ASC)
);

