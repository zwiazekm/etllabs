CREATE TABLE [pdr].[c211_zakresreprezentacji] (
    [c211_zakresreprezentacji_id] INT         NOT NULL,
    [zakres]                      VARCHAR (4) NOT NULL,
    [c211_id]                     INT         NULL,
    PRIMARY KEY CLUSTERED ([c211_zakresreprezentacji_id] ASC) ON [FG_PDR],
    CONSTRAINT [fk_c211_zakresreprezentacji_c211_id] FOREIGN KEY ([c211_id]) REFERENCES [pdr].[c211] ([c211_id])
);

