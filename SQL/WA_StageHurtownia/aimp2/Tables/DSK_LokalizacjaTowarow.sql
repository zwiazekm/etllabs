CREATE TABLE [aimp2].[DSK_LokalizacjaTowarow] (
    [IdLokalizacji]                   NUMERIC (19)  NOT NULL,
    [IdDok]                           NUMERIC (19)  NOT NULL,
    [DodatkowyIdLokalizacji]          NVARCHAR (3)  NULL,
    [KodUrzeduSkladujacegoTowar]      NVARCHAR (8)  NULL,
    [KodUrzeduSkladujacegoTowarPid]   INT           NULL,
    [KodMiejscaLokalizacjiTowaru]     NVARCHAR (17) NULL,
    [KodMiejscaLokalizacjiTowaruPid]  INT           NULL,
    [KrajMiejscaLokalizacjiTowaru]    NCHAR (2)     NULL,
    [KrajMiejscaLokalizacjiTowaruPid] INT           NULL,
    [KwalifikatorLokalizacji]         NCHAR (1)     NULL,
    [KwalifikatorLokalizacjiPid]      INT           NULL,
    [OpisMiejscaLokalizacjiTowaru]    NVARCHAR (70) NULL,
    [TypLokalizacji]                  NCHAR (1)     NULL,
    [TypLokalizacjiPid]               INT           NULL,
    CONSTRAINT [DSK_LokalizacjaTowarow_PK] PRIMARY KEY CLUSTERED ([IdLokalizacji] ASC)
);

