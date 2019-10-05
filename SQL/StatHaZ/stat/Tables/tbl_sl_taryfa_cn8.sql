CREATE TABLE [stat].[tbl_sl_taryfa_cn8] (
    [kod_cn]   NVARCHAR (8)   NOT NULL,
    [opis_cn]  NVARCHAR (255) NULL,
    [nazwa_jm] NVARCHAR (12)  NULL,
    [sitc]     NVARCHAR (6)   NULL,
    [bec]      NVARCHAR (3)   NULL,
    [pkwiu]    NVARCHAR (8)   NULL,
    CONSTRAINT [PK_tbl_sl_taryfa_cn8_1] PRIMARY KEY CLUSTERED ([kod_cn] ASC)
);

