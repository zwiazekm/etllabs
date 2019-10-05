CREATE TABLE [pta].[AD_TypZadania] (
    [TypZadania] VARCHAR (35)  NOT NULL,
    [Opis]       VARCHAR (350) NOT NULL,
    CONSTRAINT [PK_AD_TypZadania] PRIMARY KEY CLUSTERED ([TypZadania] ASC) ON [FG_PTA]
);

