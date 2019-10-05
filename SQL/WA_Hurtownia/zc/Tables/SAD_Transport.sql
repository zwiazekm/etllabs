CREATE TABLE [zc].[SAD_Transport] (
    [IdDok]                 BIGINT       NOT NULL,
    [GranicznyWewnetrzny]   CHAR (1)     NOT NULL,
    [ZnakiP18]              VARCHAR (27) NULL,
    [ZnakiP21]              VARCHAR (27) NULL,
    [Kraj]                  CHAR (2)     NULL,
    [KrajPid]               INT          NULL,
    [RodzajTranspNaGran]    CHAR (1)     NULL,
    [RodzajTranspNaGranPid] INT          NULL,
    [RodzajTranspWewn]      CHAR (1)     NULL,
    [RodzajTranspWewnPid]   INT          NULL,
    CONSTRAINT [PK_SAD_Transport] PRIMARY KEY CLUSTERED ([IdDok] ASC, [GranicznyWewnetrzny] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_Transport_IdDok_SAD_Dokument_IdDok] FOREIGN KEY ([IdDok]) REFERENCES [zc].[SAD_Dokument] ([IdDok]),
    CONSTRAINT [FK_SAD_Transport_KrajPid] FOREIGN KEY ([KrajPid]) REFERENCES [pdr].[s007] ([s007_id]),
    CONSTRAINT [FK_SAD_Transport_RodzajTranspNaGranPid] FOREIGN KEY ([RodzajTranspNaGranPid]) REFERENCES [pdr].[s005] ([s005_id]),
    CONSTRAINT [FK_SAD_Transport_RodzajTranspWewnPid] FOREIGN KEY ([RodzajTranspWewnPid]) REFERENCES [pdr].[s005] ([s005_id])
);

