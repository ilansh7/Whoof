USE [DoggyStyle]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Manager')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'User')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [IdNumber], [UserName], [Password], [eMail], [BirthDate]) VALUES (1, N'Ilan', N'Shchori', N'012/0', N'IlanSh7', N'7110EDA4D09E062AA5E4A390B0A572AC0D2C0220', N'ilan.shchori@gmail.com', CAST(N'1965-02-13' AS Date))
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [IdNumber], [UserName], [Password], [eMail], [BirthDate]) VALUES (2, N'User', N'User', N'12345678-9', N'User', N'86F7E437FAA5A7FCE15D1DDCB9EAEAEA377667B8', NULL, CAST(N'2001-01-18' AS Date))
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [IdNumber], [UserName], [Password], [eMail], [BirthDate]) VALUES (3, N'Admin', N'Admin', N'123/002', N'Admin', N'86F7E437FAA5A7FCE15D1DDCB9EAEAEA377667B8', N'abc@def.com', NULL)
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [IdNumber], [UserName], [Password], [eMail], [BirthDate]) VALUES (4, N'Manager', N'Manager', N'0001', N'Manager', N'86F7E437FAA5A7FCE15D1DDCB9EAEAEA377667B8', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (1, 1)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (1, 2)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (1, 3)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (2, 3)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (3, 1)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (3, 2)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (3, 3)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (4, 2)
GO
INSERT [dbo].[UserVsRoles] ([UserID], [RoleID]) VALUES (4, 3)
GO
USE [CarRental]
GO
SET IDENTITY_INSERT [dbo].[EventExtention] ON 
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (1, N'AppointmentSlot', NULL, N'09:00', NULL, NULL, NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (2, N'AppointmentSlot', NULL, N'10:00', NULL, NULL, NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (3, N'AppointmentSlot', NULL, N'11:00', NULL, NULL, NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (4, N'AppointmentSlot', NULL, N'12:00', NULL, NULL, NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (5, N'AppointmentSlot', NULL, N'13:00', NULL, NULL, NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (6, N'AppointmentSlot', NULL, N'14:00', NULL, NULL, NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (7, N'AppointmentSlot', NULL, N'15:00', NULL, NULL, NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (8, N'AppointmentSlot', NULL, N'16:00', NULL, NULL, NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (9, N'AppointmentSlot', NULL, N'17:00', NULL, NULL, NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (10, N'Treatment', NULL, N'AntiFleas Treatment', NULL, CAST(1.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (11, N'Treatment', NULL, N'Hair Cut', NULL, CAST(1.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (12, N'Treatment', NULL, N'Franch Manicure', NULL, CAST(2.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (13, N'Treatment', NULL, N'Nails Trim', NULL, CAST(0.50 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (14, N'Treatment', NULL, N'Euthanasia', NULL, CAST(0.50 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (15, N'DogBread', NULL, N'Afghan Hound', NULL, NULL, NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (16, N'DogBread', NULL, N'American Bulldog', NULL, NULL, NULL)
GO
INSERT [dbo].[EventExtention] ([EventExtentionId], [Type], [Description], [Ext_String_1], [Ext_String_2], [Ext_Numeric_1], [Ext_Date_1]) VALUES (17, N'DogBread', NULL, N'American Pit Bull Terrier', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[EventExtention] OFF
GO
