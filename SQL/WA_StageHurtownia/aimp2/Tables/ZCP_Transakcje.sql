CREATE TABLE [aimp2].[ZCP_Transakcje] (
    [IdTransakcji]        NUMERIC (19)    NOT NULL,
    [IdDok]               NUMERIC (19)    NULL,
    [KursWaluty]          NUMERIC (12, 5) NULL,
    [WalutaFaktur]        NVARCHAR (3)    NULL,
    [WalutaFakturPid]     INT             NULL,
    [RodzajTransakcji]    NUMERIC (2)     NULL,
    [RodzajTransakcjiPid] INT             NULL,
    [SzczegolyWartosci]   NVARCHAR (1)    NULL,
    CONSTRAINT [ZCP_Transakcje_PK] PRIMARY KEY CLUSTERED ([IdTransakcji] ASC)
);

