CREATE TABLE [zef].[dl_kontr] (
    [id_komor]     VARCHAR (20)  NOT NULL,
    [id_kontr]     NUMERIC (10)  NOT NULL,
    [nazwa_pelna]  VARCHAR (255) NULL,
    [nazwa_krotka] CHAR (40)     NULL,
    [kraj]         VARCHAR (40)  NULL,
    [miejsc]       VARCHAR (60)  NULL,
    [kpoczt]       CHAR (6)      NULL,
    [ulica]        VARCHAR (40)  NULL,
    [nr_domu]      CHAR (6)      NULL,
    [nr_lokalu]    CHAR (4)      NULL,
    [nip]          VARCHAR (20)  NULL,
    [regon]        VARCHAR (20)  NULL,
    [pesel]        VARCHAR (20)  NULL,
    [status_kontr] CHAR (1)      NULL,
    [nr_ubd_old]   NUMERIC (10)  NULL,
    [replika]      VARCHAR (1)   NULL,
    CONSTRAINT [pk_dl_kntr] PRIMARY KEY CLUSTERED ([id_komor] ASC, [id_kontr] ASC) ON [FG_ZEF]
);

