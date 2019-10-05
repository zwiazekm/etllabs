CREATE TABLE [stat].[pfc_messages] (
    [msgid]            CHAR (40)  NULL,
    [msgtitle]         CHAR (255) NULL,
    [msgtext]          CHAR (255) NULL,
    [msgicon]          CHAR (12)  NULL,
    [msgbutton]        CHAR (17)  NULL,
    [msgdefaultbutton] FLOAT (53) NULL,
    [msgseverity]      FLOAT (53) NULL,
    [msgprint]         CHAR (1)   NULL,
    [msguserinput]     CHAR (1)   NULL
) ON [StatDane];


GO
CREATE STATISTICS [msgbutton]
    ON [stat].[pfc_messages]([msgbutton]);


GO
CREATE STATISTICS [msgdefaultbutton]
    ON [stat].[pfc_messages]([msgdefaultbutton]);


GO
CREATE STATISTICS [msgicon]
    ON [stat].[pfc_messages]([msgicon]);


GO
CREATE STATISTICS [msgid]
    ON [stat].[pfc_messages]([msgid]);


GO
CREATE STATISTICS [msgprint]
    ON [stat].[pfc_messages]([msgprint]);


GO
CREATE STATISTICS [msgseverity]
    ON [stat].[pfc_messages]([msgseverity]);


GO
CREATE STATISTICS [msgtext]
    ON [stat].[pfc_messages]([msgtext]);


GO
CREATE STATISTICS [msgtitle]
    ON [stat].[pfc_messages]([msgtitle]);


GO
CREATE STATISTICS [msguserinput]
    ON [stat].[pfc_messages]([msguserinput]);

