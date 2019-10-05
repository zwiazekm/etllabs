CREATE TABLE [pta].[AD_Opakowanie] (
    [Id]              BIGINT         NOT NULL,
    [KodRodzOpakowan] CHAR (2)       NOT NULL,
    [LiczbaOpakowan]  BIGINT         NULL,
    [OznPieczecHandl] VARCHAR (35)   NULL,
    [InfPieczecHandl] NVARCHAR (350) NULL,
    [IdWyrobAD]       BIGINT         NOT NULL,
    CONSTRAINT [PK_AD_Opakowanie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

