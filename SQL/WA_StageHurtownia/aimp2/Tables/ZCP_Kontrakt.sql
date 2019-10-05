CREATE TABLE [aimp2].[ZCP_Kontrakt] (
    [IdKontraktu]    NUMERIC (19)  NOT NULL,
    [IdDok]          NUMERIC (19)  NULL,
    [DataKontraktu]  DATETIME2 (3) NULL,
    [NumerKontraktu] NVARCHAR (35) NULL,
    CONSTRAINT [ZCP_Kontrakt_PK] PRIMARY KEY CLUSTERED ([IdKontraktu] ASC)
);

