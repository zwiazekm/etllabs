CREATE TABLE [aimp2].[ICS_ZCP_NATURAL_PERSON] (
    [ID]                  NUMERIC (19)  NOT NULL,
    [ZCP_ADDRESS_ID]      NUMERIC (19)  NULL,
    [ZCP_DOC_SIGNER_ID]   NUMERIC (19)  NULL,
    [IDENTIFIER]          NVARCHAR (18) NULL,
    [NAME]                NVARCHAR (30) NULL,
    [SURNAME]             NVARCHAR (40) NULL,
    [ID_NO]               NVARCHAR (30) NULL,
    [PESEL]               NVARCHAR (11) NULL,
    [REPRESENTATIVE_TYPE] NCHAR (3)     NULL,
    [BE_OUTPOST]          NCHAR (2)     NULL,
    [DECL_ID]             NUMERIC (19)  NULL,
    [CUSTOMER_TYPE]       NVARCHAR (20) NOT NULL,
    [ZCP_ACF]             NTEXT         NULL,
    [version]             INT           NOT NULL,
    CONSTRAINT [ICS_ZCP_NATURAL_PERSON$PK_ICS_ZCP_NATURAL_PERSON] PRIMARY KEY CLUSTERED ([ID] ASC)
);

