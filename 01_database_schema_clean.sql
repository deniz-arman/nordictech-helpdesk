IF DB_ID(N'NordicTech_Helpdesk') IS NULL
BEGIN
    CREATE DATABASE [NordicTech_Helpdesk];
END
GO

USE [NordicTech_Helpdesk];
GO

/****** Object:  Table [dbo].[escalations]    Script Date: 2026-10-20 13:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[escalations](
	[escalation_id] [int] NOT NULL,
	[ticket_id] [int] NULL,
	[from_technician_id] [int] NULL,
	[to_technician_id] [int] NULL,
	[escalation_reason] [varchar](200) NOT NULL,
	[escalate_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[escalation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[technicians]    Script Date: 2026-10-20 13:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[technicians](
	[technician_id] [int] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[support_level] [varchar](10) NOT NULL,
	[team] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[technician_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket_updates]    Script Date: 2026-10-20 13:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket_updates](
	[update_id] [int] NOT NULL,
	[ticket_id] [int] NOT NULL,
	[technician_id] [int] NOT NULL,
	[previous_status] [varchar](20) NULL,
	[new_status] [varchar](20) NOT NULL,
	[update_note] [varchar](max) NULL,
	[updated_at] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[update_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tickets]    Script Date: 2026-10-20 13:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tickets](
	[ticket_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[technician_id] [int] NULL,
	[incident_type] [varchar](50) NOT NULL,
	[priority] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
	[resolved_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2026-10-20 13:07:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[department] [nvarchar](50) NULL,
	[office_location] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[escalations]  WITH CHECK ADD FOREIGN KEY([from_technician_id])
REFERENCES [dbo].[technicians] ([technician_id])
GO
ALTER TABLE [dbo].[escalations]  WITH CHECK ADD FOREIGN KEY([ticket_id])
REFERENCES [dbo].[tickets] ([ticket_id])
GO
ALTER TABLE [dbo].[escalations]  WITH CHECK ADD FOREIGN KEY([to_technician_id])
REFERENCES [dbo].[technicians] ([technician_id])
GO
ALTER TABLE [dbo].[ticket_updates]  WITH CHECK ADD FOREIGN KEY([technician_id])
REFERENCES [dbo].[technicians] ([technician_id])
GO
ALTER TABLE [dbo].[ticket_updates]  WITH CHECK ADD FOREIGN KEY([ticket_id])
REFERENCES [dbo].[tickets] ([ticket_id])
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD FOREIGN KEY([technician_id])
REFERENCES [dbo].[technicians] ([technician_id])
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[technicians]  WITH CHECK ADD CHECK  (([support_level]='L3' OR [support_level]='L2' OR [support_level]='L1'))
GO
