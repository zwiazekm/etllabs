CREATE TABLE [aes2].[MEX_Towar] (
    [Id]                    NUMERIC (19)    NOT NULL,
    [MasaBrutto]            NUMERIC (18, 3) NULL,
    [OpakowanieLiczba]      INT             NULL,
    [NrPozycji]             INT             NULL,
    [NrDokPrzewozowego]     NVARCHAR (105)  NULL,
    [OpakowanieRodzaj]      NVARCHAR (3)    NULL,
    [OpakowanieRodzajPid]   INT             NULL,
    [OpakowanieZnaki]       NVARCHAR (126)  NULL,
    [OpakowanieLiczbaSztuk] INT             NULL,
    [KodTowarowy]           NVARCHAR (8)    NULL,
    [KodTowarowyPid]        INT             NULL,
    [OpisTowaru]            NVARCHAR (840)  NULL,
    [IdDokMEX]              NUMERIC (19)    NULL,
    CONSTRAINT [MEX_Towar$PK_MEX_Towar] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__MEX_Towar_IdDokMEX__MEX_Dokument_id] FOREIGN KEY ([IdDokMEX]) REFERENCES [aes2].[MEX_Dokument] ([Id])
);

