CREATE TABLE [stat].[dgt_kopia_dot_mapowanie_cn] (
    [stary_cn]    VARCHAR (8) NOT NULL,
    [nowy_cn]     VARCHAR (8) NOT NULL,
    [rok]         INT         NOT NULL,
    [wstawil]     CHAR (1)    NULL,
    [generacjaId] INT         NULL
) ON [StatDane];

