CREATE TABLE [pdr].[c4003_daneadresowepodmiotuzagr] (
    [c4003_daneadresowepodmiotuzagr_id] BIGINT         NOT NULL,
    [imie]                              NVARCHAR (60)  NULL,
    [kodpocztowy]                       VARCHAR (9)    NULL,
    [kraj]                              VARCHAR (2)    NULL,
    [miejscowosc]                       NVARCHAR (52)  NULL,
    [nazwapelna]                        NVARCHAR (300) NULL,
    [nazwisko]                          NVARCHAR (90)  NULL,
    [numerdomu]                         NVARCHAR (10)  NULL,
    [numerlokalu]                       NVARCHAR (10)  NULL,
    [poczta]                            NVARCHAR (52)  NULL,
    [skrytkapocztowa]                   VARCHAR (10)   NULL,
    [ulica]                             NVARCHAR (80)  NULL,
    [c4003_zakresdzialalnosci_id]       BIGINT         NULL,
    PRIMARY KEY CLUSTERED ([c4003_daneadresowepodmiotuzagr_id] ASC) ON [FG_PDR],
    CONSTRAINT [c4003_daneadresowepodmiotuzagr_c4003_zakresdzialalnosci_id_fkey] FOREIGN KEY ([c4003_zakresdzialalnosci_id]) REFERENCES [pdr].[c4003_zakresdzialalnosci] ([c4003_zakresdzialalnosci_id])
);

