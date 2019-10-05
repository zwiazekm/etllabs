CREATE TABLE [tr].[InformacjeoOpakowaniachTowarow] (
    [SID]                                    INT         NOT NULL,
    [IDTypuOpakowania]                       CHAR (2)    NOT NULL,
    [LiczbaOpakowan]                         DECIMAL (5) NULL,
    [LiczbaSztuk]                            DECIMAL (5) NULL,
    [SIDPozycjiTowarowejOperacjiTranzytowej] INT         NULL,
    CONSTRAINT [PK_InformacjeoOpakowaniachTowarow] PRIMARY KEY CLUSTERED ([SID] ASC) ON [FG_TR]
);

