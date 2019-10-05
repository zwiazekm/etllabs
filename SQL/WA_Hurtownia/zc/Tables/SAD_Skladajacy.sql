CREATE TABLE [zc].[SAD_Skladajacy] (
    [IdSkladajacy] INT          NOT NULL,
    [ImieNazwisko] VARCHAR (35) NULL,
    [Stanowisko]   VARCHAR (35) NULL,
    [Telefon]      VARCHAR (15) NULL,
    CONSTRAINT [PK_SAD_Skladajacy] PRIMARY KEY CLUSTERED ([IdSkladajacy] ASC) ON [FG_ZC]
);

