CREATE TABLE [intr2].[caac_bledne_dane] (
    [id]                  VARCHAR (30)   NOT NULL,
    [typ]                 NVARCHAR (3)   NOT NULL,
    [kierunek]            NCHAR (1)      NOT NULL,
    [adresat]             NVARCHAR (6)   NULL,
    [pozid]               INT            NOT NULL,
    [autor]               NVARCHAR (4)   NULL,
    [id_dok]              NVARCHAR (40)  NOT NULL,
    [nrpoz]               INT            NOT NULL,
    [pole]                NVARCHAR (25)  NOT NULL,
    [wartosc_bledna]      NVARCHAR (20)  NULL,
    [wartosc_poprawna]    NVARCHAR (20)  NULL,
    [wartosc_po_korekcie] NVARCHAR (20)  NULL,
    [stan_korekty]        NCHAR (1)      NOT NULL,
    [komentarz]           NVARCHAR (255) NULL,
    [komentarz_ic]        NVARCHAR (320) NULL,
    [semafor]             NCHAR (1)      NULL,
    [nip]                 NVARCHAR (10)  NULL,
    CONSTRAINT [caac_bledne_dane$pk_caac_bledne_dane] PRIMARY KEY CLUSTERED ([id] ASC, [pozid] ASC) ON [FG_INTR2]
);

