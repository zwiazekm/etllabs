CREATE TABLE [cel].[v2_ds_odbiorca] (
    [idDokNr]     BIGINT       NOT NULL,
    [PozId]       SMALLINT     NOT NULL,
    [Nazwa]       VARCHAR (35) NULL,
    [UlicaNumer]  VARCHAR (35) NULL,
    [KodPocztowy] VARCHAR (9)  NULL,
    [Miejscowosc] VARCHAR (35) NULL,
    CONSTRAINT [PK_v2_ds_odbiorca] PRIMARY KEY CLUSTERED ([idDokNr] ASC, [PozId] ASC) WITH (FILLFACTOR = 90)
);

