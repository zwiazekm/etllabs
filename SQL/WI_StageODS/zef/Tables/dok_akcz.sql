CREATE TABLE [zef].[dok_akcz] (
    [id_dok]          VARCHAR (30)    NOT NULL,
    [zalacznik]       CHAR (1)        NOT NULL,
    [p_7]             NUMERIC (20, 2) NULL,
    [p_8]             NUMERIC (20, 2) NULL,
    [p_9]             NUMERIC (20, 2) NULL,
    [p_10]            NUMERIC (20, 2) NULL,
    [p_11]            NUMERIC (20, 2) NULL,
    [p_12]            NUMERIC (20, 2) NULL,
    [p_13]            NUMERIC (20, 2) NULL,
    [p_9_tyt_plat]    VARCHAR (9)     NULL,
    [p_9_klasyf_budz] VARCHAR (9)     NULL,
    CONSTRAINT [PK_DOK_AKCZ] PRIMARY KEY CLUSTERED ([id_dok] ASC, [zalacznik] ASC)
);

