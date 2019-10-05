CREATE TABLE [ais2].[PDS_Trasa] (
    [Id]       NUMERIC (19) NOT NULL,
    [Kraj]     VARCHAR (2)  NULL,
    [KrajPid]  INT          NULL,
    [IdDokPDS] NUMERIC (19) NULL,
    CONSTRAINT [PDS_Trasa$PK_PDS_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

