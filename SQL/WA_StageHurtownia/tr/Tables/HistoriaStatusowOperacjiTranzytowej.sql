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
    CONSTRAINT [PK_HistoriaStatusowOperacjiTranzytowej] PRIMARY KEY CLUSTERED ([SID] ASC)
);

