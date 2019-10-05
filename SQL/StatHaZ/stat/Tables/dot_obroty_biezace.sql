CREATE TABLE [stat].[dot_obroty_biezace] (
    [id_pod]           VARCHAR (35) NOT NULL,
    [RokMc]            INT          NOT NULL,
    [stat_przywoz]     DECIMAL (15) NULL,
    [stat_wywoz]       DECIMAL (15) NULL,
    [trans_nu_przywoz] DECIMAL (15) NULL,
    [trans_nu_wywoz]   DECIMAL (15) NULL,
    CONSTRAINT [PK_dot_obroty_biezace] PRIMARY KEY CLUSTERED ([id_pod] ASC, [RokMc] ASC) ON [StatDane]
);


GO
CREATE STATISTICS [stat_przywoz]
    ON [stat].[dot_obroty_biezace]([stat_przywoz]);


GO
CREATE STATISTICS [stat_wywoz]
    ON [stat].[dot_obroty_biezace]([stat_wywoz]);


GO
CREATE STATISTICS [trans_nu_przywoz]
    ON [stat].[dot_obroty_biezace]([trans_nu_przywoz]);


GO
CREATE STATISTICS [trans_nu_wywoz]
    ON [stat].[dot_obroty_biezace]([trans_nu_wywoz]);

