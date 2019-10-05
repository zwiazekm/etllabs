CREATE TABLE [aies].[ref_sp_authorisation_co] (
    [id]                  NUMERIC (19) NOT NULL,
    [sp_authorisation_id] NUMERIC (19) NOT NULL,
    [response_time]       INT          NULL,
    [co_code]             VARCHAR (8)  NULL,
    [before_end_time]     INT          NULL,
    CONSTRAINT [pk_ref_sp_authorisation_co] PRIMARY KEY CLUSTERED ([id] ASC)
);

