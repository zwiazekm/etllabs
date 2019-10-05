CREATE TABLE [aimp2].[ICS_ZCP_OSOZ_ZEFIR_OQ] (
    [id]               NUMERIC (19)  NOT NULL,
    [zcp_id]           NUMERIC (19)  NOT NULL,
    [operation]        NVARCHAR (60) NOT NULL,
    [procedure_type]   NVARCHAR (30) NOT NULL,
    [status]           NVARCHAR (30) NOT NULL,
    [zcp_item_id]      NUMERIC (19)  NOT NULL,
    [zcp_wdz_item_id]  NUMERIC (19)  NULL,
    [zcp_podz_item_id] NUMERIC (19)  NULL,
    [version]          INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_OSOZ_ZEFIR_OPERATIONS_QUEUE$ICS_ZCP_OS_15506255361] PRIMARY KEY CLUSTERED ([id] ASC)
);

