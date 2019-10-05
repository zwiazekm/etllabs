CREATE TABLE [stat].[dkt_plik_gus] (
    [id]     BIGINT         NOT NULL,
    [nazwa]  VARCHAR (1024) NULL,
    [wersja] VARCHAR (10)   NULL,
    [kto]    VARCHAR (30)   CONSTRAINT [DF__dkt_plik_gu__kto__511C966A] DEFAULT (suser_sname()) NULL,
    [kiedy]  DATETIME       CONSTRAINT [DF__dkt_plik___kiedy__5210BAA3] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_dkt_plik_gus] PRIMARY KEY CLUSTERED ([id] ASC) ON [StatIndeksy]
);

