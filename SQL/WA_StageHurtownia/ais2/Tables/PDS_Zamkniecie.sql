CREATE TABLE [ais2].[PDS_Zamkniecie] (
    [Id]         NUMERIC (19)  NOT NULL,
    [NumerZnaki] NVARCHAR (20) NULL,
    [IdDokPDS]   NUMERIC (19)  NULL,
    CONSTRAINT [PDS_Zamkniecie$PK_PDS_Zamkniecie] PRIMARY KEY CLUSTERED ([Id] ASC)
);

