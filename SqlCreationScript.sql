USE [MLPayment]
GO
/****** Object:  User [czappala]    Script Date: 06/11/2019 0:16:30 ******/
CREATE USER [czappala] FOR LOGIN [czappala] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [czappala]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[BillNumber] [int] NULL,
	[DateIndex] [int] NOT NULL,
	[DateCreation] [date] NOT NULL,
	[DateModification] [date] NULL,
	[Valid] [bit] NOT NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillsCharges]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillsCharges](
	[IdBill] [int] NOT NULL,
	[IdCharge] [int] NOT NULL,
	[DateIndex] [int] NOT NULL,
	[DateCreation] [date] NOT NULL,
	[DateModification] [date] NULL,
	[Valid] [bit] NOT NULL,
 CONSTRAINT [PK_BillsCharge] PRIMARY KEY CLUSTERED 
(
	[IdBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Charges]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Charges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEvent] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[DateIndex] [int] NOT NULL,
	[DateCreation] [date] NOT NULL,
	[DateModification] [date] NULL,
	[Valid] [bit] NOT NULL,
 CONSTRAINT [PK_Charges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Document] [varchar](50) NOT NULL,
	[DocumentType] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Gender] [int] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[AddressNumber] [int] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[BirthDate] [int] NOT NULL,
	[DateIndex] [int] NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[DateModification] [datetime] NULL,
	[Valid] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201911060313517_InitialCreate', N'MLPayment.UI.Web.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EDC36107D2FD07F10F4D416CECA9726488D7502776DB7467D43D64EFB167025EE5A8844A912E5DA28F2657DE827F5173A94A81B2FBAECCABBEBA040E115876786C34372480EF3DF3FFF8EDF3FFA9EF180A3D80DC891B937DA350D4CECC071C9E2C84CE8FCD55BF3FDBB6FBF199F3AFEA3F131973B60725093C447E63DA5E1A165C5F63DF6513CF25D3B0AE2604E4776E05BC809ACFDDDDD9FACBD3D0B038409588631FE9010EAFA38FD013F2701B1714813E45D060EF662FE1D4AA629AA71857C1C87C8C647E6E5C50D7AF231A1A3BBF3D1EF7836CAAA98C6B1E72230678ABDB9692042028A28187B7817E3298D02B29886F00179B74F2106B939F262CC1B71588A776DCFEE3E6B8F5556CCA1EC24A681DF1370EF803BC812AB2FE566B37020B8F0145C4D9F58AB53371E99E70E4E3F7D083C7080A8F070E2454C183C5DA8388EC32B4C4779C55106791601DC5F41F4795445DC313AD7DB2908B53FDA65FFED1893C4A349848F084E6884BC1DE3269979AEFD1B7EBA0D3E637274B0379B1FBC7DFD0639076F7EC407AFAB2D85B6825CED037CBA89821047601B9E17ED370DAB5ECF122B16D52A7532AF0097606C98C6257ABCC06441EF61D4ECBF358D33F7113BF9174EAE3BE2C250824A344AE0E755E27968E6E1A2DC6AD4C9FEDFA075FFF59B41B45EA107779176BDA01F064E04E3EA03F6D2D2F8DE0DB3E155EBEF4F5CEC2C0A7CF6BBCEAFACF4D33448229B3526D08ADCA2688169DDBAB15592B713A519D4F0B4CE51B79FDACC5299DE4A51D6A0654642AE62DDA321B7F779F57666DC711842E7A5D4621E69249C7AC51A0910C02E41B024D15E57121168DCD73C279EFAC8F50698143B6881A064EE463E2E5AF973001444A4B7CD37288E614E707E45F17D83E9F0E700A64FB19D4440D529457EF8ECDA6EEE0382AF127FC646C0FA740DD635B77F0567C8A641744A58AD95F12E02FB7390D053E29C208AEFA89D03B29FB7AEDF1D6010738E6D1BC7F11990193B930062EE1CF09CD083FDDE706C96DA745032F190EBABA312613EFD948B9691895A428A4E3462AA08A5C9D48B60E1926EA6E6A27A5333895653B9585F531958374BB9A4DED054A0D5CE4C6AB0982FEDA1E183BE1476FBA3BED5166FDD5C5071E3146648FC0B26388269CCB94194E288943DD065DED844B090761F53FAEC6B53AAE923F292A1552D351AD24960F8D190C26EFF6848CD84CF0FAEC3A2920E5BA15C18E03BC9AB7759ED634EB06CDDC3A1D6CC752B5FCF1CA01B2EC7711CD86E3A0A148760FC08A36E3FC47046FB7946D61AF14C041A064477D992075FA06DA648AA6B72823D4CB1716C6787841314DBC891DD080D727A1896AFA80AC3CAB391BA713F483A81E938629510DB04C530525D42E561E112DB0D91D7EA25A166C7258CB5BDD021969CE01013A6B0D5135D94AB8F429801851EA153DA3C34B62A8C6B26A2266AD5F5795B085BF6BB7442B1164EB6C4CE1A5EF2F8ED5988D9ECB13590B3D9255D0CD01EEB6D82A07CAFD29500E2C665DB082AEC983404E521D55A085AF7D806085A77C98B2368B645EDDAFFC27E75DBE859DF28AF7F596F74D706B859F3C79651338B3DA10E851A3892E979326385F8912A36676027DF9FC53CD41529C2C0A798D68F6CCA785719875ACD2022899A004BA2B580F20B4109481A503D8CCBCFF21AADE351440FD8FCDCAD1196CFFD026C85033276F562B422A8BF3E15C9D969F751B4AC608344F24E9B850A8E8210E2E4556F7807A7E8CE6565C7748985FB44C39586F1CE6870504BE4AA7152DE98C1BD9453B3DD4BAA80AC4F48B6929784F049E3A5BC31837B8973B4DD498AA0A04758B0928BEA4BF840832D3FE928569BA26C6C654953FCC3D8D264578D2F5118BA6451C9B6E25F8C69966A357935ED9F7EE46718961D2BB2900A6B0B4D3488D0020BA5A01A2C3D73A3989E208A66889DF34C1C5F1253AEAD9AE93F57595D3EE54ECCD7815C9AFD9DD5D05DE3D7165C3922E14067D04C56396D315690405DDD602970C84391E2F87E1278894FF45196BE76768957AD9F7D9111C69660BF1445492E9362DDBAFF3BF58E3C3286ECA9229259BEB7F4103A9FE77168D5EBBAD8548F921F55555174C7571BEB3D5D48D3BFC7C490B17F87B5223CCF08E3792A5500FEA9274625D54102AB947547AD67A35431EB25DD118594932AA450D4C3CA6A6249CDC86AC152781A8FAA25BA6B905349AAE872697764455249155A51BC04B6C266B1AC3BAA22EFA40AAC28EE8E5D26A18833E916AF61DA8DCC6A8B58B6E15D6D15D3603CCFB438CC2258B9D7AF02553EF7C4E237F71218FFBE9594D2EEFA56A35476D8B11AA53418FA39A8762D5E9F821AEFF2F598B5BBEEDA34DF74D7AFC7EB47DC67A587B4F313450AEDC50E50D8E98DF9AEABFDB18DB40DCB444C2377232CF14F31C5FE88098CA67F7A13CFC56C42CF052E1171E738A6597E87B9BFBBB72F3CD5D99E6733561C3B9E62D7AA7B3B53EFB335A46A910714D9F72892132756785A52824A67D2E7C4C18F47E6DF69ADC3F47883FD957EDE31CEE33BE2FE9940C16D9460E38B9C083A4CAA7D87C71D85A15F5EC4AB89EE2E3FFFE3535675C7B88E60381D1ABB82A397E9FEFA5B8A5ED6645557B066E917162F77B4D51E2D285185D1B2FC1B85994B07799F905BF99D8F1EBFEF6B9AF20DC24A888A770643E10DE242DD3B8265B0B46F081CF849D33704FD1AAB7E53B08C69DAF7042EE90F26BE26E83E0DE53537B80E29764DEB9892523FB76663AF949AB9E9B5494ADA5E69A0CB89D93DE0064DBE5E2D44796149CD832D9D8A9CE5C1B037C9FB674F54DE96DCE43268DF6C4AF23AB3901BEE97BEAAE4E32D489753A4FF6C3EC578DD5CD31D036F799E66BF44E22D231B5FE6379F2EBC6EB2E90E88B79C6CBD9282B78C6B9B5A3F37CCB4CE4BE8C6537CE56C25CD758EEA14B92D85373B7287EDFF2C0012641165F6F2529D33A653569245ABB014D12BD527AB898AA58123E995249AD5F66B2B5FF01B1BCB659AD56A523C9B74F3F9BF51379769D6AD499CDC44F2B13275519510DE328F356553BDA464E35A4B5A72DBDB62D6C6BBF997945B3C88536AA34773BBFC7252890771C99043A747EAB07C510C6B67E5DF6E84F53B76172504FB971C09B66BAB6621734EE641BE780B16E522C209CD25A6C88125F538A2EE1CD9148AD90174FA743C3DD463D72033EC9C93EB8486098526637FE6D50EBC5810D0A43FCD8FAEDB3CBE0ED9AF78882680992E3BB8BF263F27AEE714769F29CE8434102CBAE0C7BDAC2F293BF65D3C15485701E908C4DD570445B7D80F3D008BAFC9143DE0656C03FA5DE005B29FCA13401D487B47D4DD3E3E71D122427ECC31CAFAF01338ECF88FEFFE07875FEEF1C2540000, N'6.2.0-61023')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f5dfd11c-50e9-42dc-9ee3-960995614460', N'Cris1408@gmail.com', 0, N'ABs7zztkkWomZGBxAMp+ThFqt+/O2UqIvZRVDjdUiEp3tS6zaGV8qJ2mTZbv8fRUjQ==', N'fbd13aba-836a-473b-8dcc-a8d2c3e7051d', NULL, 0, 0, NULL, 1, 0, N'Cris1408@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Bills] ON 
GO
INSERT [dbo].[Bills] ([Id], [IdUser], [BillNumber], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (1, 1, NULL, 20191106, CAST(N'2019-11-06' AS Date), NULL, 1)
GO
INSERT [dbo].[Bills] ([Id], [IdUser], [BillNumber], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (2, 2, NULL, 20191106, CAST(N'2019-11-06' AS Date), NULL, 1)
GO
INSERT [dbo].[Bills] ([Id], [IdUser], [BillNumber], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (3, 8, 12, 20191106, CAST(N'2019-11-06' AS Date), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Bills] OFF
GO
INSERT [dbo].[BillsCharges] ([IdBill], [IdCharge], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (1, 1, 20191106, CAST(N'2019-11-06' AS Date), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Charges] ON 
GO
INSERT [dbo].[Charges] ([Id], [IdEvent], [Amount], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (1, 4, 120.0000, 20191106, CAST(N'2019-11-06' AS Date), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Charges] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (1, N'27820063', 1, N'Jameson', 2, N'P.O. Box 515, 2880 Sit Street', 851, N'(04) 9459 4148', 10, 17, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (2, N'62204916', 2, N'Peter', 1, N'5467 Pellentesque St.', 1135, N'(05) 2117 2655', 10, 10, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (3, N'79458490', 2, N'Barrett', 1, N'4730 Tristique St.', 2732, N'(05) 9847 3833', 13, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (4, N'70027882', 1, N'Hamish', 2, N'P.O. Box 187, 7264 In Av.', 2454, N'(05) 1038 0698', 14, 11, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (5, N'23102275', 2, N'Hammett', 1, N'4995 Aenean Rd.', 5248, N'(01) 2544 2513', 17, 16, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (6, N'24020812', 1, N'Hyatt', 2, N'Ap #475-6756 A Rd.', 3445, N'(08) 5898 5324', 18, 15, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (7, N'28833337', 2, N'Jeremy', 2, N'P.O. Box 250, 3723 Donec Street', 864, N'(06) 9174 1736', 19, 10, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (8, N'65069957', 2, N'Jamal', 1, N'P.O. Box 970, 4978 Nullam Av.', 5763, N'(01) 7195 7456', 15, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (9, N'71877091', 2, N'Bradley', 1, N'P.O. Box 171, 1976 Quam St.', 385, N'(01) 2570 3006', 14, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (10, N'22020711', 1, N'Kelly', 1, N'6430 Lorem, Road', 4604, N'(06) 3989 8515', 15, 14, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (11, N'71712615', 1, N'Chase', 1, N'P.O. Box 637, 7758 Interdum. Rd.', 2259, N'(07) 1492 6729', 14, 14, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (12, N'24974427', 1, N'Knox', 1, N'Ap #556-4665 Dapibus Rd.', 365, N'(07) 3663 3518', 19, 17, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (13, N'54395193', 1, N'Malik', 1, N'P.O. Box 314, 4107 Integer Rd.', 1122, N'(06) 4956 7166', 15, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (14, N'49985853', 1, N'Tyrone', 1, N'Ap #461-814 Cum St.', 4772, N'(03) 4534 6151', 19, 12, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (15, N'30366887', 2, N'Harrison', 1, N'956-3622 Adipiscing St.', 2588, N'(04) 1398 7706', 12, 14, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (16, N'75781668', 2, N'Timon', 2, N'8952 Tincidunt Road', 574, N'(06) 2673 9224', 18, 17, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (17, N'24752397', 1, N'Jermaine', 1, N'Ap #624-3286 Dictum. Road', 2388, N'(03) 8162 1109', 10, 18, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (18, N'55722732', 2, N'Herman', 2, N'Ap #415-5535 Nulla Avenue', 2758, N'(05) 9847 2961', 13, 15, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (19, N'30264348', 2, N'Salvador', 1, N'P.O. Box 273, 4600 Sed Av.', 5275, N'(01) 0034 9123', 17, 14, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (20, N'57501974', 2, N'Hayden', 1, N'126-8740 Suspendisse Avenue', 1206, N'(05) 5819 2048', 11, 15, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (21, N'70112326', 2, N'Patrick', 1, N'536-3345 Posuere St.', 5484, N'(03) 4099 5932', 12, 14, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (22, N'32938926', 1, N'Emmanuel', 2, N'Ap #223-7937 Vehicula Rd.', 505, N'(09) 4882 6685', 14, 17, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (23, N'48719201', 2, N'James', 2, N'P.O. Box 140, 2431 Hendrerit. Street', 5887, N'(03) 5415 8820', 19, 10, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (24, N'24755869', 1, N'Jared', 1, N'293-6105 Magna St.', 3446, N'(07) 9035 4967', 12, 12, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (25, N'66640856', 1, N'Brody', 2, N'Ap #398-8241 Nunc Rd.', 310, N'(05) 4324 3591', 20, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (26, N'75118843', 1, N'Matthew', 1, N'869-4091 Laoreet, Road', 2291, N'(05) 0166 8489', 11, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (27, N'55638031', 1, N'Jin', 2, N'Ap #848-6799 Donec St.', 3885, N'(01) 1932 3605', 12, 18, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (28, N'22250586', 2, N'Rafael', 1, N'307-2606 Aliquet St.', 4504, N'(08) 4874 8069', 15, 15, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (29, N'58940293', 2, N'Ivor', 1, N'P.O. Box 350, 6500 Quis St.', 330, N'(02) 0646 7817', 13, 18, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (30, N'72025123', 2, N'Kamal', 1, N'8075 Sed Street', 2124, N'(05) 4764 2506', 13, 15, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (31, N'31037122', 1, N'Dennis', 1, N'8259 Ac St.', 2972, N'(07) 7495 6032', 16, 14, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (32, N'28440056', 2, N'Harper', 1, N'P.O. Box 321, 9800 Amet, Rd.', 2292, N'(05) 1586 6812', 11, 16, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (33, N'52910545', 1, N'Aladdin', 1, N'4196 Mi. St.', 2782, N'(02) 5953 7167', 17, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (34, N'45201491', 2, N'Alec', 2, N'Ap #989-9263 Adipiscing Street', 5814, N'(03) 9737 6151', 13, 18, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (35, N'53876991', 1, N'Sylvester', 1, N'393 Dis Ave', 4646, N'(08) 3543 8595', 11, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (36, N'60116793', 1, N'Dane', 2, N'Ap #150-9895 Et St.', 1135, N'(02) 6222 8905', 14, 15, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (37, N'46934234', 1, N'Gary', 2, N'Ap #339-9227 Lobortis Rd.', 2180, N'(03) 7041 5321', 10, 18, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (38, N'71265675', 2, N'Rogan', 2, N'845 Pellentesque, St.', 4957, N'(07) 1235 9317', 10, 12, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (39, N'22247659', 1, N'Kenyon', 1, N'9704 Lobortis St.', 2993, N'(01) 9410 1256', 15, 10, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (40, N'56272739', 2, N'Plato', 1, N'555-1554 Suscipit, Rd.', 2656, N'(08) 5128 3527', 20, 10, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (41, N'25471689', 1, N'Ferris', 2, N'P.O. Box 767, 2870 Nunc St.', 5647, N'(01) 7422 7158', 20, 12, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (42, N'54211553', 2, N'Joseph', 2, N'Ap #206-3173 Ornare, Rd.', 1661, N'(07) 4998 5778', 19, 18, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (43, N'62261766', 2, N'Gary', 2, N'Ap #415-7284 Feugiat St.', 6000, N'(06) 6138 7138', 20, 20, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (44, N'50957870', 1, N'Holmes', 1, N'P.O. Box 390, 6116 In Rd.', 4604, N'(03) 0429 8879', 20, 14, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (45, N'37486984', 1, N'Ezra', 2, N'P.O. Box 474, 2984 Felis Ave', 897, N'(06) 2166 7760', 20, 16, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (46, N'72195671', 1, N'Merrill', 1, N'5921 Sapien St.', 1192, N'(03) 6863 9311', 14, 20, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (47, N'39290703', 1, N'Geoffrey', 2, N'2228 Metus Ave', 5798, N'(06) 5968 9251', 12, 16, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (48, N'64455756', 2, N'Hop', 1, N'P.O. Box 447, 8824 Ultricies Rd.', 104, N'(03) 1103 4032', 15, 20, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (49, N'70252305', 2, N'Gavin', 1, N'2669 Ligula. Street', 650, N'(03) 2548 5435', 11, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (50, N'54122746', 2, N'Gareth', 2, N'770-5924 Morbi St.', 5669, N'(03) 2492 9073', 13, 12, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (51, N'25275664', 2, N'Anthony', 2, N'Ap #979-570 Velit. Rd.', 3006, N'(01) 9557 1714', 13, 18, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (52, N'52702146', 1, N'Levi', 2, N'P.O. Box 812, 5421 Ridiculus Street', 2460, N'(09) 4495 7734', 11, 18, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (53, N'30113346', 2, N'Chaney', 2, N'540-5900 Aliquet, St.', 5182, N'(08) 0027 4242', 19, 17, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (54, N'60576457', 2, N'Price', 2, N'1932 Sagittis. Ave', 5548, N'(09) 1580 5791', 15, 12, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (55, N'79692022', 2, N'Alden', 1, N'1052 Lacinia. Av.', 4391, N'(05) 6342 7826', 17, 17, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (56, N'54207167', 1, N'Beck', 1, N'489 Risus. St.', 4692, N'(01) 5553 9185', 16, 10, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (57, N'23849170', 2, N'Colin', 2, N'370-6206 Et Street', 3293, N'(06) 3055 1509', 10, 16, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (58, N'26235733', 1, N'Chaney', 1, N'923-1185 Enim, Street', 3270, N'(02) 9627 1842', 14, 19, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (59, N'71086324', 1, N'Stewart', 1, N'9958 Justo Road', 4679, N'(02) 0756 6033', 14, 20, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (60, N'60559138', 2, N'Axel', 1, N'Ap #258-9843 Erat Rd.', 2862, N'(07) 3628 5306', 18, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (61, N'60220231', 1, N'Abel', 2, N'2343 Nec, Street', 2198, N'(02) 4688 6551', 19, 16, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (62, N'39744395', 1, N'Berk', 2, N'P.O. Box 280, 5657 A, Ave', 1661, N'(02) 5814 6480', 17, 19, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (63, N'23171597', 1, N'Alan', 1, N'6425 Mollis St.', 1424, N'(02) 5200 8091', 15, 10, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (64, N'42991379', 1, N'Keane', 2, N'P.O. Box 972, 8729 At Av.', 2028, N'(05) 3409 1550', 20, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (65, N'39184924', 1, N'Kaseem', 1, N'P.O. Box 187, 3952 Sit Street', 1524, N'(05) 3494 6872', 20, 19, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (66, N'44019677', 2, N'Melvin', 2, N'P.O. Box 966, 6292 Faucibus Rd.', 2563, N'(08) 4657 8062', 12, 17, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (67, N'30634661', 1, N'Amery', 1, N'P.O. Box 199, 9697 At, Street', 3893, N'(05) 5017 7151', 19, 20, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (68, N'63754243', 1, N'Garrison', 2, N'212-4140 Neque. St.', 4817, N'(08) 4003 7897', 19, 20, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (69, N'71359638', 1, N'David', 2, N'1852 A, Street', 4538, N'(03) 0439 0920', 14, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (70, N'30747789', 2, N'James', 1, N'P.O. Box 850, 8020 Eu, Rd.', 426, N'(07) 7953 4411', 20, 11, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (71, N'31920327', 1, N'Reese', 2, N'5133 Mollis St.', 5085, N'(04) 0375 1973', 20, 17, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (72, N'26112327', 2, N'Jackson', 2, N'Ap #358-8043 Quisque Street', 4718, N'(06) 1744 3299', 16, 20, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (73, N'31297081', 1, N'Timon', 2, N'8890 Arcu Ave', 1847, N'(08) 9000 7504', 12, 16, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (74, N'52751514', 1, N'Charles', 2, N'Ap #256-3475 Metus. St.', 1413, N'(01) 6343 1129', 11, 12, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (75, N'79300162', 1, N'Lewis', 2, N'5757 Et St.', 2599, N'(02) 4435 3517', 10, 10, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (76, N'38187011', 1, N'Ulric', 2, N'P.O. Box 435, 2603 At, Avenue', 5896, N'(04) 2313 0217', 12, 14, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (77, N'57141682', 2, N'Jacob', 2, N'879-8637 Felis Rd.', 608, N'(06) 9119 1573', 12, 11, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (78, N'51938091', 1, N'Talon', 1, N'Ap #502-1122 Mauris Road', 5843, N'(09) 9030 2532', 15, 14, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (79, N'79550249', 1, N'Yoshio', 2, N'Ap #979-1839 Nec, Rd.', 703, N'(02) 2599 0146', 18, 18, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (80, N'58928355', 2, N'Malcolm', 2, N'672-1027 Eget Street', 1463, N'(05) 6446 1404', 15, 20, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (81, N'39149852', 2, N'Samson', 2, N'796 Elit. St.', 1233, N'(06) 8680 9007', 13, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (82, N'36929841', 2, N'Randall', 2, N'P.O. Box 550, 8110 Nunc Ave', 4160, N'(05) 9682 9725', 15, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (83, N'48727220', 1, N'Callum', 1, N'Ap #780-5580 In Avenue', 2007, N'(02) 3278 1350', 17, 10, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (84, N'51589085', 2, N'Burton', 2, N'Ap #657-7117 Vulputate, St.', 5542, N'(09) 9163 8420', 10, 16, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (85, N'50643450', 2, N'Ronan', 1, N'7643 Nec Avenue', 5833, N'(01) 1831 5947', 12, 17, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (86, N'78624744', 1, N'Kennedy', 2, N'596-9111 Molestie. Street', 1613, N'(02) 5861 3236', 20, 13, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (87, N'56324303', 2, N'Chancellor', 2, N'698-7304 Nulla. Rd.', 4599, N'(07) 5495 2849', 14, 15, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (88, N'32102162', 1, N'Steven', 1, N'P.O. Box 451, 7524 Lacus. Rd.', 5551, N'(07) 8848 4252', 16, 17, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (89, N'54555138', 1, N'Gage', 1, N'4562 Consectetuer Rd.', 2506, N'(08) 7713 4913', 13, 18, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (90, N'53125431', 2, N'Alan', 2, N'967-2656 Consequat St.', 5610, N'(02) 5613 8858', 15, 20, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (91, N'76776712', 1, N'Jameson', 1, N'5191 Diam Road', 2628, N'(07) 6043 1125', 12, 12, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (92, N'53999018', 2, N'Timon', 2, N'Ap #983-1447 Ut, Rd.', 193, N'(07) 8186 7626', 14, 17, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (93, N'27532643', 2, N'Caesar', 2, N'702-1301 Proin Street', 2910, N'(05) 5613 2757', 15, 15, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (94, N'70804428', 2, N'Clarke', 1, N'P.O. Box 309, 6279 Neque Street', 2697, N'(09) 2587 3345', 18, 19, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (95, N'76062942', 2, N'Bradley', 1, N'Ap #983-6648 Ac, Rd.', 4643, N'(06) 0916 4899', 12, 15, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (96, N'50364908', 1, N'Dane', 2, N'315-321 Duis St.', 780, N'(01) 2062 1682', 10, 16, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (97, N'70417671', 2, N'Wang', 2, N'Ap #911-5394 Maecenas Avenue', 5434, N'(05) 9350 0022', 13, 10, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (98, N'44279002', 1, N'Bradley', 1, N'P.O. Box 906, 6206 Et Ave', 3053, N'(07) 3119 8969', 19, 20, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (99, N'77053843', 2, N'Chaim', 2, N'9627 Egestas Avenue', 4406, N'(04) 0969 6479', 10, 20, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (100, N'36334148', 2, N'Lamar', 1, N'3277 Varius Street', 2605, N'(05) 6563 9592', 16, 12, CAST(N'2019-11-02T16:42:16.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (106, N'34578804', 1, N'Cristian', 2, N'Gaona', 1264, N'+5411 30864925', 19891408, 0, CAST(N'2019-11-03T13:06:59.290' AS DateTime), CAST(N'2019-11-03T13:37:03.810' AS DateTime), 1)
GO
INSERT [dbo].[Users] ([Id], [Document], [DocumentType], [Name], [Gender], [Address], [AddressNumber], [Phone], [BirthDate], [DateIndex], [DateCreation], [DateModification], [Valid]) VALUES (107, N'35669988', 2, N'Fede', 1, N'Calle Falsa', 123, N'1122334455', 19890101, 0, CAST(N'2019-11-06T00:09:44.140' AS DateTime), CAST(N'2019-11-06T00:10:52.640' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Bills] ADD  CONSTRAINT [DF_Bills_DateCreation]  DEFAULT (getdate()) FOR [DateCreation]
GO
ALTER TABLE [dbo].[Bills] ADD  CONSTRAINT [DF_Bills_Valid]  DEFAULT ((1)) FOR [Valid]
GO
ALTER TABLE [dbo].[BillsCharges] ADD  CONSTRAINT [DF_BillsCharge_DateCreation]  DEFAULT (getdate()) FOR [DateCreation]
GO
ALTER TABLE [dbo].[BillsCharges] ADD  CONSTRAINT [DF_BillsCharge_Valid]  DEFAULT ((1)) FOR [Valid]
GO
ALTER TABLE [dbo].[Charges] ADD  CONSTRAINT [DF_Charges_DateCreation]  DEFAULT (getdate()) FOR [DateCreation]
GO
ALTER TABLE [dbo].[Charges] ADD  CONSTRAINT [DF_Charges_Valid]  DEFAULT ((1)) FOR [Valid]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateCreation]  DEFAULT (getdate()) FOR [DateCreation]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Enabled]  DEFAULT ((1)) FOR [Valid]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  StoredProcedure [dbo].[Bills_ADD]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Inserts a new Charge in the table
-- =============================================
CREATE PROCEDURE [dbo].[Bills_ADD]
    
         @IdUser                 INT
		,@BillNumber             INT
        ,@DateIndex              INT

AS
BEGIN
	     SET NOCOUNT ON;

		 INSERT INTO Bills (IdUser
		                   ,BillNumber
		                   ,DateIndex)

		 VALUES  (@IdUser
		         ,@BillNumber
		         ,@DateIndex)

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Bills_GetById]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Get the Bill selected by Id
-- =============================================
CREATE PROCEDURE [dbo].[Bills_GetById]

         @Id                  INT

AS
BEGIN
	     SET NOCOUNT ON;

         SELECT * 
		 FROM Bills 
		 WHERE Id= @Id

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[BillsCharges_ADD]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Inserts a new Charge in the table
-- =============================================
CREATE PROCEDURE [dbo].[BillsCharges_ADD]
    
         @IdBill             INT
        ,@IdCharge           INT
		,@DateIndex          INT

AS
BEGIN
	     SET NOCOUNT ON;

		 INSERT INTO BillsCharges(IdBill
		                         ,IdCharge
							     ,DateIndex)

		 VALUES  (@IdBill
		         ,@IdCharge
				 ,@DateIndex)

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[BillsCharges_GetByBills]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Get the charge selected by Id
-- =============================================
CREATE PROCEDURE [dbo].[BillsCharges_GetByBills]

         @Id                  INT

AS
BEGIN
	     SET NOCOUNT ON;

         SELECT * 
		 FROM BillsCharges 
		 WHERE IdBill= @Id

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Charges_ADD]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Inserts a new Charge in the table
-- =============================================
CREATE PROCEDURE [dbo].[Charges_ADD]
    
         @EventId             INT
        ,@Amount              INT
		,@DateIndex           INT

AS
BEGIN
	     SET NOCOUNT ON;

		 INSERT INTO Charges (IdEvent
		                     ,Amount
							 ,DateIndex)

		 VALUES  (@EventId
		         ,@Amount
				 ,@DateIndex)

	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[Charges_GetById]    Script Date: 06/11/2019 0:16:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Zappala Cristian
-- Create date: 02/11/2019
-- Description:	Get the charge selected by Id
-- =============================================
CREATE PROCEDURE [dbo].[Charges_GetById]

         @Id                  INT

AS
BEGIN
	     SET NOCOUNT ON;

         SELECT * 
		 FROM Charges 
		 WHERE Id= @Id

	SELECT SCOPE_IDENTITY();
END
GO
