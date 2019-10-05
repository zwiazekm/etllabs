CREATE TABLE [stat].[dot_struktura_priorytet_5_roczna] (
    [nr_poz]            VARCHAR (35)   NULL,
    [nip]               VARCHAR (10)   NULL,
    [regon]             VARCHAR (14)   NULL,
    [typ]               VARCHAR (1)    NULL,
    [rok]               INT            NULL,
    [kod_towarowy]      VARCHAR (8)    NULL,
    [kraj_przezn_wysyl] VARCHAR (2)    NULL,
    [kraj_pochodzenia]  VARCHAR (2)    NULL,
    [rodzaj_transakcji] VARCHAR (2)    NULL,
    [udzial_w_obrotach] DECIMAL (7, 6) NULL
);


GO
CREATE CLUSTERED INDEX [idx_dot_struktura_priorytet_5_roczna]
    ON [stat].[dot_struktura_priorytet_5_roczna]([kod_towarowy] ASC, [rok] ASC);

