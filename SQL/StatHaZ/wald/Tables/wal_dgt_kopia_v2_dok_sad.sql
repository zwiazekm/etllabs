CREATE TABLE [wald].[wal_dgt_kopia_v2_dok_sad] (
    [stat]              CHAR (1)        NULL,
    [koment]            VARCHAR (50)    NULL,
    [idDokNr]           BIGINT          NOT NULL,
    [IdDok]             VARCHAR (30)    NULL,
    [LiczbaPozycji]     SMALLINT        NULL,
    [LiczbaOpakowan]    INT             NULL,
    [KrajWysylki]       VARCHAR (2)     NULL,
    [KrajPrzeznaczenia] VARCHAR (2)     NULL,
    [Kontenery]         BIT             NULL,
    [RodzajTransakcji]  VARCHAR (2)     NULL,
    [MasaBrutto]        DECIMAL (14, 3) NULL,
    [KodDost]           VARCHAR (3)     NULL,
    [MiejsceDost]       VARCHAR (35)    NULL,
    [MiejsceKodDost]    CHAR (1)        NULL,
    [Waluta]            VARCHAR (3)     NULL,
    [Wartosc]           DECIMAL (17, 2) NULL,
    [KursWaluty]        DECIMAL (10, 4) NULL,
    [NrCelina2]         VARCHAR (40)    NULL,
    [generacjaId]       INT             NOT NULL,
    CONSTRAINT [PK_wal_dgt_kopia_v2_dok_sad] PRIMARY KEY CLUSTERED ([idDokNr] ASC) ON [WaldDane]
);

