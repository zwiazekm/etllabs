CREATE TABLE [intr2].[istat_komunikat_popup_uzytkownik] (
    [popup_id]  NUMERIC (19)   NOT NULL,
    [user_name] NVARCHAR (100) NOT NULL,
    CONSTRAINT [istat_komunikat_popup_uzytkownik$pk_istat_komunikat_popup_uzytkownik] PRIMARY KEY CLUSTERED ([popup_id] ASC, [user_name] ASC) ON [FG_INTR2],
    CONSTRAINT [istat_komunikat_popup_uzytkownik$fk_istat_komunikat_popup_uzytkownik__istat_komunikat_popup] FOREIGN KEY ([popup_id]) REFERENCES [intr2].[istat_komunikat_popup] ([id])
);

