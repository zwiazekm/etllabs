CREATE TABLE [stat].[dot_obroty_roczne] (
    [nip]                  VARCHAR (10) NOT NULL,
    [rok]                  INT          NOT NULL,
    [sr_mies_stat_przywoz] DECIMAL (15) NULL,
    [sr_mies_stat_wywoz]   DECIMAL (15) NULL,
    [roczny_stat_przywoz]  DECIMAL (15) NULL,
    [roczny_stat_wywoz]    DECIMAL (15) NULL,
    CONSTRAINT [IX_dot_obroty_roczne] UNIQUE CLUSTERED ([nip] ASC, [rok] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_dot_obroty_roczne]
    ON [stat].[dot_obroty_roczne]([rok] ASC, [nip] ASC)
    ON [StatIndeksy];

