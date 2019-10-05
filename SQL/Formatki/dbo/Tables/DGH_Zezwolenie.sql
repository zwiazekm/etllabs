CREATE TABLE [dbo].[DGH_Zezwolenie] (
    [ID]                       INT           NOT NULL,
    [DZ1_01_LP]                BIGINT        NOT NULL,
    [DZ1_02_NazwaPodmiotu]     VARCHAR (100) NULL,
    [DZ1_03_NIP]               VARCHAR (10)  NULL,
    [DZ1_04_REGON]             VARCHAR (14)  NULL,
    [DZ1_05_RodzajGry]         VARCHAR (50)  NULL,
    [DZ1_06_KodPocztowy]       VARCHAR (6)   NULL,
    [DZ1_07_Miasto]            VARCHAR (50)  NULL,
    [DZ1_08_UlicaNr]           VARCHAR (50)  NULL,
    [DZ1_09_DataWydZezwolenia] DATE          NULL,
    [DZ1_10_TerminRozp]        DATE          NULL,
    [DZ1_11_TerminZak]         DATE          NULL,
    CONSTRAINT [PK_DGH_Zezwolenie] PRIMARY KEY CLUSTERED ([ID] ASC, [DZ1_01_LP] ASC),
    CONSTRAINT [FK_DGH_Zezwolenie_DGH_Naglowek] FOREIGN KEY ([ID]) REFERENCES [dbo].[DGH_Naglowek] ([ID])
);

