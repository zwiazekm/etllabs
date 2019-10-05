CREATE TABLE [dbo].[SekcjeDlaKomorek] (
    [SekcjaId]       INT NOT NULL,
    [JednostkaOrgId] INT NOT NULL,
    CONSTRAINT [PK_SekcjeDlaKomorek] PRIMARY KEY CLUSTERED ([SekcjaId] ASC, [JednostkaOrgId] ASC),
    CONSTRAINT [FK_SekcjeDlaKomorek_FormatkaSekcje] FOREIGN KEY ([SekcjaId]) REFERENCES [dbo].[FormatkaSekcje] ([SekcjaId]),
    CONSTRAINT [FK_SekcjeDlaKomorek_StrukturaOrganizacyjna] FOREIGN KEY ([JednostkaOrgId]) REFERENCES [dbo].[StrukturaOrganizacyjna] ([JednostkaId])
);

