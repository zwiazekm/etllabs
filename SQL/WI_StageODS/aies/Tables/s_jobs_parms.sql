CREATE TABLE [aies].[s_jobs_parms] (
    [id]         NUMERIC (19)   NOT NULL,
    [job_id]     NUMERIC (19)   NULL,
    [parm_name]  VARCHAR (255)  NOT NULL,
    [parm_value] VARCHAR (1024) NOT NULL,
    CONSTRAINT [pk_S_JOBS_PARMS] PRIMARY KEY CLUSTERED ([id] ASC)
);

