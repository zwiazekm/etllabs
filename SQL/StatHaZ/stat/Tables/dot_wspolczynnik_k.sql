CREATE TABLE [stat].[dot_wspolczynnik_k] (
    [kod_towarowy]               VARCHAR (8)     NULL,
    [RokMc]                      INT             NULL,
    [wspolczynnik_Kcnkg_przywoz] DECIMAL (38, 6) NULL,
    [wspolczynnik_Kcnkg_wywoz]   DECIMAL (38, 6) NULL,
    [wspolczynnik_Kcnj_przywoz]  DECIMAL (38, 6) NULL,
    [wspolczynnik_Kcnj_wywoz]    DECIMAL (38, 6) NULL
) ON [StatDane];

