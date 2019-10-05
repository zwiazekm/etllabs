CREATE TABLE [tr].[Podmioty] (
    [SID]                          INT            NOT NULL,
    [IDKraju]                      CHAR (2)       NULL,
    [KodPocztowy]                  VARCHAR (27)   NULL,
    [Miejscowosc]                  NVARCHAR (105) NULL,
    [Nazwa]                        NVARCHAR (105) NULL,
    [PosiadaczKarnetuTIR]          NUMERIC (1)    NULL,
    [RodzajIdentyfikatoraPodmiotu] DECIMAL (1)    NULL,
    [TIN]                          VARCHAR (17)   NULL,
    [UlicaINrDomu]                 NVARCHAR (105) NULL,
    CONSTRAINT [PK_Podmioty] PRIMARY KEY CLUSTERED ([SID] ASC)
);

