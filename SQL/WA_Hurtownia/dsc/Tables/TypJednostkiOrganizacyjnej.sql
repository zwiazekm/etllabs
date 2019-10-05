CREATE TABLE [dsc].[TypJednostkiOrganizacyjnej] (
    [IDTypJednostkiOrganizacyjnej] INT          NOT NULL,
    [KodMiejsceSluzbyPracy]        VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_TypJednostkiOrganizacyjnej] PRIMARY KEY CLUSTERED ([IDTypJednostkiOrganizacyjnej] ASC) ON [FG_DSC]
);

