USE [master]
GO
/****** Object:  Database [sani_usermanagement]    Script Date: 1/15/2025 4:11:51 PM ******/
CREATE DATABASE [sani_usermanagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sani_usermanagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\sani_usermanagement.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sani_usermanagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\sani_usermanagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sani_usermanagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sani_usermanagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sani_usermanagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sani_usermanagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sani_usermanagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sani_usermanagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [sani_usermanagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sani_usermanagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [sani_usermanagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sani_usermanagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sani_usermanagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sani_usermanagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sani_usermanagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sani_usermanagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sani_usermanagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sani_usermanagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sani_usermanagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sani_usermanagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sani_usermanagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sani_usermanagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sani_usermanagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sani_usermanagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sani_usermanagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sani_usermanagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sani_usermanagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sani_usermanagement] SET  MULTI_USER 
GO
ALTER DATABASE [sani_usermanagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sani_usermanagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sani_usermanagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sani_usermanagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [sani_usermanagement]
GO
/****** Object:  Table [dbo].[modules]    Script Date: 1/15/2025 4:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[url] [nvarchar](100) NULL,
	[slug] [nvarchar](50) NULL,
	[status] [int] NOT NULL,
	[is_default] [bit] NOT NULL,
	[sortid] [int] NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rights]    Script Date: 1/15/2025 4:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rights](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 1/15/2025 4:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[is_default] [bit] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles_modules_permissions]    Script Date: 1/15/2025 4:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles_modules_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[module_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[is_default] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles_modules_permissions_rights]    Script Date: 1/15/2025 4:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles_modules_permissions_rights](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roles_modules_permissions_id] [int] NOT NULL,
	[rights_id] [int] NOT NULL,
	[is_default] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 1/15/2025 4:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[email] [nvarchar](100) NULL,
	[picture] [nvarchar](255) NULL,
	[gender_id] [int] NULL,
	[education_id] [int] NULL,
	[interests] [nvarchar](max) NULL,
	[aboutme] [nvarchar](max) NULL,
	[password] [nvarchar](255) NULL,
	[is_default] [bit] NOT NULL,
	[status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users_roles]    Script Date: 1/15/2025 4:11:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[modules] ADD  DEFAULT ((0)) FOR [parent_id]
GO
ALTER TABLE [dbo].[modules] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[modules] ADD  DEFAULT ((0)) FOR [is_default]
GO
ALTER TABLE [dbo].[modules] ADD  DEFAULT ((1)) FOR [sortid]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT ((0)) FOR [is_default]
GO
ALTER TABLE [dbo].[roles] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[roles_modules_permissions] ADD  DEFAULT ((0)) FOR [is_default]
GO
ALTER TABLE [dbo].[roles_modules_permissions_rights] ADD  DEFAULT ((0)) FOR [is_default]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [is_default]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[roles_modules_permissions]  WITH CHECK ADD  CONSTRAINT [fk_module] FOREIGN KEY([module_id])
REFERENCES [dbo].[modules] ([id])
GO
ALTER TABLE [dbo].[roles_modules_permissions] CHECK CONSTRAINT [fk_module]
GO
ALTER TABLE [dbo].[roles_modules_permissions]  WITH CHECK ADD  CONSTRAINT [fk_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[roles_modules_permissions] CHECK CONSTRAINT [fk_role]
GO
ALTER TABLE [dbo].[roles_modules_permissions_rights]  WITH CHECK ADD  CONSTRAINT [fk_permissions] FOREIGN KEY([roles_modules_permissions_id])
REFERENCES [dbo].[roles_modules_permissions] ([id])
GO
ALTER TABLE [dbo].[roles_modules_permissions_rights] CHECK CONSTRAINT [fk_permissions]
GO
ALTER TABLE [dbo].[roles_modules_permissions_rights]  WITH CHECK ADD  CONSTRAINT [fk_rights] FOREIGN KEY([rights_id])
REFERENCES [dbo].[rights] ([id])
GO
ALTER TABLE [dbo].[roles_modules_permissions_rights] CHECK CONSTRAINT [fk_rights]
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD  CONSTRAINT [fk_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users_roles] CHECK CONSTRAINT [fk_user]
GO
ALTER TABLE [dbo].[users_roles]  WITH CHECK ADD  CONSTRAINT [fk_user_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[users_roles] CHECK CONSTRAINT [fk_user_role]
GO
USE [master]
GO
ALTER DATABASE [sani_usermanagement] SET  READ_WRITE 
GO
