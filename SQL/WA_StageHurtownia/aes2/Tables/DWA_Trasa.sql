CREATE TABLE [aes2].[DWA_Trasa] (
    [Id]       NUMERIC (19) NOT NULL,
    [Kraj]     NVARCHAR (2) NULL,
    [KrajPid]  INT          NULL,
    [IdDokDWA] NUMERIC (19) NULL,
    CONSTRAINT [DWA_Trasa$PK_DWA_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

