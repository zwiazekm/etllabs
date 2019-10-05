CREATE TABLE [emcs2].[AD_SzczegolyTransportu] (
    [Id]                           NUMERIC (38)    NOT NULL,
    [KodJednTransp]                VARCHAR (2)     NULL,
    [OznJednTransp]                NVARCHAR (105)  NULL,
    [OznaczeniePieczecHandl]       NVARCHAR (105)  NULL,
    [InfPieczec]                   NVARCHAR (1050) NULL,
    [InformacjaPieczecKodJezyka]   VARCHAR (2)     NULL,
    [DodInf]                       NVARCHAR (1050) NULL,
    [IdDokAD]                      NUMERIC (38)    NULL,
    [DodatkoweInformacjeKodJezyka] VARCHAR (2)     NULL,
    CONSTRAINT [AD_SzczegolyTransportu$PK_AD_SzczegolyTransportu] PRIMARY KEY CLUSTERED ([Id] ASC)
);

