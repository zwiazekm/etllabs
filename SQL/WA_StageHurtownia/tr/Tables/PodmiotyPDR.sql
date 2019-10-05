CREATE TABLE [tr].[PodmiotyPDR] (
    [SID]                 INT            NOT NULL,
    [IDKraju]             CHAR (2)       NOT NULL,
    [KodPocztowy]         VARCHAR (27)   NULL,
    [Miejscowosc]         NVARCHAR (105) NULL,
    [Nazwa]               NVARCHAR (105) NULL,
    [OsobaKontaktowa]     VARCHAR (35)   NULL,
    [PodmiotEDI]          CHAR (1)       NULL,
    [TIN]                 VARCHAR (17)   NULL,
    [UlicaINrDomu]        NVARCHAR (105) NULL,
    [PosiadaczKarnetuTIR] DECIMAL (1)    NULL,
    CONSTRAINT [PK_PodmiotyPDR] PRIMARY KEY CLUSTERED ([SID] ASC)
);

