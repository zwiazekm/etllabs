CREATE TABLE [MF\FPLC].[dyr_przej] (
    [decl_id]          NUMERIC (19)    NOT NULL,
    [MRN]              NVARCHAR (35)   NULL,
    [decl_type]        NVARCHAR (3)    NULL,
    [source]           NVARCHAR (1024) NULL,
    [control_method]   NVARCHAR (20)   NULL,
    [dir_control_type] NCHAR (1)       NULL,
    [code]             NVARCHAR (4)    NULL,
    [EUcodes]          NVARCHAR (5)    NULL,
    [war1]             NVARCHAR (1)    NULL,
    [war234]           NVARCHAR (3)    NULL,
    [war5]             NVARCHAR (1)    NULL,
    [cm]               NVARCHAR (10)   NULL,
    [opis]             NVARCHAR (255)  NULL,
    [stare_typy_kontr] NVARCHAR (255)  NULL,
    [status]           NVARCHAR (4)    NOT NULL,
    [control_type]     NVARCHAR (255)  NULL
);

