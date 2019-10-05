CREATE TABLE [tmp].[im_sum_dekl_nip] (
    [im_nip]     VARCHAR (10)    NULL,
    [im_Rok]     SMALLINT        NULL,
    [im_wartosc] DECIMAL (19, 3) NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_im_sum_dekl_nip]
    ON [tmp].[im_sum_dekl_nip]([im_nip] ASC)
    ON [StatIndeksy];

