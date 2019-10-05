CREATE TABLE [tr].[GwarancjaDlaOperacjiTranzytowej] (
    [SID]                    INT         NOT NULL,
    [IDTypuGwarancji]        CHAR (2)    NOT NULL,
    [NumerWersji]            DECIMAL (3) NULL,
    [SIDOperacjiTranzytowej] INT         NULL,
    CONSTRAINT [PK_GwarancjaDlaOperacjiTranzytowej] PRIMARY KEY CLUSTERED ([SID] ASC)
);

