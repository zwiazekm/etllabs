CREATE TABLE [cel].[sl_kraje_grupy] (
    [grupa] VARCHAR (255) NOT NULL,
    [kraj]  VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_sl_kraje_grupy] PRIMARY KEY CLUSTERED ([grupa] ASC, [kraj] ASC) WITH (FILLFACTOR = 90) ON [FG_CEL]
);

