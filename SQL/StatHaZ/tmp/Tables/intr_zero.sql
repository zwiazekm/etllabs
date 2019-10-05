CREATE TABLE [tmp].[intr_zero] (
    [typ]         CHAR (1)     NULL,
    [RokMc]       INT          NULL,
    [nip]         VARCHAR (10) NULL,
    [intr_zerowy] CHAR (1)     NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_intr_zero]
    ON [tmp].[intr_zero]([RokMc] ASC, [nip] ASC);

