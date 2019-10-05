CREATE TABLE [aimp2].[PWD_Procedura] (
    [IdProcedury]                 NUMERIC (19) NOT NULL,
    [IdDok]                       NUMERIC (19) NULL,
    [KodProceduryWnioskowanej]    NVARCHAR (2) NULL,
    [KodProceduryWnioskowanejPid] INT          NULL,
    [KodProceduryPoprzedniej]     NVARCHAR (2) NULL,
    [KodProceduryPoprzedniejPid]  INT          NULL,
    [KodProcedurySzczeg]          NVARCHAR (3) NOT NULL,
    [KodProcedurySzczegPid]       INT          NULL,
    CONSTRAINT [PWD_Procedura_PK] PRIMARY KEY CLUSTERED ([IdProcedury] ASC, [KodProcedurySzczeg] ASC)
);

