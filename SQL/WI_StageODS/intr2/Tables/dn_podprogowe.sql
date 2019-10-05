CREATE TABLE [intr2].[dn_podprogowe] (
    [podm_p]      INT           NULL,
    [podm_w]      INT           NULL,
    [nabycia]     DECIMAL (38)  NULL,
    [dostawy]     DECIMAL (38)  NULL,
    [dotyczy_rok] NCHAR (4)     NOT NULL,
    [data]        DATETIME2 (3) NOT NULL
);

