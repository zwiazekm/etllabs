CREATE TABLE [zc].[PTW_Towar] (
    [Id]                   NUMERIC (19) NOT NULL,
    [NrPozTow]             INT          NULL,
    [ZnacznikWprowadzenia] INT          NULL,
    [DokPrzewozowyKod]     VARCHAR (4)  NULL,
    [DokPrzewozowyNr]      VARCHAR (35) NULL,
    [IdDokPTW]             NUMERIC (19) NULL,
    CONSTRAINT [PK_PTW_Towar] PRIMARY KEY CLUSTERED ([Id] ASC)
);

