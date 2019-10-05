CREATE TABLE [intr2].[s_maxids_like_aes] (
    [id]          NUMERIC (19)   NOT NULL,
    [system_name] NVARCHAR (255) NOT NULL,
    [key_name]    NVARCHAR (80)  NOT NULL,
    [key_value]   NUMERIC (19)   NOT NULL,
    [key_section] NVARCHAR (40)  NOT NULL,
    [version]     INT            NULL,
    CONSTRAINT [s_maxids_like_aes$PK_S_MAXIDS_LIKE_AES] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_INTR2],
    CONSTRAINT [s_maxids_like_aes$UQ_S_MAXIDS_LIKE_AES_SYSTEM_SECTION_NAME] UNIQUE NONCLUSTERED ([system_name] ASC, [key_section] ASC, [key_name] ASC) ON [FG_INTR2]
);

