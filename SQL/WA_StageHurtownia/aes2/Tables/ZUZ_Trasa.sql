CREATE TABLE [aes2].[ZUZ_Trasa] (
    [Id]              NUMERIC (19) NOT NULL,
    [Kraj]            NVARCHAR (2) NULL,
    [KrajPid]         NVARCHAR (2) NULL,
    [IdDokZUZ]        NUMERIC (19) NULL,
    [KrajZUzupeln]    NVARCHAR (2) NULL,
    [KrajZUzupelnPid] NVARCHAR (2) NULL,
    CONSTRAINT [ZUZ_Trasa$PK_ZUZ_Trasa] PRIMARY KEY CLUSTERED ([Id] ASC)
);

