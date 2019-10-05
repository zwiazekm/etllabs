CREATE TABLE [tr].[UzycieGwarancjiDlaOperacjiTranzytowej] (
    [SID]                         INT             NOT NULL,
    [SIDGwarancji]                INT             NULL,
    [GRN]                         VARCHAR (24)    NULL,
    [NrReferencyjnyZabezpeczenia] VARCHAR (35)    NULL,
    [GwarancjaNiewaznaWUE]        DECIMAL (1)     NULL,
    [KwotaGwarancji]              DECIMAL (17, 2) NULL,
    [Waluta]                      CHAR (3)        NULL,
    [IDUrzeduGwarancji]           VARCHAR (8)     NULL,
    [IDKrajuWystawieniaGwarancji] CHAR (2)        NULL,
    CONSTRAINT [PK_UzycieGwarancjiDlaOperacjiTranzytowej] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_UzycieGwarancjiDlaOperacjiTranzytowej_IdUrzeduGwarancji] FOREIGN KEY ([IDUrzeduGwarancji]) REFERENCES [tr].[Urzedy] ([IDUrzedu]),
    CONSTRAINT [FK_UzycieGwarancjiDlaOperacjiTranzytowej_SIDGwarancji_GwarancjaDlaOperacjiTranzytowej_SID] FOREIGN KEY ([SIDGwarancji]) REFERENCES [tr].[GwarancjaDlaOperacjiTranzytowej] ([SID])
);

