USE [master]
GO
/****** Object:  Database [WinningCL]    Script Date: 2016/8/30 08:55:35 ******/
CREATE DATABASE [WinningCL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WinningCL', FILENAME = N'D:\Work\JAVA\DB\WinningCL.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WinningCL_log', FILENAME = N'D:\Work\JAVA\DB\WinningCL_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WinningCL] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WinningCL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WinningCL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WinningCL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WinningCL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WinningCL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WinningCL] SET ARITHABORT OFF 
GO
ALTER DATABASE [WinningCL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WinningCL] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WinningCL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WinningCL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WinningCL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WinningCL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WinningCL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WinningCL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WinningCL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WinningCL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WinningCL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WinningCL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WinningCL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WinningCL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WinningCL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WinningCL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WinningCL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WinningCL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WinningCL] SET RECOVERY FULL 
GO
ALTER DATABASE [WinningCL] SET  MULTI_USER 
GO
ALTER DATABASE [WinningCL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WinningCL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WinningCL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WinningCL] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WinningCL', N'ON'
GO
USE [WinningCL]
GO
/****** Object:  Table [dbo].[CL_LinkAction]    Script Date: 2016/8/30 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CL_LinkAction](
	[zlh] [varchar](128) NULL,
	[lcbm] [varchar](32) NULL,
	[lcmc] [varchar](64) NULL,
	[sjlb] [int] NULL,
	[sjbm] [varchar](32) NULL,
	[sjmc] [varchar](64) NULL,
	[hdbm] [varchar](32) NULL,
	[hdmc] [varchar](64) NULL,
	[wzbm] [varchar](32) NULL,
	[wzmc] [varchar](64) NULL,
	[sqbm] [varchar](32) NULL,
	[xmmc] [varchar](1024) NULL,
	[fssj] [datetime] NULL,
	[czry] [varchar](32) NULL,
	[czyy] [varchar](256) NULL,
	[czbz] [varchar](256) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CL_Patient]    Script Date: 2016/8/30 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CL_Patient](
	[zsy] [varchar](128) NULL,
	[zlh] [varchar](128) NULL,
	[jzh] [varchar](32) NULL,
	[zyh] [varchar](32) NULL,
	[hzxm] [varchar](32) NULL,
	[sex] [varchar](8) NULL,
	[age] [varchar](32) NULL,
	[csrq] [datetime] NULL,
	[jzlb] [varchar](64) NULL,
	[zyzd] [varchar](512) NULL,
	[ksmc] [varchar](64) NULL,
	[bqmc] [varchar](64) NULL,
	[bf] [varchar](64) NULL,
	[cw] [varchar](64) NULL,
	[zgys] [varchar](32) NULL,
	[zrhs] [varchar](32) NULL,
	[ryzq] [datetime] NULL,
	[cyrq] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table001]    Script Date: 2016/8/30 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table001](
	[column001] [varchar](32) NOT NULL,
	[column002] [varchar](32) NULL,
	[column003] [varchar](32) NULL,
	[column004] [varchar](8) NULL,
	[column005] [varchar](32) NULL,
	[column006] [varchar](64) NULL,
	[column007] [varchar](64) NULL,
	[column008] [varchar](512) NULL,
	[column009] [varchar](64) NULL,
	[column010] [varchar](64) NULL,
	[column011] [varchar](64) NULL,
	[column012] [varchar](64) NULL,
	[column013] [varchar](32) NULL,
	[column014] [varchar](32) NULL,
	[column015] [datetime] NULL,
	[column016] [datetime] NULL,
 CONSTRAINT [PK_TABLE001] PRIMARY KEY CLUSTERED 
(
	[column001] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table002]    Script Date: 2016/8/30 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table002](
	[column001] [varchar](32) NULL,
	[column002] [varchar](32) NULL,
	[column003] [varchar](64) NULL,
	[column004] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Table003]    Script Date: 2016/8/30 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Table003](
	[column001] [varchar](32) NULL,
	[column002] [varchar](32) NULL,
	[column003] [varchar](64) NULL,
	[column004] [varchar](512) NULL,
	[column005] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[v_RequestType]    Script Date: 2016/8/30 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_RequestType]
AS
SELECT   1 AS iSort, 'yy' AS typeCode, '用药' AS typeName
UNION
SELECT   2, 'jy', '检验'
UNION
SELECT   3, 'jc', '检查'
UNION
SELECT   4, 'sx', '输血'
UNION
SELECT   5, 'ss', '手术'
UNION
SELECT   6, 'bl', '病理'
UNION
SELECT   7, 'zl', '治疗'
UNION
SELECT   8, 'hl', '护理'

GO
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_01YY', N'用药', 1, N'5', N'1. 医嘱开立', N'ACT_01YY_0101', N'开立住院药品医嘱', N'LOC_0001', N'住院医生站', N'49966328', N'阿仑膦酸钠片', CAST(0x0000A655010FAA18 AS DateTime), N'2081', N'', N'')
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_01YY', N'用药', 1, N'6', N'3. 医嘱签收', N'ACT_01YY_0102', N'签收住院药品医嘱', N'LOC_0001', N'住院护士站', N'49966328', N'', CAST(0x0000A65501116510 AS DateTime), N'363', N'', N'')
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_01YY', N'用药', 1, N'10', N'5. 用药执行', N'ACT_01YY_0502', N'执行住院用药', N'LOC_0001', N'病房', N'49966328', N'', CAST(0x0000A65501139D6C AS DateTime), N'363', N'', N'')
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413038', N'PRO_10HZ', N'患者', NULL, NULL, NULL, N'ACT_10HZ_0101', N'入院', NULL, NULL, NULL, NULL, CAST(0x0000A663012D575C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_01YY', N'用药', 1, N'10', N'5. 用药执行', N'ACT_01YY_0501', N'生成住院药品执行单', N'LOC_0001', N'住院护士站', N'49966328', N'阿仑膦酸钠片 ', CAST(0x0000A6550112F547 AS DateTime), N'363', N'', N'')
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413038', N'PRO_10HZ', N'患者', NULL, NULL, NULL, NULL, N'入科', NULL, NULL, NULL, NULL, CAST(0x0000A6630132F540 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413038', N'PRO_10HZ', N'患者', NULL, NULL, NULL, N'ACT_10HZ_0103', N'分床', NULL, NULL, NULL, NULL, CAST(0x0000A66301352FF4 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_10HZ', N'患者', NULL, N'null', N'null', N'ACT_10HZ_0101', N'入院', N'', N'住院处', N'', N'', CAST(0x0000A60D0101DE10 AS DateTime), NULL, N'', N'')
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1013', N'1. 申请开立', N'ACT_05JY_0101', N'开立住院检验申请', NULL, NULL, N'59966329', N'血细胞五分类', CAST(0x0000A666009908F4 AS DateTime), N'363', N'', NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1013', N'1. 申请开立', N'ACT_05JY_0102', N'签收住院检验申请', NULL, NULL, N'59966329', NULL, CAST(0x0000A666009B58C0 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1014', N'2. 标本采集', N'ACT_05JY_0201', N'采集住院检验标本', NULL, NULL, N'59966329', NULL, CAST(0x0000A66600A30980 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1015', N'3. 标本运送', N'ACT_05JY_0202', N'接转住院检验标本', NULL, NULL, N'59966329', NULL, CAST(0x0000A66600AC65FC AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 3, N'1016', N'4. 标本接收', N'ACT_05JY_0203', N'接收住院检验标本', NULL, NULL, N'59966329', NULL, CAST(0x0000A66600B18D84 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 3, N'1016', N'4. 标本接收', N'ACT_05JY_0204', N'核对住院检验标本', NULL, NULL, N'59966329', NULL, CAST(0x0000A66600B1B55C AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 3, N'1016', N'4. 标本接收', N'ACT_05JY_0301', N'登记住院检验不合格样本', NULL, NULL, N'59966329', NULL, CAST(0x0000A66600B5011C AS DateTime), N'363', N'标本不合格', NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 3, N'1016', N'4. 标本接收', N'ACT_05JY_0302', N'发送住院检验不合格样本', NULL, NULL, N'59966329', NULL, CAST(0x0000A66600B5B0E4 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 3, N'1016', N'4. 标本接收', N'ACT_05JY_0303', N'接收住院检验不合格样本', NULL, NULL, N'59966329', NULL, CAST(0x0000A66600BC1BDC AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_10HZ', N'患者', NULL, NULL, NULL, N'ACT_10HZ_0102', N'入科', NULL, NULL, NULL, NULL, CAST(0x0000A60D01031A78 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_10HZ', N'患者', NULL, NULL, NULL, N'ACT_10HZ_0103', N'分床', NULL, NULL, NULL, NULL, CAST(0x0000A60D01056B70 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_10HZ', N'患者', NULL, NULL, NULL, N'ACT_10HZ_0104', N'分配医师', NULL, NULL, NULL, NULL, CAST(0x0000A60D0105BEA4 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_10HZ', N'患者', NULL, NULL, NULL, N'ACT_10HZ_0105', N'分配护士', NULL, NULL, NULL, NULL, CAST(0x0000A60D01061C64 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_01YY', N'用药', 1, N'5', N'1. 医嘱开立', N'ACT_01YY_0101', N'开立住院药品医嘱', N'LOC_0001', N'住院医生站', N'49966329', N'阿莫西林', CAST(0x0000A65701139D6C AS DateTime), N'363', N'', N'')
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1013', N'1. 申请开立', N'ACT_05JY_0101', N'开立住院检验申请', NULL, NULL, N'59966349', N'血细胞五分类', CAST(0x0000A667009908F4 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1013', N'1. 申请开立', N'ACT_05JY_0102', N'签收住院检验申请', NULL, NULL, N'59966349', NULL, CAST(0x0000A667009B58C0 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1014', N'2. 标本采集', N'ACT_05JY_0201', N'采集住院检验标本', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700A30980 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1015', N'3. 标本运送', N'ACT_05JY_0202', N'接转住院检验标本', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700AC65FC AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1016', N'4. 标本接收', N'ACT_05JY_0203', N'接收住院检验标本', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700B18D84 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1016', N'4. 标本接收', N'ACT_05JY_0204', N'核对住院检验标本', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700B1B55C AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1017', N'5. 标本检测', N'ACT_05JY_0205', N'开始检测住院检验标本', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700B2F8CC AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1018', N'6. 报告发送', N'ACT_05JY_0206', N'结束检测住院检验标本', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700BDD800 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 2, N'1019', N'7. 报告审核', N'ACT_05JY_0401', N'审核住院检验报告', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700C389D0 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 2, N'1019', N'7. 报告审核', N'ACT_05JY_0601', N'登记住院危急值', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700C892E0 AS DateTime), N'363', N'有危机值', NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 2, N'1019', N'7. 报告审核', N'ACT_05JY_0602', N'复核住院危急值', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700CE1954 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 2, N'1019', N'7. 报告审核', N'ACT_05JY_0603', N'发送住院危急值', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700D5159C AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 2, N'1019', N'7. 报告审核', N'ACT_05JY_0604', N'接收住院检验危急值', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700D8F888 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 2, N'1019', N'7. 报告审核', N'ACT_05JY_0605', N'反馈住院检验危急值', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700DC0E60 AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_LinkAction] ([zlh], [lcbm], [lcmc], [sjlb], [sjbm], [sjmc], [hdbm], [hdmc], [wzbm], [wzmc], [sqbm], [xmmc], [fssj], [czry], [czyy], [czbz]) VALUES (N'0413037', N'PRO_05JY', N'检验', 1, N'1020', N'8. 报告打印', N'ACT_05JY_0404', N'打印住院检验报告', NULL, NULL, N'59966349', NULL, CAST(0x0000A66700EF658C AS DateTime), N'363', NULL, NULL)
INSERT [dbo].[CL_Patient] ([zsy], [zlh], [jzh], [zyh], [hzxm], [sex], [age], [csrq], [jzlb], [zyzd], [ksmc], [bqmc], [bf], [cw], [zgys], [zrhs], [ryzq], [cyrq]) VALUES (N'G010210661', N'0413038', N'0413038', N'', N'曹霞', N'女', N'37', CAST(0x0000718C00000000 AS DateTime), N'住院', N'', N'血液透析室', N'透析中心护理站', N'02-28', N'透析二区', N'董德涛', N'', CAST(0x0000A58500D0C35C AS DateTime), CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[CL_Patient] ([zsy], [zlh], [jzh], [zyh], [hzxm], [sex], [age], [csrq], [jzlb], [zyzd], [ksmc], [bqmc], [bf], [cw], [zgys], [zrhs], [ryzq], [cyrq]) VALUES (N'G010210660', N'0413037', N'0413037', N'', N'王翠金', N'女', N'40', CAST(0x0000695800000000 AS DateTime), N'住院', N'', N'心内科', N'null', N'null', N'null', N'宋晓玲', N'', CAST(0x0000A26A00A00E9C AS DateTime), CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[Table001] ([column001], [column002], [column003], [column004], [column005], [column006], [column007], [column008], [column009], [column010], [column011], [column012], [column013], [column014], [column015], [column016]) VALUES (N'0413037', N'1', N'张三', N'男', N'23', N'门诊', N'普通患者', N'主诊断1', N'科室A', N'护理站A', N'病房A', N'床位A', N'医生A', N'护士A', CAST(0x0000A63C00000000 AS DateTime), CAST(0x0000A63D00000000 AS DateTime))
INSERT [dbo].[Table001] ([column001], [column002], [column003], [column004], [column005], [column006], [column007], [column008], [column009], [column010], [column011], [column012], [column013], [column014], [column015], [column016]) VALUES (N'2', N'2', N'李四', N'女', N'24', N'急诊', N'市医保', N'主诊断2', N'科室B', N'护理站B', N'病房B', N'床位B', N'医生B', N'护士B', CAST(0x0000A63D00000000 AS DateTime), CAST(0x0000A63E00000000 AS DateTime))
INSERT [dbo].[Table001] ([column001], [column002], [column003], [column004], [column005], [column006], [column007], [column008], [column009], [column010], [column011], [column012], [column013], [column014], [column015], [column016]) VALUES (N'3', N'3', N'王五', N'男', N'25', N'住院', N'省医保', N'主诊断3', N'科室C', N'护理站C', N'病房C', N'床位C', N'医生C', N'护士C', CAST(0x0000A63E00000000 AS DateTime), CAST(0x0000A63F00000000 AS DateTime))
INSERT [dbo].[Table002] ([column001], [column002], [column003], [column004]) VALUES (N'1', N'1', N'分诊台', CAST(0x0000A63C008C1360 AS DateTime))
INSERT [dbo].[Table002] ([column001], [column002], [column003], [column004]) VALUES (N'2', N'2', N'分诊台', CAST(0x0000A63D008C59B0 AS DateTime))
INSERT [dbo].[Table002] ([column001], [column002], [column003], [column004]) VALUES (N'3', N'1', N'挂号处', CAST(0x0000A63C009450C0 AS DateTime))
INSERT [dbo].[Table002] ([column001], [column002], [column003], [column004]) VALUES (N'4', N'3', N'住院处', CAST(0x0000A63E00949710 AS DateTime))
INSERT [dbo].[Table002] ([column001], [column002], [column003], [column004]) VALUES (N'5', N'3', N'护理站', CAST(0x0000A63C008C1360 AS DateTime))
INSERT [dbo].[Table002] ([column001], [column002], [column003], [column004]) VALUES (N'6', N'2', N'抢救室', CAST(0x0000A63D00949710 AS DateTime))
INSERT [dbo].[Table002] ([column001], [column002], [column003], [column004]) VALUES (N'10', N'0413037', N'住院处', CAST(0x0000A4CF00949710 AS DateTime))
INSERT [dbo].[Table002] ([column001], [column002], [column003], [column004]) VALUES (N'11', N'0413037', N'护理站', CAST(0x0000A4CF009CD470 AS DateTime))
INSERT [dbo].[Table002] ([column001], [column002], [column003], [column004]) VALUES (N'12', N'0413037', N'病房', CAST(0x0000A4CF00A02030 AS DateTime))
INSERT [dbo].[Table003] ([column001], [column002], [column003], [column004], [column005]) VALUES (N'1', N'1', N'用药', N'药品1', CAST(0x0000A63F00000000 AS DateTime))
INSERT [dbo].[Table003] ([column001], [column002], [column003], [column004], [column005]) VALUES (N'2', N'1', N'用药', N'药品2', CAST(0x0000A64000000000 AS DateTime))
INSERT [dbo].[Table003] ([column001], [column002], [column003], [column004], [column005]) VALUES (N'3', N'2', N'检验', N'检验1', NULL)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Table002', @level2type=N'COLUMN',@level2name=N'column001'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Table002', @level2type=N'COLUMN',@level2name=N'column002'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Table002', @level2type=N'COLUMN',@level2name=N'column003'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[23] 4[5] 2[36] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_RequestType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'v_RequestType'
GO
USE [master]
GO
ALTER DATABASE [WinningCL] SET  READ_WRITE 
GO
