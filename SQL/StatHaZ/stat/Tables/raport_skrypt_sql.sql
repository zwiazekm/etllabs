CREATE TABLE [stat].[raport_skrypt_sql] (
    [id_jednostki]      VARCHAR (20)  NOT NULL,
    [typ_db]            VARCHAR (20)  NOT NULL,
    [nazwa_skryptu]     VARCHAR (60)  NOT NULL,
    [nr_skryptu]        INT           NOT NULL,
    [wlasciciel]        VARCHAR (80)  NULL,
    [data_uruchomienia] DATETIME      NOT NULL,
    [nr_formularza]     VARCHAR (40)  NOT NULL,
    [nr_zgloszenia]     VARCHAR (40)  NULL,
    [opis_zgloszenia]   VARCHAR (250) NULL,
    CONSTRAINT [PK_RAPORT_SKRYPT_SQL] PRIMARY KEY CLUSTERED ([id_jednostki] ASC, [nazwa_skryptu] ASC, [nr_skryptu] ASC, [data_uruchomienia] ASC) ON [StatIndeksy]
);

