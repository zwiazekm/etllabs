CREATE TABLE [zc].[DWU_Towar] (
    [Id]                    DECIMAL (19)    NOT NULL,
    [NrPozycji]             INT             NULL,
    [CRN]                   VARCHAR (70)    NULL,
    [TowNiebezp]            VARCHAR (4)     NULL,
    [TowNiebezpPid]         INT             NULL,
    [OpisTowaru]            VARCHAR (280)   NULL,
    [KodTowarowy]           VARCHAR (8)     NULL,
    [KodTowarowyPid]        INT             NULL,
    [MasaBrutto]            DECIMAL (18, 3) NULL,
    [OplatyTransportowe]    CHAR (1)        NULL,
    [OplatyTransportowePid] INT             NULL,
    [IdDokDWU]              DECIMAL (19)    NULL,
    CONSTRAINT [PK_DWU_Towar] PRIMARY KEY CLUSTERED ([Id] ASC)
);

