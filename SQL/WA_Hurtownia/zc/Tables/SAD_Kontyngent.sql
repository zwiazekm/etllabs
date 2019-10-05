CREATE TABLE [zc].[SAD_Kontyngent] (
    [IdDok]               BIGINT          NOT NULL,
    [IdPozycji]           SMALLINT        NOT NULL,
    [IdPozycjiKontyngent] SMALLINT        NOT NULL,
    [NrPorzadkowy]        VARCHAR (6)     NULL,
    [WnioskowanaIlosc]    DECIMAL (18, 3) NULL,
    [Jm]                  CHAR (1)        NULL,
    [JmPid]               INT             NULL,
    [TQSNr]               VARCHAR (6)     NULL,
    [TQSJm]               CHAR (1)        NULL,
    [TQSWnioskowanaIlosc] DECIMAL (18, 3) NULL,
    [TQSStatus]           CHAR (1)        NULL,
    [CzyKorekta]          BIT             NULL,
    [PrzyznanaIlosc]      DECIMAL (18, 3) NULL,
    [WykorzystanaIlosc]   DECIMAL (18, 3) NULL,
    [NrWniosku]           VARCHAR (35)    NULL,
    [NrDecyzji]           VARCHAR (35)    NULL,
    CONSTRAINT [PK_SAD_Kontyngent] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC, [IdPozycjiKontyngent] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SAD_Kontyngent_IdDokIdPozycji_SAD_Towar_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SAD_Towar] ([IdDok], [IdPozycji]),
    CONSTRAINT [FK_SAD_Kontyngent_JmPid] FOREIGN KEY ([JmPid]) REFERENCES [pdr].[s068] ([s068_id])
);

