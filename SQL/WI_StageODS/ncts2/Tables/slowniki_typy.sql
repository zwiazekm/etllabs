CREATE TABLE [ncts2].[slowniki_typy] (
    [id]       BIGINT         NOT NULL,
    [nazwa]    NVARCHAR (100) NULL,
    [id_ddnta] BIGINT         NULL,
    [id_pdr]   NVARCHAR (50)  NULL,
    CONSTRAINT [slowniki_typy_pk] PRIMARY KEY CLUSTERED ([id] ASC)
);

