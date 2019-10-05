CREATE TABLE [zc].[MEX_Przewoznik] (
    [Id]          DECIMAL (19)  NOT NULL,
    [TIN]         VARCHAR (17)  NULL,
    [Nazwa]       NVARCHAR (35) NULL,
    [UlicaNumer]  NVARCHAR (35) NULL,
    [KodPocztowy] VARCHAR (9)   NULL,
    [Miejscowosc] NVARCHAR (35) NULL,
    [Kraj]        CHAR (2)      NULL,
    [KrajPid]     INT           NULL,
    [IdDokMEX]    DECIMAL (19)  NULL,
    CONSTRAINT [PK_MEX_Przewoznik] PRIMARY KEY CLUSTERED ([Id] ASC)
);

