CREATE TABLE [stat].[dkt_semafor] (
    [id_dok] VARCHAR (40) NOT NULL,
    [poz_id] NUMERIC (18) NOT NULL,
    [typ]    VARCHAR (1)  NOT NULL,
    [kto]    VARCHAR (30) CONSTRAINT [DF__dkt_semafor__kto__19975756] DEFAULT (suser_sname()) NULL,
    [kiedy]  DATETIME     CONSTRAINT [DF__dkt_semaf__kiedy__1A8B7B8F] DEFAULT (getdate()) NULL,
    [SPID]   NUMERIC (18) CONSTRAINT [DF__dkt_semafo__SPID__1B7F9FC8] DEFAULT (@@spid) NULL,
    CONSTRAINT [pk_dkt_semafor] PRIMARY KEY CLUSTERED ([id_dok] ASC, [poz_id] ASC, [typ] ASC) ON [StatDane]
);


GO
CREATE STATISTICS [kiedy]
    ON [stat].[dkt_semafor]([kiedy]);


GO
CREATE STATISTICS [kto]
    ON [stat].[dkt_semafor]([kto]);


GO
CREATE STATISTICS [SPID]
    ON [stat].[dkt_semafor]([SPID]);

