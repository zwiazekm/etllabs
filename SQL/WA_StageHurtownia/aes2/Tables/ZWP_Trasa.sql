CREATE TABLE [aes2].[ZWP_Trasa] (
    [Id]       NUMERIC (19) NOT NULL,
    [Kraj]     NVARCHAR (2) NULL,
    [KrajPid]  NVARCHAR (2) NULL,
    [IdDokZWP] NUMERIC (19) NULL,
    CONSTRAINT [ZWP_Trasa$PK_ZWP_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

