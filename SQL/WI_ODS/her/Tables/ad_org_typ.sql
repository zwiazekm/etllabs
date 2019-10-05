CREATE TABLE [her].[ad_org_typ] (
    [id]          INT             NOT NULL,
    [kod]         VARCHAR (50)    NOT NULL,
    [nazwa]       VARCHAR (255)   NULL,
    [normatyw]    DECIMAL (18, 4) NULL,
    [normatyw_do] DECIMAL (9, 4)  NULL,
    [wsk_st_prac] INT             NULL,
    CONSTRAINT [PK_ad_org_typ] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_HER],
    CHECK ([wsk_st_prac]=(1) OR [wsk_st_prac]=(0))
);

