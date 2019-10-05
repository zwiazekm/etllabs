CREATE TABLE [tr].[HistoriaStatusowOperacjiTranzytowej] (
    [SID]                       BIGINT        NOT NULL,
    [SIDOperacjiTranzytowej]    INT           NULL,
    [IDStatusu]                 CHAR (3)      NULL,
    [SIDOperacjiwUCTranzytowym] INT           NULL,
    [IDStatusuUCPrzeznaczenia]  CHAR (3)      NULL,
    [IDUzytkownika]             DECIMAL (8)   NOT NULL,
    [IDGrupy]                   DECIMAL (8)   NOT NULL,
    [PowodZmianyStatusu]        VARCHAR (100) NULL,
    [DataZmianyStatusu]         DATETIME      NOT NULL,
    [IDStatusuUCTranzytowy]     CHAR (3)      NULL,
    CONSTRAINT [PK_HistoriaStatusowOperacjiTranzytowej] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_HistoriaStatusowOperacjiTranzytowej_IDStatusu_TypyStatusowOperacjiTranzytowej_IDTypuStatusuOperacjiTranzytowej] FOREIGN KEY ([IDStatusu]) REFERENCES [tr].[TypyStatusowOperacjiTranzytowej] ([Id]),
    CONSTRAINT [FK_HistoriaStatusowOperacjiTranzytowej_IDStatusuUCPrzeznaczenia_TypyStatusowOperacjiTranzytowej_IDTypuStatusuOperacjiTranzytowej] FOREIGN KEY ([IDStatusuUCPrzeznaczenia]) REFERENCES [tr].[TypyStatusowOperacjiTranzytowej] ([Id]),
    CONSTRAINT [FK_HistoriaStatusowOperacjiTranzytowej_IDStatusuUCTranzytowy_TypyStatusowOperacjiTranzytowej_IDTypuStatusuOperacjiTranzytowej] FOREIGN KEY ([IDStatusuUCTranzytowy]) REFERENCES [tr].[TypyStatusowOperacjiTranzytowej] ([Id]),
    CONSTRAINT [FK_HistoriaStatusowOperacjiTranzytowej_SIDOperacjiTranzytowej_OperacjeTranzytowe_SID] FOREIGN KEY ([SIDOperacjiTranzytowej]) REFERENCES [tr].[OperacjeTranzytowe] ([SID]),
    CONSTRAINT [FK_HistoriaStatusowOperacjiTranzytowej_SIDOperacjiwUCTranzytowym_OperacjeTranzytoweUCTranzytowy_SID] FOREIGN KEY ([SIDOperacjiwUCTranzytowym]) REFERENCES [tr].[OperacjeTranzytowe] ([SID])
);


GO
ALTER TABLE [tr].[HistoriaStatusowOperacjiTranzytowej] NOCHECK CONSTRAINT [FK_HistoriaStatusowOperacjiTranzytowej_IDStatusu_TypyStatusowOperacjiTranzytowej_IDTypuStatusuOperacjiTranzytowej];


GO
ALTER TABLE [tr].[HistoriaStatusowOperacjiTranzytowej] NOCHECK CONSTRAINT [FK_HistoriaStatusowOperacjiTranzytowej_IDStatusuUCPrzeznaczenia_TypyStatusowOperacjiTranzytowej_IDTypuStatusuOperacjiTranzytowej];


GO
ALTER TABLE [tr].[HistoriaStatusowOperacjiTranzytowej] NOCHECK CONSTRAINT [FK_HistoriaStatusowOperacjiTranzytowej_IDStatusuUCTranzytowy_TypyStatusowOperacjiTranzytowej_IDTypuStatusuOperacjiTranzytowej];


GO
ALTER TABLE [tr].[HistoriaStatusowOperacjiTranzytowej] NOCHECK CONSTRAINT [FK_HistoriaStatusowOperacjiTranzytowej_SIDOperacjiTranzytowej_OperacjeTranzytowe_SID];


GO
ALTER TABLE [tr].[HistoriaStatusowOperacjiTranzytowej] NOCHECK CONSTRAINT [FK_HistoriaStatusowOperacjiTranzytowej_SIDOperacjiwUCTranzytowym_OperacjeTranzytoweUCTranzytowy_SID];

