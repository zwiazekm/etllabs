CREATE TABLE [aimp2].[ICS_ZCP_DV1_VALUATION_RATIOS] (
    [ID]                           NUMERIC (19) NOT NULL,
    [ZCP_ID]                       NUMERIC (19) NULL,
    [ZCP_ITEM_ID]                  NUMERIC (19) NULL,
    [USE_RESTRICTIONS]             NVARCHAR (1) NULL,
    [BUYER_SELLER_CONNECT]         NVARCHAR (1) NULL,
    [SALE_PRICE_DEPEND]            NVARCHAR (1) NULL,
    [SALE_IS_SUBJECT_TO_AGREEMENT] NVARCHAR (1) NULL,
    [ZCP_ACF]                      NTEXT        NULL,
    [version]                      INT          NOT NULL,
    CONSTRAINT [ICS_ZCP_DV1_VALUATION_RATIOS$PK_ICS_ZCP_DV1_VALUATION_RATIOS] PRIMARY KEY CLUSTERED ([ID] ASC)
);

