CREATE TABLE [emcs2].[AD_Opakowanie] (
    [Id]                                 NUMERIC (38)    NOT NULL,
    [KodRodzOpakowan]                    VARCHAR (2)     NOT NULL,
    [LiczbaOpakowan]                     FLOAT (53)      NULL,
    [OznPieczecHandl]                    VARCHAR (35)    NULL,
    [InfPieczecHandl]                    NVARCHAR (1050) NULL,
    [InformacjaPieczecHandlowaKodJezyka] VARCHAR (2)     NULL,
    [IdWyrobAD]                          NUMERIC (38)    NULL,
    CONSTRAINT [AD_Opakowanie$PK_AD_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

