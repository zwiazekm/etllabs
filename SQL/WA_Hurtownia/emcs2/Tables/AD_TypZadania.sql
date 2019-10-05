CREATE TABLE [emcs2].[AD_TypZadania] (
    [TypZadania] VARCHAR (40)  NOT NULL,
    [Opis]       VARCHAR (350) NOT NULL,
    CONSTRAINT [AD_TypZadania$PK_AD_TypZadania] PRIMARY KEY CLUSTERED ([TypZadania] ASC) ON [FG_EMCS2]
);

