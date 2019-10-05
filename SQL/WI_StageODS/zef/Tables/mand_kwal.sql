CREATE TABLE [zef].[mand_kwal] (
    [id_dok]  VARCHAR (30) NOT NULL,
    [nr_poz]  SMALLINT     NOT NULL,
    [id_kwal] CHAR (6)     NULL,
    [id_jedn] VARCHAR (20) NULL,
    CONSTRAINT [PK_mand_kwal] PRIMARY KEY CLUSTERED ([id_dok] ASC, [nr_poz] ASC)
);

