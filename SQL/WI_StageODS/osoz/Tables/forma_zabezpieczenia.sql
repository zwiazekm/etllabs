CREATE TABLE [osoz].[forma_zabezpieczenia] (
    [id]               BIGINT       NOT NULL,
    [czas_modyfikacji] DATETIME     NULL,
    [kod]              VARCHAR (2)  NOT NULL,
    [nazwa]            VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

