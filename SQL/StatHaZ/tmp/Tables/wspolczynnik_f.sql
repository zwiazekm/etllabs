CREATE TABLE [tmp].[wspolczynnik_f] (
    [wf_RokMc]                  INT  NULL,
    [wf_wspolczynnik_f_przywoz] REAL NULL,
    [wf_wspolczynnik_f_wywoz]   REAL NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_wspolczynnik_f_miesiac_rok]
    ON [tmp].[wspolczynnik_f]([wf_RokMc] ASC);

