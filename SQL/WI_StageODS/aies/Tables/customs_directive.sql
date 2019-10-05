﻿CREATE TABLE [aies].[customs_directive] (
    [id]                    NUMERIC (19)   NOT NULL,
    [addressee]             VARCHAR (40)   NULL,
    [author]                VARCHAR (255)  NULL,
    [dir_for_next_co]       VARCHAR (500)  NULL,
    [dir_dispatcher]        VARCHAR (100)  NULL,
    [information]           VARCHAR (200)  NULL,
    [warue]                 VARCHAR (5)    NULL,
    [war1]                  VARCHAR (1)    NULL,
    [war234]                VARCHAR (3)    NULL,
    [war5]                  VARCHAR (1)    NULL,
    [COMMENT]               VARCHAR (1024) NULL,
    [control_method]        VARCHAR (20)   NULL,
    [mrn]                   VARCHAR (18)   NULL,
    [control_tool]          VARCHAR (20)   NULL,
    [item_number]           NUMERIC (3)    NULL,
    [algorithm_number]      VARCHAR (30)   NULL,
    [objection_number]      VARCHAR (30)   NULL,
    [risk_area]             VARCHAR (12)   NULL,
    [risk_level]            VARCHAR (1)    NULL,
    [samples]               TINYINT        NULL,
    [profile]               VARCHAR (24)   NULL,
    [segment]               VARCHAR (2)    NULL,
    [status]                VARCHAR (4)    NOT NULL,
    [text]                  VARCHAR (1024) NULL,
    [control_type]          CHAR (1)       NULL,
    [pointer]               VARCHAR (255)  NULL,
    [result]                VARCHAR (1024) NULL,
    [source]                VARCHAR (1024) NULL,
    [decl_id]               NUMERIC (19)   NOT NULL,
    [item_type]             CHAR (3)       NULL,
    [method_risk_level]     CHAR (1)       NULL,
    [realisation_date]      DATETIME       NULL,
    [id_verification_item]  NUMERIC (19)   NULL,
    [dirtype]               CHAR (3)       NULL,
    [intro]                 INT            NULL,
    [origin]                VARCHAR (40)   NULL,
    [verification_required] TINYINT        NULL,
    [MODIFIED_BY]           VARCHAR (255)  NULL,
    CONSTRAINT [pk_customs_directive] PRIMARY KEY CLUSTERED ([id] ASC)
);

