CREATE TABLE [stat].[dgt_raport_zmian] (
    [tabela]      VARCHAR (20) NOT NULL,
    [kolumna]     VARCHAR (30) NOT NULL,
    [przed]       VARCHAR (30) NULL,
    [po]          VARCHAR (30) NULL,
    [ilosc_zmian] INT          NULL
) ON [StatDane];


GO
CREATE STATISTICS [ilosc_zmian]
    ON [stat].[dgt_raport_zmian]([ilosc_zmian]);


GO
CREATE STATISTICS [kolumna]
    ON [stat].[dgt_raport_zmian]([kolumna]);


GO
CREATE STATISTICS [po]
    ON [stat].[dgt_raport_zmian]([po]);


GO
CREATE STATISTICS [przed]
    ON [stat].[dgt_raport_zmian]([przed]);


GO
CREATE STATISTICS [tabela]
    ON [stat].[dgt_raport_zmian]([tabela]);

