CREATE TABLE [aes2].[ZWU_Trasa] (
    [Id]       NUMERIC (19) NOT NULL,
    [Kraj]     NVARCHAR (2) NULL,
    [KrajPid]  NVARCHAR (2) NULL,
    [IdDokZWU] NUMERIC (19) NULL,
    CONSTRAINT [ZWU_Trasa$PK_ZWU_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

