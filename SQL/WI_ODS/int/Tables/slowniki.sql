CREATE TABLE [int].[slowniki] (
    [id_rodz_slow] VARCHAR (6)     NOT NULL,
    [id_slown]     VARCHAR (6)     NOT NULL,
    [symbol]       VARCHAR (10)    NULL,
    [nazwa]        VARCHAR (80)    NULL,
    [rodzaj]       CHAR (1)        NULL,
    [typ]          CHAR (1)        NULL,
    [kwota]        DECIMAL (20, 2) NULL,
    [kwota2]       DECIMAL (20, 2) NULL,
    [kwota3]       DECIMAL (20, 2) NULL,
    [data]         DATETIME        NULL,
    [liczba]       INT             NULL,
    [opis]         VARCHAR (255)   NULL,
    [raport]       VARCHAR (6)     NULL,
    [data_od]      DATETIME        NULL,
    [data_do]      DATETIME        NULL,
    [kwota4]       DECIMAL (20, 4) NULL,
    CONSTRAINT [PK_slowniki] PRIMARY KEY CLUSTERED ([id_rodz_slow] ASC, [id_slown] ASC) WITH (FILLFACTOR = 80) ON [FG_INT]
);

