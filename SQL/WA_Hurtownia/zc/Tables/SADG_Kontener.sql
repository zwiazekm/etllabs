CREATE TABLE [zc].[SADG_Kontener] (
    [IdDok]       VARCHAR (30) NOT NULL,
    [IdPozycji]   TINYINT      NOT NULL,
    [NrKontenera] VARCHAR (40) NULL,
    CONSTRAINT [PK_SADG_Kontener] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_SADG_Kontener_IdDokIdPozycji_SADG_SrodekPrzewozowy_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[SADG_SrodekPrzewozowy] ([IdDok], [IdPozycji])
);

