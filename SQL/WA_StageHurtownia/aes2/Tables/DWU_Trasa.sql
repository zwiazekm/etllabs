CREATE TABLE [aes2].[DWU_Trasa] (
    [Id]       NUMERIC (19) NOT NULL,
    [Kraj]     NVARCHAR (2) NULL,
    [KrajPid]  INT          NULL,
    [IdDokDWU] NUMERIC (19) NULL,
    CONSTRAINT [DWU_Trasa$PK_DWU_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

