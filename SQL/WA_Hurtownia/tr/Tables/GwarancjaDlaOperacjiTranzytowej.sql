CREATE TABLE [tr].[GwarancjaDlaOperacjiTranzytowej] (
    [SID]                    INT         NOT NULL,
    [IDTypuGwarancji]        CHAR (2)    NOT NULL,
    [NumerWersji]            DECIMAL (3) NULL,
    [SIDOperacjiTranzytowej] INT         NULL,
    CONSTRAINT [PK_GwarancjaDlaOperacjiTranzytowej] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR],
    CONSTRAINT [FK_GwarancjaDlaOperacjiTranzytowej_IDTypuGwarancji_TypyGwarancji_IDTypuGwarancji] FOREIGN KEY ([IDTypuGwarancji]) REFERENCES [tr].[TypyGwarancji] ([Id]),
    CONSTRAINT [FK_GwarancjaDlaOperacjiTranzytowej_SIDNumerWersji_WersjaOperacjiTranzytowej_SIDOperacjiTranzytowejNumerWersjiOperacjiTranzytowej] FOREIGN KEY ([SIDOperacjiTranzytowej], [NumerWersji]) REFERENCES [tr].[WersjaOperacjiTranzytowej] ([SIDOperacjiTranzytowej], [NumerWersji])
);

