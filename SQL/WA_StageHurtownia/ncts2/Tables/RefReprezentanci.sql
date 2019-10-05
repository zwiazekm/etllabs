CREATE TABLE [ncts2].[RefReprezentanci] (
    [Id]        BIGINT        NOT NULL,
    [Imie]      NVARCHAR (60) NULL,
    [Nazwisko]  NVARCHAR (90) NULL,
    [DataOd]    DATETIME      NULL,
    [DataDo]    DATETIME      NULL,
    [IDSISCRof] NVARCHAR (17) NULL,
    [Status]    NVARCHAR (1)  NULL,
    [PESEL]     NVARCHAR (11) NULL,
    CONSTRAINT [RefReprezentanci_pk] PRIMARY KEY CLUSTERED ([Id] ASC)
);

