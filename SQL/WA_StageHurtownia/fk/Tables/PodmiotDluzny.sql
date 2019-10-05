CREATE TABLE [fk].[PodmiotDluzny] (
    [IdPodmiotu]  INT          NOT NULL,
    [IdKomorki]   VARCHAR (20) NOT NULL,
    [KodPocztowy] CHAR (6)     NULL,
    [Kraj]        VARCHAR (40) NULL,
    [Miejscowosc] VARCHAR (60) NULL,
    [NazwaKrotka] VARCHAR (40) NULL,
    [NIP]         VARCHAR (20) NULL,
    [NumerDomu]   CHAR (6)     NULL,
    [NumerLokalu] CHAR (4)     NULL,
    [PESEL]       VARCHAR (20) NULL,
    [REGON]       VARCHAR (20) NULL,
    [Ulica]       VARCHAR (40) NULL,
    CONSTRAINT [PK_PodmiotDluzny] PRIMARY KEY CLUSTERED ([IdPodmiotu] ASC, [IdKomorki] ASC)
);

