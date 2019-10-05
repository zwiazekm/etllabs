CREATE TABLE [aimp2].[DSK_UniewaznienieTowaru] (
    [IdUniewaznienia]     NUMERIC (19)    NOT NULL,
    [IdTowarDSK]          NUMERIC (19)    NULL,
    [MRN]                 NVARCHAR (18)   NULL,
    [NumerPozycji]        NUMERIC (5)     NULL,
    [StatusUniewaznienia] NCHAR (4)       NULL,
    [TrescUzasadnienia]   NVARCHAR (1024) NULL,
    CONSTRAINT [DSK_UniewaznienieTowaru_PK] PRIMARY KEY CLUSTERED ([IdUniewaznienia] ASC) ON [FG_AIMP2],
    CONSTRAINT [DSK_UniewaznienieTowaru$FK_DSK_Towar] FOREIGN KEY ([IdTowarDSK]) REFERENCES [aimp2].[DSK_Towar] ([IdPozycji])
);

