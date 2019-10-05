CREATE TABLE [ncts2].[ref_reprezentanci] (
    [id]         BIGINT        NOT NULL,
    [imie]       NVARCHAR (60) NULL,
    [nazwisko]   NVARCHAR (90) NULL,
    [data_od]    DATETIME      NULL,
    [data_do]    DATETIME      NULL,
    [idsisc_rof] NVARCHAR (17) NULL,
    [status]     NVARCHAR (1)  NULL,
    [pesel]      NVARCHAR (11) NULL,
    CONSTRAINT [ref_reprezentanci_pk] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_NCTS2]
);

