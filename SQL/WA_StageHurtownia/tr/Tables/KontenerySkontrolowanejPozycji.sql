CREATE TABLE [tr].[KontenerySkontrolowanejPozycji] (
    [SID]                      INT          NOT NULL,
    [NrKontenera]              VARCHAR (17) NULL,
    [KodPoziomuKontroli]       CHAR (1)     NULL,
    [SIDSkontrolowanejPozycji] INT          NULL,
    CONSTRAINT [PK_KontenerySkontrolowanejPozycji] PRIMARY KEY CLUSTERED ([SID] ASC)
);

