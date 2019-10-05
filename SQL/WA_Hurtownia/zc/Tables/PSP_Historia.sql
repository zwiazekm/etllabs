CREATE TABLE [zc].[PSP_Historia] (
    [IdDok]          VARCHAR (30)  NOT NULL,
    [IdPozycji]      INT           NOT NULL,
    [DataZmiany]     DATETIME      NOT NULL,
    [IdJednostki]    VARCHAR (9)   NULL,
    [IdJednostkiPid] INT           NULL,
    [Operator]       VARCHAR (16)  NULL,
    [SymbolOperacji] VARCHAR (16)  NULL,
    [Adnotacja]      VARCHAR (255) NULL,
    [RodzAdnotacji]  VARCHAR (4)   NULL,
    CONSTRAINT [PK_PSP_Historia] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [DataZmiany] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DT_Dokument_IdJednostkiPid] FOREIGN KEY ([IdJednostkiPid]) REFERENCES [pdr].[c001] ([c001_id]),
    CONSTRAINT [FK_PSP_Historia_IdDok_PSP_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[PSP_Dokument] ([IdDok])
);

