CREATE TABLE [zc].[PWD_Transport] (
    [IdDok]               BIGINT       NOT NULL,
    [IdPozycji]           SMALLINT     NOT NULL,
    [RodzajTransportu]    CHAR (1)     NULL,
    [RodzajTransportuPid] INT          NULL,
    [ZnakiTransportu]     VARCHAR (27) NULL,
    [Kraj]                CHAR (2)     NULL,
    [KrajPid]             INT          NULL,
    CONSTRAINT [PK_PWD_Transport] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PWD_Transport_IdDok_PWD_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[PWD_Dokument] ([IdDok]),
    CONSTRAINT [FK_PWD_Transport_KrajPid] FOREIGN KEY ([KrajPid]) REFERENCES [pdr].[s007] ([s007_id]),
    CONSTRAINT [FK_PWD_Transport_RodzajTransportuPid] FOREIGN KEY ([RodzajTransportuPid]) REFERENCES [pdr].[s005] ([s005_id])
);

