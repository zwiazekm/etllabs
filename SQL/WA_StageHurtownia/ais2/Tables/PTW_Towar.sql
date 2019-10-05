CREATE TABLE [ais2].[PTW_Towar] (
    [Id]                   NUMERIC (19)  NOT NULL,
    [NrPozTow]             INT           NULL,
    [DokPrzewozowyKod]     VARCHAR (4)   NULL,
    [DokPrzewozowyNr]      NVARCHAR (35) NULL,
    [IdDokPTW]             NUMERIC (19)  NULL,
    [ZnacznikWprowadzenia] INT           NULL,
    CONSTRAINT [PTW_Towar$PK_PTW_Towar] PRIMARY KEY CLUSTERED ([Id] ASC)
);

