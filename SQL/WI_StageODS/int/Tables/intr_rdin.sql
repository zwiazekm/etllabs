CREATE TABLE [int].[intr_rdin] (
    [id_rdin]       VARCHAR (35) NOT NULL,
    [NIP]           VARCHAR (10) NULL,
    [rok]           INT          NULL,
    [miesiac]       INT          NULL,
    [wersja_dek]    INT          NULL,
    [kod_us]        VARCHAR (4)  NULL,
    [trans_nabycie] DECIMAL (14) NULL,
    [trans_dostawa] DECIMAL (14) NULL,
    [poprawnosc]    CHAR (1)     NULL,
    [status_us]     CHAR (1)     NULL,
    [rodz_dekl]     CHAR (1)     NULL
);

