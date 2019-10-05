CREATE TABLE [tr].[TypyStatusowOperacjiTranzytowej] (
    [Id]      CHAR (3)      NOT NULL,
    [NazwaPL] VARCHAR (120) NULL,
    [NazwaEN] VARCHAR (120) NULL,
    CONSTRAINT [PK_TypyStatusowOperacjiTranzytowej] PRIMARY KEY CLUSTERED ([Id] ASC)
);

