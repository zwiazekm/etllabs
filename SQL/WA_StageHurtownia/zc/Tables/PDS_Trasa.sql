CREATE TABLE [zc].[PDS_Trasa] (
    [Id]       DECIMAL (19) NOT NULL,
    [Kraj]     CHAR (2)     NULL,
    [KrajPid]  INT          NULL,
    [IdDokPDS] DECIMAL (19) NULL,
    CONSTRAINT [PK_PDS_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

