CREATE TABLE [stat].[dgt_kopia_dot_struktura_ponizej_asymilacji] (
    [typ]                 VARCHAR (1)    NOT NULL,
    [miesiac]             DECIMAL (2)    NOT NULL,
    [rok]                 DECIMAL (4)    NOT NULL,
    [kod_towarowy]        VARCHAR (8)    NOT NULL,
    [kraj_przezn_wysylki] VARCHAR (2)    NOT NULL,
    [kraj_pochodzenia]    VARCHAR (2)    NOT NULL,
    [rodzaj_transakcji]   VARCHAR (2)    NOT NULL,
    [udzial_w_obrotach]   DECIMAL (5, 4) NULL,
    [generacjaId]         INT            NOT NULL,
    CONSTRAINT [PK_dgt_kopia_dot_struktura_ponizej_asymilacji] PRIMARY KEY CLUSTERED ([typ] ASC, [miesiac] ASC, [rok] ASC, [kod_towarowy] ASC, [kraj_przezn_wysylki] ASC, [kraj_pochodzenia] ASC, [rodzaj_transakcji] ASC, [generacjaId] ASC) ON [StatIndeksy]
);


GO
CREATE STATISTICS [generacja]
    ON [stat].[dgt_kopia_dot_struktura_ponizej_asymilacji]([generacjaId]);


GO
CREATE STATISTICS [kod_towarowy]
    ON [stat].[dgt_kopia_dot_struktura_ponizej_asymilacji]([kod_towarowy]);


GO
CREATE STATISTICS [kraj_pochodzenia]
    ON [stat].[dgt_kopia_dot_struktura_ponizej_asymilacji]([kraj_pochodzenia]);


GO
CREATE STATISTICS [kraj_przezn_wysylki]
    ON [stat].[dgt_kopia_dot_struktura_ponizej_asymilacji]([kraj_przezn_wysylki]);


GO
CREATE STATISTICS [miesiac]
    ON [stat].[dgt_kopia_dot_struktura_ponizej_asymilacji]([miesiac]);


GO
CREATE STATISTICS [rodzaj_transakcji]
    ON [stat].[dgt_kopia_dot_struktura_ponizej_asymilacji]([rodzaj_transakcji]);


GO
CREATE STATISTICS [rok]
    ON [stat].[dgt_kopia_dot_struktura_ponizej_asymilacji]([rok]);


GO
CREATE STATISTICS [udzial_w_obrotach]
    ON [stat].[dgt_kopia_dot_struktura_ponizej_asymilacji]([udzial_w_obrotach]);

