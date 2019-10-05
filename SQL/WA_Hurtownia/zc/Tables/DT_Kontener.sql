CREATE TABLE [zc].[DT_Kontener] (
    [IdDok]       VARCHAR (30) NOT NULL,
    [IdPozycji]   TINYINT      NOT NULL,
    [NrKontenera] VARCHAR (40) NULL,
    CONSTRAINT [PK_DT_Kontener] PRIMARY KEY CLUSTERED ([IdDok] ASC, [IdPozycji] ASC) ON [FG_ZC],
    CONSTRAINT [FK_DT_Kontener_IdDokIdPozycji_DT_SrodekPrzewozowy_IdDokIdPozycji] FOREIGN KEY ([IdDok], [IdPozycji]) REFERENCES [zc].[DT_SrodekPrzewozowy] ([IdDok], [IdPozycji])
);

