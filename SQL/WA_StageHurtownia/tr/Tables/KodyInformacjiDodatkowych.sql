CREATE TABLE [tr].[KodyInformacjiDodatkowych] (
    [Id]                           VARCHAR (5)   NOT NULL,
    [NazwaPL]                      VARCHAR (210) NULL,
    [NazwaEN]                      VARCHAR (210) NULL,
    [CzyWysylanyDoDomenyWspolnej]  BIT           NULL,
    [OpisKoduInformacjiDodatkowej] NVARCHAR (35) NULL,
    CONSTRAINT [PK_KodyInformacjiDodatkowych] PRIMARY KEY CLUSTERED ([Id] ASC)
);

