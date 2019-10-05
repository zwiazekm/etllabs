CREATE TABLE [aies].[ref_sp_authorisation_procedure] (
    [id]                  NUMERIC (19) NOT NULL,
    [sp_authorisation_id] NUMERIC (19) NOT NULL,
    [code]                VARCHAR (2)  NULL,
    CONSTRAINT [pk_REF_SP_AUTHORISATION_PROCED] PRIMARY KEY CLUSTERED ([id] ASC)
);

