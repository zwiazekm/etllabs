CREATE TABLE [stat].[dgt_kopia_params] (
    [section]     VARCHAR (20)  NOT NULL,
    [keyword]     VARCHAR (20)  NOT NULL,
    [value]       VARCHAR (255) NULL,
    [description] VARCHAR (80)  NULL,
    [id_jedn]     VARCHAR (20)  NULL,
    [parm_key]    VARCHAR (1)   NULL,
    [generacjaId] INT           NULL
) ON [StatDane];

