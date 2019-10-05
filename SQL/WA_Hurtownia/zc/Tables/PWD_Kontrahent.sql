CREATE TABLE [zc].[PWD_Kontrahent] (
    [idKontrahenta] INT          NOT NULL,
    [Nazwa]         VARCHAR (35) NULL,
    [UlicaNumer]    VARCHAR (35) NULL,
    [KodPocztowy]   VARCHAR (9)  NULL,
    [Miejscowosc]   VARCHAR (35) NULL,
    [Kraj]          CHAR (2)     NULL,
    [KrajPid]       INT          NULL,
    [TIN]           VARCHAR (12) NULL,
    [REGON]         VARCHAR (14) NULL,
    [PESEL]         VARCHAR (11) NULL,
    [CRP]           VARCHAR (19) NULL,
    [QuasiId]       INT          NULL,
    CONSTRAINT [PK_PWD_Kontrahent] PRIMARY KEY CLUSTERED ([idKontrahenta] ASC) ON [FG_ZC],
    CONSTRAINT [FK_PWD_Kontrahent_KrajPid] FOREIGN KEY ([KrajPid]) REFERENCES [pdr].[s007] ([s007_id])
);

