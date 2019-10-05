CREATE TABLE [aes2].[ZUZ_Pozwolenie] (
    [Id]                      NUMERIC (19)  NOT NULL,
    [NumerPozwolenia]         NVARCHAR (17) NULL,
    [NumerPozwoleniaWUzupeln] NVARCHAR (17) NULL,
    [IdDokZUZ]                NUMERIC (19)  NULL,
    CONSTRAINT [ZUZ_Pozwolenie$PK_ZUZ_Pozwolenie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

