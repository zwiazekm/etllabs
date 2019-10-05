CREATE TABLE [aes2].[MEX_Przewoznik] (
    [Id]          NUMERIC (19)   NOT NULL,
    [UlicaNumer]  NVARCHAR (105) NULL,
    [KodPocztowy] NVARCHAR (9)   NULL,
    [Miejscowosc] NVARCHAR (105) NULL,
    [Nazwa]       NVARCHAR (105) NULL,
    [Kraj]        NVARCHAR (2)   NULL,
    [KrajPid]     INT            NULL,
    [TIN]         NVARCHAR (17)  NULL,
    [IdDokMEX]    NUMERIC (19)   NULL,
    [Email]       NVARCHAR (70)  NULL,
    CONSTRAINT [MEX_Przewoznik$PK_MEX_Przewoznik] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_AES2],
    CONSTRAINT [FK__MEX_Przewoznik_IdDokMEX__MEX_Dokument_id] FOREIGN KEY ([IdDokMEX]) REFERENCES [aes2].[MEX_Dokument] ([Id])
);

