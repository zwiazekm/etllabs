CREATE TABLE [aies].[ref_sp_authorisation] (
    [id]              NUMERIC (19) NOT NULL,
    [slw_id]          NUMERIC (19) NULL,
    [no]              VARCHAR (40) NULL,
    [active]          TINYINT      NULL,
    [export_off_duty] TINYINT      NULL,
    [from_date]       DATETIME     NULL,
    [to_date]         DATETIME     NULL,
    [tin]             VARCHAR (17) NULL,
    CONSTRAINT [pk_ref_sp_authorisation] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

