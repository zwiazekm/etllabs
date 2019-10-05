CREATE TABLE [zef].[dok_jednostka] (
    [id_dok]        VARCHAR (30) NOT NULL,
    [id_jedn]       VARCHAR (30) NULL,
    [id_jedn_nadrz] VARCHAR (30) NULL,
    [replika2]      CHAR (1)     NULL,
    CONSTRAINT [pk_dok_jedn] PRIMARY KEY CLUSTERED ([id_dok] ASC)
);

