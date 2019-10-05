CREATE TABLE [pdr].[c228_okres_zakonczenia] (
    [c228_okres_zakonczenia_id] INT          NOT NULL,
    [kod_towaru]                VARCHAR (10) NULL,
    [liczba_miesiecy]           INT          NOT NULL,
    [c228_id]                   INT          NULL,
    PRIMARY KEY CLUSTERED ([c228_okres_zakonczenia_id] ASC)
);

