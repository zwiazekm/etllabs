CREATE TABLE [aies].[s_jobs_dataparts] (
    [id]             NUMERIC (19)  NOT NULL,
    [job_id]         NUMERIC (19)  NULL,
    [datapart_name]  VARCHAR (255) NOT NULL,
    [datapart_value] IMAGE         NOT NULL,
    CONSTRAINT [pk_S_JOBS_DATAPARTS] PRIMARY KEY CLUSTERED ([id] ASC)
);

