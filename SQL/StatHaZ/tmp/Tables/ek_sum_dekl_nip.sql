CREATE TABLE [tmp].[ek_sum_dekl_nip] (
    [ek_nip]     VARCHAR (10)    NULL,
    [ek_Rok]     SMALLINT        NULL,
    [ek_wartosc] DECIMAL (19, 3) NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_ek_sum_dekl_nip]
    ON [tmp].[ek_sum_dekl_nip]([ek_nip] ASC)
    ON [StatIndeksy];

