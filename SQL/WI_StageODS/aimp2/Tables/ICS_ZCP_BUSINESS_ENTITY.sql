CREATE TABLE [aimp2].[ICS_ZCP_BUSINESS_ENTITY] (
    [ID]                       NUMERIC (19)  NOT NULL,
    [ZCP_ADDRESS_ID]           NUMERIC (19)  NULL,
    [ZCP_DOC_SIGNER_ID]        NUMERIC (19)  NULL,
    [EMAIL]                    NVARCHAR (70) NULL,
    [EORI]                     NVARCHAR (17) NULL,
    [IDENTIFIER]               NVARCHAR (18) NULL,
    [NAME]                     NVARCHAR (100) NULL,
    [REGON]                    NVARCHAR (14) NULL,
    [TIN]                      NVARCHAR (17) NULL,
    [BE_OUTPOST]               NCHAR (2)     NULL,
    [REPRESENTATIVE_TYPE]      NCHAR (3)     NULL,
    [AEO_CERTIFICATE_GROUP_ID] NUMERIC (19)  NULL,
    [CUSTOMER_TYPE]            NVARCHAR (20) NOT NULL,
    [DECL_ID]                  NUMERIC (19)  NULL,
    [ID_SISC]                  NVARCHAR (20) NULL,
    [ZCP_ACF]                  NTEXT         NULL,
    [version]                  INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_BUSINESS_ENTITY$PK_ICS_ZCP_BUSINESS_ENTITY] PRIMARY KEY CLUSTERED ([ID] ASC)
);

