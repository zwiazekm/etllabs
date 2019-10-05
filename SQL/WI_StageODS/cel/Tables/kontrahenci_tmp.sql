CREATE TABLE [cel].[kontrahenci_tmp] (
    [id_dok]      VARCHAR (30)  NOT NULL,
    [typ]         VARCHAR (10)  NOT NULL,
    [PozId]       INT           NOT NULL,
    [rodz_kntr]   CHAR (2)      NULL,
    [nazwa]       VARCHAR (255) NULL,
    [kraj]        VARCHAR (40)  NULL,
    [kod]         VARCHAR (10)  NULL,
    [miejscowosc] VARCHAR (60)  NULL,
    [adres]       VARCHAR (80)  NULL,
    [nip]         VARCHAR (20)  NULL,
    [regon]       VARCHAR (20)  NULL,
    [pesel]       VARCHAR (20)  NULL,
    [nrdowos]     VARCHAR (30)  NULL,
    [BNazwa]      VARCHAR (80)  NULL,
    [BKonto]      VARCHAR (60)  NULL,
    CONSTRAINT [PK_kontrahenci_tmp] PRIMARY KEY CLUSTERED ([id_dok] ASC, [typ] ASC, [PozId] ASC)
);

