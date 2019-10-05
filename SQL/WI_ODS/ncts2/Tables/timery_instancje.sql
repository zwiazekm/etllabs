CREATE TABLE [ncts2].[timery_instancje] (
    [id]                     BIGINT        NOT NULL,
    [timer_typ_id]           BIGINT        NULL,
    [operacja_tranzytowa_id] BIGINT        NULL,
    [komunikat_id]           BIGINT        NULL,
    [start_data]             DATETIME      NULL,
    [koniec_data]            DATETIME2 (7) NULL,
    [zatrzymanie_data]       DATETIME      NULL,
    [status]                 NVARCHAR (1)  NULL,
    [start_wykonanie]        DATETIME      NULL,
    [koniec_wykonanie]       DATETIME      NULL,
    [rewizja]                INT           NULL,
    CONSTRAINT [timery_instancje_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2],
    CONSTRAINT [timery_instancje_timer_typ_id_id_fk] FOREIGN KEY ([timer_typ_id]) REFERENCES [ncts2].[timery_typy] ([id])
);

