CREATE TABLE [aies].[s_jobs_parms_ics] (
    [id]         NUMERIC (19)   NOT NULL,
    [job_id]     NUMERIC (19)   NULL,
    [parm_name]  VARCHAR (255)  NULL,
    [parm_value] VARCHAR (1024) NULL,
    CONSTRAINT [s_jobs_par_3471452512] PRIMARY KEY CLUSTERED ([id] ASC) ON [FG_AIES]
);

