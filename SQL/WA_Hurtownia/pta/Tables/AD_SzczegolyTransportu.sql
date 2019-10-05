CREATE TABLE [pta].[AD_SzczegolyTransportu] (
    [Id]                     BIGINT         NOT NULL,
    [KodJednTransp]          CHAR (2)       NULL,
    [OznJednTransp]          NVARCHAR (35)  NULL,
    [OznaczeniePieczecHandl] NVARCHAR (35)  NULL,
    [InfPieczec]             NVARCHAR (350) NULL,
    [InfPieczecKodJezyka]    CHAR (2)       NULL,
    [DodInf]                 NVARCHAR (350) NULL,
    [DodInfKodJezyka]        CHAR (2)       NULL,
    [IdDokAD]                BIGINT         NOT NULL,
    CONSTRAINT [PK_AD_SzczegolyTransportu] PRIMARY KEY CLUSTERED ([Id] ASC) ON [FG_PTA],
    CONSTRAINT [FK_AD_SzczegolyTransportu_IdDokAD_AD_Dokument_Id] FOREIGN KEY ([IdDokAD]) REFERENCES [pta].[AD_Dokument] ([Id])
);

