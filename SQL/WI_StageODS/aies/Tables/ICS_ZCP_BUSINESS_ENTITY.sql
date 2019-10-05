CREATE TABLE [aies].[ICS_ZCP_BUSINESS_ENTITY] (
    [ID]                  NUMERIC (19) NOT NULL,
    [ZCP_ADDRESS_ID]      NUMERIC (19) NULL,
    [ZCP_DOC_SIGNER_ID]   NUMERIC (19) NULL,
    [EMAIL]               VARCHAR (35) NULL,
    [EORI]                VARCHAR (17) NULL,
    [IDENTIFIER]          VARCHAR (18) NOT NULL,
    [NAME]                VARCHAR (70) NULL,
    [REGON]               VARCHAR (14) NULL,
    [TIN]                 VARCHAR (17) NULL,
    [BE_OUTPOST]          CHAR (2)     NULL,
    [REPRESENTATIVE_TYPE] CHAR (3)     NULL,
    CONSTRAINT [pk_ICS_ZCP_BUSINESS_ENTITY] PRIMARY KEY CLUSTERED ([ID] ASC)
);

