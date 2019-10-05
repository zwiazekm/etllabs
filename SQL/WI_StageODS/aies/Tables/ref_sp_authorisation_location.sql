CREATE TABLE [aies].[ref_sp_authorisation_location] (
    [id]                  NUMERIC (19) NOT NULL,
    [sp_authorisation_id] NUMERIC (19) NOT NULL,
    [code]                VARCHAR (14) NULL,
    CONSTRAINT [pk_REF_SP_AUTHORISATION_LOCATI] PRIMARY KEY CLUSTERED ([id] ASC)
);

