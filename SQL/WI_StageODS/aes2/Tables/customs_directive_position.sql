CREATE TABLE [aes2].[customs_directive_position] (
    [id]           NUMERIC (19) NOT NULL,
    [directive_id] NUMERIC (19) NULL,
    [position]     NUMERIC (5)  NOT NULL,
    CONSTRAINT [customs_directive_position$customs_di_10900998931] PRIMARY KEY CLUSTERED ([id] ASC)
);

