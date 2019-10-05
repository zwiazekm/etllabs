CREATE TABLE [intr2].[istat_komunikat_popup_uzytkownik] (
    [popup_id]  NUMERIC (19)   NOT NULL,
    [user_name] NVARCHAR (100) NOT NULL,
    CONSTRAINT [istat_komunikat_popup_uzytkownik$pk_istat_komunikat_popup_uzytkownik] PRIMARY KEY CLUSTERED ([popup_id] ASC, [user_name] ASC)
);

