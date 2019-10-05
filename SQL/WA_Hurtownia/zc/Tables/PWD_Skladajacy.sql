CREATE TABLE [zc].[PWD_Skladajacy] (
    [idSkladajacy]  INT          NOT NULL,
    [NazwiskoImie]  VARCHAR (35) NULL,
    [Identyfikator] VARCHAR (35) NULL,
    [Stanowisko]    VARCHAR (35) NULL,
    [Telefon]       VARCHAR (15) NULL,
    [QuasiId]       INT          NULL,
    CONSTRAINT [PK_PWD_Skladajacy] PRIMARY KEY CLUSTERED ([idSkladajacy] ASC) ON [FG_ZC]
);

