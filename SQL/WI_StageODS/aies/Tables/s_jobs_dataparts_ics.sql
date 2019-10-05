CREATE TABLE [aies].[s_jobs_dataparts_ics] (
    [id]             NUMERIC (19)  NOT NULL,
    [datapart_name]  VARCHAR (255) NULL,
    [datapart_value] IMAGE         NULL,
    [job_id]         NUMERIC (19)  NULL,
    CONSTRAINT [s_jobs_dat_17106261062] PRIMARY KEY CLUSTERED ([id] ASC)
);

