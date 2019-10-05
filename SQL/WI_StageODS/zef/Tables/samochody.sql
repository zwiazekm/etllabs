CREATE TABLE [zef].[samochody] (
    [id_dok]             VARCHAR (30)  NOT NULL,
    [nr_poz]             INT           NOT NULL,
    [marka]              VARCHAR (50)  NULL,
    [typ]                VARCHAR (30)  NULL,
    [model]              VARCHAR (30)  NULL,
    [nr_identyfikacyjny] VARCHAR (20)  NULL,
    [nr_silnika]         VARCHAR (30)  NULL,
    [pojemnosc]          VARCHAR (10)  NULL,
    [rok]                CHAR (4)      NULL,
    [uwagi]              VARCHAR (255) NULL,
    CONSTRAINT [PK_SAMOCHODY] PRIMARY KEY CLUSTERED ([id_dok] ASC, [nr_poz] ASC)
);

