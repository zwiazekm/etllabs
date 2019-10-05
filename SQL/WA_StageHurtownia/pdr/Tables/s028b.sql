CREATE TABLE [pdr].[s028b] (
    [s028b_id]             BIGINT          NOT NULL,
    [code]                 VARCHAR (10)    NOT NULL,
    [creation_tm]          DATETIME        NULL,
    [last_modification_tm] DATETIME        NULL,
    [valid_from]           DATE            NULL,
    [valid_to]             DATE            NULL,
    [description]          NVARCHAR (2000) NOT NULL,
    [description_eng]      NVARCHAR (2000) NULL,
    [version_]             BIGINT          CONSTRAINT [DF__s028b__version___206DA6C0] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK__s028b__EC1EC8276F7C497D] PRIMARY KEY CLUSTERED ([s028b_id] ASC)
);

