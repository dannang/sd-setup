 USE [historicaldata]
GO

CREATE TABLE [dbo].[date] (
    [iddata]     UNIQUEIDENTIFIER NOT NULL,
    [date]       DATE             NULL,
    [open]       FLOAT (53)       NULL,
    [high]       FLOAT (53)       NULL,
    [low]        FLOAT (53)       NULL,
    [close]      FLOAT (53)       NULL,
    [volume]     FLOAT (53)       NULL,
    [adjclose]   FLOAT (53)       NULL,
    [symbol]     VARCHAR (50)     NULL,
    [idexchange] UNIQUEIDENTIFIER NOT NULL
);

GO
CREATE TABLE [dbo].[exchange] (
    [idexchange] UNIQUEIDENTIFIER NOT NULL,
    [market]     VARCHAR (50)     NULL
);

GO
ALTER TABLE [dbo].[date]
    ADD CONSTRAINT [idexchnage] FOREIGN KEY ([idexchange]) REFERENCES [dbo].[exchange] ([idexchange]);

GO
ALTER TABLE [dbo].[date]
    ADD CONSTRAINT [PK_date] PRIMARY KEY CLUSTERED ([iddata] ASC);

GO
ALTER TABLE [dbo].[exchange]
    ADD CONSTRAINT [PK_exchange] PRIMARY KEY CLUSTERED ([idexchange] ASC);

GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO PUBLIC;

GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO PUBLIC;

GO