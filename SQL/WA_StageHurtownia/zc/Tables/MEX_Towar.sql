CREATE TABLE [zc].[MEX_Towar] (
    [Id]                    DECIMAL (19)    NOT NULL,
    [NrPozycji]             INT             NULL,
    [NrDokPrzewozowego]     NVARCHAR (35)   NULL,
    [KodTowarowy]           VARCHAR (8)     NULL,
    [KodTowarowyPid]        INT             NULL,
    [MasaBrutto]            DECIMAL (18, 3) NULL,
    [OpisTowaru]            NVARCHAR (280)  NULL,
    [OpakowanieRodzaj]      CHAR (3)        NULL,
    [OpakowanieRodzajPid]   INT             NULL,
    [OpakowanieZnaki]       NVARCHAR (42)   NULL,
    [OpakowanieLiczba]      INT             NULL,
    [OpakowanieLiczbaSztuk] INT             NULL,
    [IdDokMEX]              DECIMAL (19)    NULL,
    CONSTRAINT [PK_MEX_Towar] PRIMARY KEY CLUSTERED ([Id] ASC)
);

