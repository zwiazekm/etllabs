CREATE TABLE [zab].[StatusPodmiotu] (
    [IdStatusPodmiotu] INT           NOT NULL,
    [IdPodmiotu]       INT           NOT NULL,
    [NazwaSEED]        VARCHAR (255) NULL,
    [NumerAkcyzowy]    VARCHAR (13)  NULL,
    CONSTRAINT [PK_StatusPodmiotu] PRIMARY KEY CLUSTERED ([IdStatusPodmiotu] ASC) ON [FG_ZAB]
);

