CREATE TABLE [aies].[ref_customer] (
    [id]                NUMERIC (19)  NOT NULL,
    [slw_id]            NUMERIC (19)  NOT NULL,
    [short_name]        NVARCHAR (35) NOT NULL,
    [tin]               VARCHAR (17)  NULL,
    [regon]             VARCHAR (14)  NULL,
    [from_date]         DATETIME      NOT NULL,
    [to_date]           DATETIME      NULL,
    [post_code]         VARCHAR (9)   NOT NULL,
    [city]              NVARCHAR (35) NOT NULL,
    [street_and_number] NVARCHAR (35) NOT NULL,
    [country]           VARCHAR (20)  NOT NULL,
    [full_name]         VARCHAR (255) NULL,
    [eori]              VARCHAR (17)  NULL,
    CONSTRAINT [pk_ref_customer] PRIMARY KEY CLUSTERED ([id] ASC)
);

