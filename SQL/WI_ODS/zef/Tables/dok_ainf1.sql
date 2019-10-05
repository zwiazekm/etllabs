CREATE TABLE [zef].[dok_ainf1] (
    [id_dok]        VARCHAR (30)    NOT NULL,
    [zalacznik]     CHAR (1)        NOT NULL,
    [nr_zal]        INT             NOT NULL,
    [seed_id_komor] VARCHAR (20)    NULL,
    [seed_id_kontr] NUMERIC (10)    NULL,
    [p_21]          NUMERIC (20, 3) DEFAULT ((0)) NULL,
    [p_22]          NUMERIC (20, 3) DEFAULT ((0)) NULL,
    [p_23]          NUMERIC (20, 3) DEFAULT ((0)) NULL,
    [p_24]          NUMERIC (20, 3) DEFAULT ((0)) NULL,
    [p_25]          NUMERIC (20, 3) DEFAULT ((0)) NULL,
    [p_26]          NUMERIC (20, 3) DEFAULT ((0)) NULL,
    [p_27]          NUMERIC (20, 3) DEFAULT ((0)) NULL,
    [p_28]          NUMERIC (20, 3) DEFAULT ((0)) NULL,
    [p_29]          NUMERIC (20, 3) DEFAULT ((0)) NULL,
    [p_30]          NUMERIC (20, 3) DEFAULT ((0)) NULL,
    [p_31]          NUMERIC (20, 3) DEFAULT ((0)) NULL,
    [numer]         VARCHAR (10)    NULL,
    CONSTRAINT [PK_DOK_AINF1] PRIMARY KEY CLUSTERED ([id_dok] ASC, [zalacznik] ASC, [nr_zal] ASC) ON [FG_ZEF]
);

