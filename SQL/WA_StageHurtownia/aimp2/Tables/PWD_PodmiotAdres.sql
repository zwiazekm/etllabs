CREATE TABLE [aimp2].[PWD_PodmiotAdres] (
    [IdAdresu]    NUMERIC (19)  NOT NULL,
    [Miasto]      NVARCHAR (35) NULL,
    [Kraj]        NVARCHAR (2)  NULL,
    [KrajPid]     INT           NULL,
    [UlicaNumer]  NVARCHAR (70) NULL,
    [KodPocztowy] NVARCHAR (9)  NULL,
    CONSTRAINT [PWD_PodmiotAdres_PK] PRIMARY KEY CLUSTERED ([IdAdresu] ASC)
);

