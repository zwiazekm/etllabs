CREATE TABLE [zc].[ZWU_Trasa] (
    [Id]       DECIMAL (19) NOT NULL,
    [Kraj]     CHAR (2)     NULL,
    [KrajPid]  INT          NULL,
    [IdDokZWU] DECIMAL (19) NOT NULL,
    CONSTRAINT [PK_ZWU_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

