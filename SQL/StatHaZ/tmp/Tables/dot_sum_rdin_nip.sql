CREATE TABLE [tmp].[dot_sum_rdin_nip] (
    [nip]                  VARCHAR (10) NOT NULL,
    [rok]                  SMALLINT     NOT NULL,
    [sr_mies_stat_przywoz] DECIMAL (15) NULL,
    [sr_mies_stat_wywoz]   DECIMAL (15) NULL,
    [roczny_stat_przywoz]  DECIMAL (15) NULL,
    [roczny_stat_wywoz]    DECIMAL (15) NULL,
    CONSTRAINT [PK_dot_sum_rdin_nip] PRIMARY KEY CLUSTERED ([nip] ASC, [rok] ASC)
);

