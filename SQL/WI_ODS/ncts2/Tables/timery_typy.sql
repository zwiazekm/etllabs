CREATE TABLE [ncts2].[timery_typy] (
    [id]           BIGINT         NOT NULL,
    [nazwa]        NVARCHAR (32)  NULL,
    [opis]         NVARCHAR (120) NULL,
    [czas_trwania] NVARCHAR (MAX) NULL,
    CONSTRAINT [timery_typy_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
) TEXTIMAGE_ON [FG_NCTS2];

