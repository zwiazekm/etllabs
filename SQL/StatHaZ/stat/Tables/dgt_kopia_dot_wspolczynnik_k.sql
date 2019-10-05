CREATE TABLE [stat].[dgt_kopia_dot_wspolczynnik_k] (
    [kod_towarowy]               VARCHAR (8)     NULL,
    [miesiac]                    INT             NULL,
    [wspolczynnik_Kcnkg_przywoz] DECIMAL (38, 6) NULL,
    [wspolczynnik_Kcnkg_wywoz]   DECIMAL (38, 6) NULL,
    [wspolczynnik_Kcnj_przywoz]  DECIMAL (38, 6) NULL,
    [wspolczynnik_Kcnj_wywoz]    DECIMAL (38, 6) NULL,
    [generacjaId]                INT             NULL
) ON [StatDane];

