CREATE TABLE [zc].[DS_Skladajacy] (
    [idSkladajacy]  INT          NOT NULL,
    [NazwiskoImie]  VARCHAR (35) NULL,
    [Identyfikator] VARCHAR (35) NULL,
    [Stanowisko]    VARCHAR (35) NULL,
    [Telefon]       VARCHAR (15) NULL,
    [QuasiId]       INT          NULL,
    CONSTRAINT [PK_DS_Skladajacy] PRIMARY KEY CLUSTERED ([idSkladajacy] ASC)
);

