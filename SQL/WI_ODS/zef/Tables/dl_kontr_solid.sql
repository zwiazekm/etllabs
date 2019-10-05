CREATE TABLE [zef].[dl_kontr_solid] (
    [id_dok_sprawy] VARCHAR (30) NOT NULL,
    [id_komor]      VARCHAR (20) NOT NULL,
    [id_kontr]      NUMERIC (10) NOT NULL,
    [termin_plat]   DATETIME     NULL,
    [replika]       VARCHAR (1)  NULL,
    CONSTRAINT [PK_DL_KONTR_SOLID] PRIMARY KEY CLUSTERED ([id_dok_sprawy] ASC, [id_komor] ASC, [id_kontr] ASC) ON [FG_ZEF]
);

