CREATE TABLE [zc].[DWA_Trasa] (
    [Id]       DECIMAL (19) NOT NULL,
    [Kraj]     CHAR (2)     NULL,
    [KrajPid]  INT          NULL,
    [IdDokDWA] DECIMAL (19) NULL,
    CONSTRAINT [PK_DWA_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

