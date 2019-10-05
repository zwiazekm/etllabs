CREATE TABLE [tr].[Urzedy] (
    [IDUrzedu]                        VARCHAR (8) NOT NULL,
    [CzyDedykowanyDlaPrzedsiebiorcow] BIT         NULL,
    [IDKraju]                         CHAR (2)    NOT NULL,
    [KodGeograficzny]                 VARCHAR (6) NULL,
    [KodPocztowy]                     VARCHAR (9) NOT NULL,
    [KodRegionu]                      CHAR (3)    NULL,
    CONSTRAINT [PK_Urzedy] PRIMARY KEY CLUSTERED ([IDUrzedu] ASC)
);

