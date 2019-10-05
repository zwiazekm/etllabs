CREATE TABLE [fk].[PodmiotSolidarny] (
    [IdDokumentuSprawy] VARCHAR (30) NOT NULL,
    [IdPodmiotu]        INT          NOT NULL,
    [IdKomorki]         VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_PodmiotSolidarny] PRIMARY KEY CLUSTERED ([IdDokumentuSprawy] ASC, [IdPodmiotu] ASC, [IdKomorki] ASC)
);

