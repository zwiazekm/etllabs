CREATE TABLE [stat].[dot_struktura_ponizej_asymilacji] (
    [typ]                 CHAR (1)       NULL,
    [RokMc]               INT            NULL,
    [kod_towarowy]        VARCHAR (8)    NULL,
    [kraj_przezn_wysylki] CHAR (2)       NULL,
    [kraj_pochodzenia]    CHAR (2)       NULL,
    [rodzaj_transakcji]   VARCHAR (2)    NULL,
    [udzial_w_obrotach]   DECIMAL (5, 4) NULL
);


GO
CREATE STATISTICS [kraj_pochodzenia]
    ON [stat].[dot_struktura_ponizej_asymilacji]([kraj_pochodzenia]);


GO
CREATE STATISTICS [kraj_przezn_wysylki]
    ON [stat].[dot_struktura_ponizej_asymilacji]([kraj_przezn_wysylki]);


GO
CREATE STATISTICS [rodzaj_transakcji]
    ON [stat].[dot_struktura_ponizej_asymilacji]([rodzaj_transakcji]);


GO
CREATE STATISTICS [udzial_w_obrotach]
    ON [stat].[dot_struktura_ponizej_asymilacji]([udzial_w_obrotach]);

