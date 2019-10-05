CREATE TABLE [cel].[v2_skladajacy] (
    [idSkladajacy]  INT          NOT NULL,
    [NazwiskoImie]  VARCHAR (35) NULL,
    [Identyfikator] VARCHAR (35) NULL,
    [Stanowisko]    VARCHAR (35) NULL,
    [Telefon]       VARCHAR (15) NULL,
    [QuasiId]       INT          NULL,
    CONSTRAINT [PK_V2_SKLADAJACY] PRIMARY KEY CLUSTERED ([idSkladajacy] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);


GO
CREATE NONCLUSTERED INDEX [IX_v2_skladajacy]
    ON [cel].[v2_skladajacy]([QuasiId] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];


GO
CREATE NONCLUSTERED INDEX [k_kntr_nazwa]
    ON [cel].[v2_skladajacy]([NazwiskoImie] ASC) WITH (FILLFACTOR = 90)
    ON [FG_CEL];

