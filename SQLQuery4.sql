set ansi_nulls on
go
set ansi_padding on
go
set quoted_identifier on
go

create database [Test_Cargo2]
go

use [Test_Cargo2]
go

create table [dbo].[License]
(
	[ID_License] [int] not null identity(1,1),
	[Type_License] [varchar] (10) not null
	constraint [PK_License] primary key clustered
	([ID_License] ASC) on [PRIMARY],
	constraint [UQ_Type_License] unique ([Type_License])
)
go

create or alter procedure [dbo].[License_Insert]
@Type_License [varchar] (10)
as
declare @exsist [int] = (select count(*) from
[dbo].[License]
where [Type_License] = @Type_License)
if (@exsist > 0)
print('������ � ������ ��� ���������� � �������')
else
insert into [dbo].[License] ([Type_License])
values (@Type_License)
go

create or alter procedure [dbo].[License_Update]
@ID_License [int], @Type_License [varchar] (10)
as 
	declare @exsist [int] = (select count(*) from
[dbo].[License]
where [Type_License] = @Type_License)
if (@exsist > 0)
print('������ � ������ ��� ���� � �������')
else
update [dbo].[License] set
[Type_License] = @Type_License
where
[ID_License] = @ID_License
go

create or alter procedure [dbo].[License_Delete]
@ID_License [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[License]
	where [ID_License] = @ID_License)
	if (@any_child_record > 0)
	print('����� �� ����� ���� ������� ��� ��� � ������� 
	"����� ����������" ���� ��������� ������!')
	else 
	delete from [dbo].[License]
		where 
		[ID_License] = @ID_License
go

insert into [dbo].[License] ([Type_License])
values ('A'), ('B'), ('C')
go

select [Type_License] as '���������' from [dbo].[License]
order by [Type_License] ASC
go

update [dbo].[License] set [Type_License] = 'D'
where [ID_License] = 2
go

delete [dbo].[License] where [ID_License] = 1
go

create table [dbo].[Type_Organization]
(
	[ID_Type_Organization] [int] not null identity(1,1),
	[Type_Name] [varchar] (max) not null
	constraint [PK_Type_Organization] primary key clustered
	([ID_Type_Organization] ASC) on [PRIMARY]
)
go

create or alter procedure [dbo].[Type_Organization_Insert]
@Type_Name [varchar] (max)
as
	begin try 
	insert into [Type_Organization] ([Type_Name])
	values (@Type_Name)
	end try 
	begin catch 
	print('������ ��� ����� ���� �����������')
	end catch
go



create or alter procedure [dbo].[Type_Organization_Update]
@ID_Type_Organization [int], @Type_Name [varchar] (max)
as 
	begin try 
	update [dbo].[Type_Organization] set 
	[Type_Name] = @Type_Name
	where 
		[ID_Type_Organization] = @ID_Type_Organization
	end try 
	begin catch 
	print ('������ ��� ����� ������ � ������� ��� �����������!')
	end catch
go


create or alter procedure [dbo].[Type_Organization_Delete]
@ID_Type_Organization [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Type_Organization]
	where [ID_Type_Organization] = @ID_Type_Organization)
	if (@any_child_record > 0)
	print('��� ����������� �� ����� ���� ������� ��� ��� � ������� 
	"���������", "�����������" ���� ��������� ������!')
	else 
	delete from [dbo].[Type_Organization]
		where 
		[ID_Type_Organization] = @ID_Type_Organization
go

delete [dbo].[Type_Organization] where [ID_Type_Organization] = 1
select * from dbo.Type_Organization where [ID_Type_Organization] = 1
--update [dbo].[Type_Organization] set [Type_Name] = '' where [ID_Type_Organization] = 


insert into [dbo].[Type_Organization] ([Type_Name]) 
values ('���'), ('����'), ('���')
go

select [Type_Name] as '��� �����������' from [dbo].[Type_Organization]
order by [Type_Name] ASC
go

create table [dbo].[Brand]
(
	[ID_Brand] [int] not null identity(1,1),
	[Name_Brand] [varchar] (50) not null
	constraint [PK_Brand] primary key clustered
	([ID_Brand] ASC) on [PRIMARY],
	constraint [UQ_Name_Brand] unique ([Name_Brand])
)
go

create or alter procedure [dbo].[Brand_Insert]
@Name_Brand [varchar] (50)
as
declare @exsist [int] = (select count(*) from
[dbo].[Brand]
where [Name_Brand] = @Name_Brand)
if (@exsist > 0)
print('������ � ����� ��� ���������� � �������')
else
insert into [dbo].[Brand] ([Name_Brand])
values (@Name_Brand)
go

create or alter procedure [dbo].[Brand_Update]
@ID_Brand [int], @Name_Brand [varchar] (50)
as 
	declare @exsist [int] = (select count(*) from
[dbo].[Brand]
where [Name_Brand] = @Name_Brand)
if (@exsist > 0)
print('������ � ������ ��� ���� � �������')
else
update [dbo].[Brand] set
[Name_Brand] = @Name_Brand
where
[ID_Brand] = @ID_Brand
go

create or alter procedure [dbo].[Brand_Delete]
@ID_Brand [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Brand]
	where [ID_Brand] = @ID_Brand)
	if (@any_child_record > 0)
	print('����� �� ����� ���� ������� ��� ��� � ������� 
	"������" ���� ��������� ������!')
	else 
	delete from [dbo].[Brand]
		where 
		[ID_Brand] = @ID_Brand
go

insert into [dbo].[Brand] ([Name_Brand])
values ('Man'), ('Volvo')
go

select [Name_Brand] as '�����' from [dbo].[Brand]
order by [Name_Brand] DESC
go

create table [dbo].[Delivery_Points]
(
	[ID_Delivery_Point] [int] not null identity(1,1),
	[Delivery_Address] [varchar] (max) not null
	constraint [PK_Delivery_Point] primary key clustered
	([ID_Delivery_Point] ASC) on [PRIMARY]
)
go

create or alter procedure [dbo].[Delivery_Points_Insert]
@Delivery_Address [varchar] (max)
as
	begin try 
	insert into [Delivery_Points] ([Delivery_Address])
	values (@Delivery_Address)
	end try 
	begin catch 
	print('������ ��� ����� ����� ��������')
	end catch
go



create or alter procedure [dbo].[Delivery_Points_Update]
@ID_Delivery_Points [int], @Delivery_Address [varchar] (max)
as 
	begin try 
	update [dbo].[Delivery_Points] set 
	[Delivery_Address] = @Delivery_Address
	where 
		[ID_Delivery_Point] = @ID_Delivery_Points
	end try 
	begin catch 
	print ('������ ��� ����� ������ � ������� ����� ��������!')
	end catch
go


create or alter procedure [dbo].[Delivery_Points_Delete]
@ID_Delivery_Points [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Delivery_Points]
	where [ID_Delivery_Point] = @ID_Delivery_Points)
	if (@any_child_record > 0)
	print('����� �������� �� ����� ���� ������� ��� ��� � ������� 
	"����� ����������� �����" ���� ��������� ������!')
	else 
	delete from [dbo].[Delivery_Points]
		where 
		[ID_Delivery_Point] = @ID_Delivery_Points
go

insert into [dbo].[Delivery_Points] ([Delivery_Address])
values ('��. �����������, �. 3, ���. 4'), ('��. ���������, �. 8, �. 5'), ('��. �����������, �. 6, �. 3'), ('��. �����, �. 8, �. 3'), ('��. �����, �. 1, ���. 3')
go

select [Delivery_Address] as '����� ����� ��������' from [dbo].[Delivery_Points]
order by [Delivery_Address] ASC
go

create table [dbo].[Post]
(
	[ID_Post] [int] not null identity(1,1),
	[Name_Post] [varchar] (50) not null
	constraint [PK_Post] primary key clustered
	([ID_Post] ASC) on [PRIMARY],
	constraint [UQ_Name_Post] unique ([Name_Post])
)
go

create or alter procedure [dbo].[Post_Insert]
@Name_Post [varchar] (50)
as
declare @exsist [int] = (select count(*) from
[dbo].[Post]
where [Name_Post] = @Name_Post)
if (@exsist > 0)
print('������ � ���������� ��� ���������� � �������')
else
insert into [dbo].[Post] ([Name_Post])
values (@Name_Post)
go

create or alter procedure [dbo].[Post_Update]
@ID_Post [int], @Name_Post [varchar] (10)
as 
	declare @exsist [int] = (select count(*) from
[dbo].[Post]
where [Name_Post] = @Name_Post)
if (@exsist > 0)
print('������ � ���������� ��� ���� � �������')
else
update [dbo].[Post] set
[Name_Post] = @Name_Post
where
[ID_Post] = @ID_Post
go

create or alter procedure [dbo].[Post_Delete]
@ID_Post [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Post]
	where [ID_Post] = @ID_Post)
	if (@any_child_record > 0)
	print('����� �� ����� ���� ������� ��� ��� � ������� 
	"����� ����������" ���� ��������� ������!')
	else 
	delete from [dbo].[Post]
		where 
		[ID_Post] = @ID_Post
go

insert into [dbo].[Post] ([Name_Post])
values ('��������'),('�������� �� �������'),('�������� �� ��������'),('��������')
go

select [Name_Post] as '���������' from [dbo].[Post]
order by [Name_Post] ASC
go

create table [dbo].[Country]
(
	[ID_Country] [int] not null identity(1,1),
	[Name_Country] [varchar] (50) not null
	constraint [PK_Country] primary key clustered
	([ID_Country] ASC) on [PRIMARY],
	constraint [UQ_Name_Country] unique ([Name_Country])
)
go

create or alter procedure [dbo].[Country_Insert]
@Name_Country [varchar] (50)
as
declare @exsist [int] = (select count(*) from [dbo].[Country] where [Name_Country] = @Name_Country)
if (@exsist > 0)
begin
	print('������ � ������ ��� ���������� � �������')
end
else
begin
	insert into [dbo].[Country] ([Name_Country])
	values (@Name_Country)
end
go

create or alter procedure [dbo].[Country_Update]
@ID_Country [int], @Name_Country [varchar] (50)
as 
	declare @exsist [int] = (select count(*) from [dbo].[Country] where [Name_Country] = @Name_Country)
if (@exsist > 0)
begin
print('������ � ������ ��� ���� � �������')
end
else
begin
update [dbo].[Country] set
[Name_Country] = @Name_Country
where
[ID_Country] = @ID_Country
end
go

create or alter procedure [dbo].[Country_Delete]
@ID_Country [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Country]
	where [ID_Country] = @ID_Country)
	if (@any_child_record > 0)
	begin
		print('������ �� ����� ���� ������� ��� ��� � ������� "������ ����������" ���� ��������� ������!')
	end
	else 
	begin
		delete from [dbo].[Country] where [ID_Country] = @ID_Country
	end
go

insert into [dbo].[Country] ([Name_Country])
values ('��������'), ('�������')
go

select [Name_Country] as '���������' from [dbo].[Country]
order by [Name_Country] ASC
go

create table [dbo].[Cargo]
(
	[ID_Cargo] [int] not null identity(1,1),
	[Description_Cargo] [varchar] (max) not null,
	[Weight_Cargo] [varchar] (8) not null,
	[Length_Cargo] [varchar] (8) not null,
	[Width_Cargo] [varchar] (8) not null,
	[Height_Cargo] [varchar] (8) not null
	constraint [PK_Cargo] primary key clustered
	([ID_Cargo] ASC) on [PRIMARY],
	constraint [CH_Weight_Cargo] check ([Weight_Cargo] like ('[0-9][0-9][0-9]')
	or [Weight_Cargo] like ('[0-9][0-9][0-9][0-9]') or [Weight_Cargo] like ('[0-9][0-9][0-9][0-9][0-9]')),
	constraint [CH_Length_Cargo] check ([Length_Cargo] like ('[0-9][0-9][0-9]')
	or [Length_Cargo] like ('[0-9][0-9][0-9][0-9]') or [Length_Cargo] like ('[0-9][0-9][0-9][0-9][0-9]')),
	constraint [CH_Width_Cargo] check ([Width_Cargo] like ('[0-9][0-9][0-9]')
	or [Width_Cargo] like ('[0-9][0-9][0-9][0-9]') or [Width_Cargo] like ('[0-9][0-9][0-9][0-9][0-9]')),
	constraint [CH_Height_Cargo] check ([Height_Cargo] like ('[0-9][0-9][0-9]')
	or [Height_Cargo] like ('[0-9][0-9][0-9][0-9]') or [Height_Cargo] like ('[0-9][0-9][0-9][0-9][0-9]'))
)	
go

create or alter procedure [dbo].[Cargo_Insert]
@Description_Cargo [varchar] (max), @Weight_Cargo [varchar] (8), @Length_Cargo [varchar] (8), @Width_Cargo [varchar] (8), @Height_Cargo [varchar] (8)
as
	begin try 
		insert into [Cargo] ([Description_Cargo], [Weight_Cargo], [Length_Cargo], [Width_Cargo], [Height_Cargo])
		values (@Description_Cargo, @Weight_Cargo, @Length_Cargo, @Width_Cargo, @Height_Cargo)
	end try 
	begin catch 
		print('������ ��� ����� ������ � ������� ����')
	end catch
go

create or alter procedure [dbo].[Cargo_Update]
@ID_Cargo [int], @Description_Cargo [varchar] (max), @Weight_Cargo [varchar] (8), @Length_Cargo [varchar] (8), @Width_Cargo [varchar] (8), @Height_Cargo [varchar] (8)
as 
	begin try 
	update [dbo].[Cargo] set 
	[Description_Cargo] = @Description_Cargo,
	[Weight_Cargo] = @Weight_Cargo,
	[Length_Cargo] = @Length_Cargo,
	[Width_Cargo] = @Width_Cargo,
	[Height_Cargo] = @Height_Cargo
	where 
		[ID_Cargo] = @ID_Cargo
	end try 
	begin catch 
	print ('������ ��� ����� ������ � ������� ����!')
	end catch
go

create or alter procedure [dbo].[Cargo_Delete]
@ID_Cargo [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Cargo]
	where [ID_Cargo] = @ID_Cargo)
	if (@any_child_record > 0)
	begin
	print('���� �� ����� ���� ������ ��� ��� � ������� 
	"������ �����" ���� ��������� ������!')
	end
	else
	begin
	delete from [dbo].[Cargo]
		where 
		[ID_Cargo] = @ID_Cargo
	end
go

insert into [dbo].[Cargo] ([Description_Cargo], [Weight_Cargo], [Length_Cargo], [Width_Cargo], [Height_Cargo])
values ('��������', '4000', '1000', '2000', '1000'), ('���������', '1000', '8000', '2000', '1000'),
('���������', '1000', '8000', '2000', '1000'), ('��������', '4000', '1000', '2000', '1000'), ('��������', '4000', '1000', '2000', '1000')
go

select [Description_Cargo] as '��������', [Weight_Cargo] as '���', [Length_Cargo]+' '+[Width_Cargo]+' '+[Height_Cargo] as '��������' from [dbo].[Cargo]
order by [Description_Cargo] ASC
go

create table [dbo].[Model]
(
	[ID_Model] [int] not null identity(1,1),
	[Name_Model] [varchar] (50) not null,
	[Brand_ID] [int] not null
	constraint [PK_Model] primary key clustered
	([ID_Model] ASC) on [PRIMARY],
	constraint [UQ_Name_Model] unique ([Name_Model]),
	constraint [FK_Brand_Model] foreign key ([Brand_ID])
	references [dbo].[Brand] ([ID_Brand])
)
go

create or alter procedure [dbo].[Model_Insert]
@Name_Model [varchar] (50)
as
declare @exsist [int] = (select count(*) from
[dbo].[License]
where [Type_License] = @Type_License)
if (@exsist > 0)
print('������ � ������ ��� ���������� � �������')
else
insert into [dbo].[License] ([Type_License])
values (@Type_License)
go

create or alter procedure [dbo].[License_Update]
@ID_License [int], @Type_License [varchar] (10)
as 
	declare @exsist [int] = (select count(*) from
[dbo].[License]
where [Type_License] = @Type_License)
if (@exsist > 0)
print('������ � ������ ��� ���� � �������')
else
update [dbo].[License] set
[Type_License] = @Type_License
where
[ID_License] = @ID_License
go

create or alter procedure [dbo].[License_Delete]
@ID_License [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[License]
	where [ID_License] = @ID_License)
	if (@any_child_record > 0)
	print('����� �� ����� ���� ������� ��� ��� � ������� 
	"����� ����������" ���� ��������� ������!')
	else 
	delete from [dbo].[License]
		where 
		[ID_License] = @ID_License
go

insert into [dbo].[Model] ([Name_Model], [Brand_ID])
values ('F2000', 1), ('FL7', 2)
go

select [Name_Model] as '������', [Name_Brand] as '�����'  from [dbo].[Model]
inner join [dbo].[Brand] on [ID_Brand] = [Brand_ID]
go

--select [Name_Model] as '������', [Name_Brand] as '�����'  from [dbo].[Model]
--inner join [dbo].[Brand] on [ID_Brand] = [Brand_ID]
--where [Name_Brand] = '���'
--go

--select [ID_Model], [Name_Brand] from [dbo].[Brand] inner join [dbo].[Model] on ID_Brand = ID_Model

--create table [dbo].[Transport]
--(
--	[ID_Transport] [int] not null identity(1,1),
--	[Length_Transport] [varchar] (8) not null,
--	[Width_Transport] [varchar] (8) not null,
--	[Height_Transport] [varchar] (8) not null,
--	[Load_Copacity] [varchar] (8) not null,
--	[Copacity] [varchar] (9) not null,
--	[Number_Transport] [varchar] (10) not null,
--	[Model_ID] [int] not null
--	constraint [PK_Transport] primary key clustered
--	([ID_Transport] ASC) on [PRIMARY],
--	constraint [CH_Length_Transport] check ([Length_Transport] like ('[0-9][0-9][0-9][0-9] ��')),
--	constraint [CH_Width_Transport] check ([Width_Transport] like ('[0-9][0-9][0-9][0-9] ��')),
--	constraint [CH_Height_Transport] check ([Height_Transport] like ('[0-9][0-9][0-9][0-9] ��')),
--	constraint [CH_Load_Copacity] check ([Load_Copacity] like ('[0-9][0-9][0-9][0-9] ��')
--	or [Load_Copacity] like ('[0-9][0-9][0-9][0-9][0-9] ��')),
--	constraint [CH_Copacity] check ([Copacity] like ('[0-9][0-9] ���. �')),
--	constraint [CH_Number_Transport] check ([Number_Transport] like ('[�-�][0-9][0-9][0-9][�-�][�-�]-[0-9][0-9]')
--	or [Number_Transport] like ('[�-�][0-9][0-9][0-9][�-�][�-�]-[0-9][0-9][0-9]')),
--	constraint [UQ_Number_Transport] unique ([Number_Transport]),
--	constraint [FK_Model_Transport] foreign key ([Model_ID])
--	references [dbo].[Model] ([ID_Model])
--)
--go

--select ID_Model, Name_Brand from [dbo].[Brand] inner join [dbo].[Model] on ID_Model = Brand_ID
--go

--select [Brand_ID], [Name_Brand], [Name_Model] from [dbo].[Model]
--inner join [dbo].Brand on Brand_ID = ID_Brand
--go

--insert into [dbo].[Transport] ([Model_ID], [Length_Transport],[Width_Transport],[Height_Transport],[Load_Copacity],[Copacity],[Number_Transport])
--values (1, '8584 ��', '2300 ��', '2740 ��', '8000 ��', '43 ���. �', '�232��-78'), (2, '9340 ��', '2300 ��', '3650 ��', '9000 ��', '45 ���. �', '�003��-102'),
--(3, '6373 ��', '2513 ��', '2175 ��', '4600 ��', '29 ���. �', '�831��-161'), (3, '6373 ��', '2513 ��', '2175 ��', '4600 ��', '29 ���. �', '�715��-161'),
--(3, '6373 ��', '2513 ��', '2175 ��', '4600 ��', '29 ���. �', '�512��-78')
--go

--select [Length_Transport]+' '+[Width_Transport]+' '+[Height_Transport] as '��������', [Load_Copacity] as '����������������', [Copacity] as '�����������', 
--[Number_Transport] as '�����', [Name_Model] as '������' from [dbo].[Transport]
--inner join [dbo].[Model] on [ID_Model] = [Model_ID]
--go

--select * from [dbo].[Transport]
--inner join [dbo].[Model] on [ID_Model] = [Model_ID]
--go

create table [dbo].[Transport] 
(
	[ID_Transport] [int] not null identity(1,1),
	[Length_Transport] [varchar] (8) not null,
	[Width_Transport] [varchar] (8) not null,
	[Height_Transport] [varchar] (8) not null,
	[Load_Copacity] [varchar] (8) not null,
	[Copacity] [varchar] (9) not null,
	[Number_Transport] [varchar] (10) not null,
	[Model_ID] [int] not null
	constraint [PK_Transport] primary key clustered
	([ID_Transport] ASC) on [PRIMARY],
	constraint [CH_Length_Transport] check ([Length_Transport] like ('[0-9][0-9][0-9][0-9]')),
	constraint [CH_Width_Transport] check ([Width_Transport] like ('[0-9][0-9][0-9][0-9]')),
	constraint [CH_Height_Transport] check ([Height_Transport] like ('[0-9][0-9][0-9][0-9]')),
	constraint [CH_Load_Copacity] check ([Load_Copacity] like ('[0-9][0-9][0-9][0-9]')
	or [Load_Copacity] like ('[0-9][0-9][0-9][0-9][0-9]')),
	constraint [CH_Copacity] check ([Copacity] like ('[0-9][0-9]')),
	constraint [CH_Number_Transport] check ([Number_Transport] like ('[�-�][0-9][0-9][0-9][�-�][�-�]')),
	constraint [UQ_Number_Transport] unique ([Number_Transport]),
	constraint [FK_Model_Transport] foreign key ([Model_ID])
	references [dbo].[Model] ([ID_Model])
)
go

create or alter procedure [dbo].[Transport_Insert] 
@Length_Transport [varchar] (8), @Width_Transport [varchar] (8), @Height_Transport [varchar] (8), @Load_Copacity [varchar] (8), @Copacity [varchar] (50), @Number_Transport [varchar] (10)
as
begin try
insert into [Transport] ([Length_Transport], [Width_Transport], [Height_Transport], [Load_Copacity], [Copacity], [Number_Transport])
values (@Length_Transport, @Width_Transport, @Height_Transport, @Load_Copacity, @Copacity, @Number_Transport)
end try
begin catch
print('������ ��� ����� ������ � ���������')
end catch
go


create or alter procedure [dbo].[Transport_Update]
@ID_Transport [int], @Length_Transport [varchar] (8), @Width_Transport [varchar] (8), @Height_Transport [varchar] (8), @Load_Copacity [varchar] (8), @Copacity [varchar] (50), @Number_Transport [varchar] (10)

as 
	begin try 
	update [dbo].[Transport] set 
	[Length_Transport] = @Length_Transport,
	[Width_Transport] = @Width_Transport,
	[Height_Transport] = @Height_Transport, 
	[Load_Copacity] = @Load_Copacity,
	[Copacity] = @Copacity,
	[Number_Transport] = @Number_Transport
	where 
		[ID_Transport] = @ID_Transport
	end try 
	begin catch 
	print ('������ ��� ����� �������� � ���������!')
	end catch
go

create or alter procedure [dbo].[Transport_Delete]
@ID_Transport [int]
as
	declare @any_child_record [int] = (select count(*) from [dbo].[Transport]
	where [ID_Transport] = @ID_Transport)
	if (@any_child_record > 0)
	print('��������� �� ����� ���� ������ ��� ��� � ������� 
	"���������� ����", "������ ����������" ���� ��������� ������!')
	else 
	delete from [dbo].[Transport]
		where 
		[ID_Transport] = @ID_Transport
go


insert into [dbo].[Transport] ([Model_ID], [Length_Transport],[Width_Transport],[Height_Transport],[Load_Copacity],[Copacity],[Number_Transport])
values (1, '2342', '2342', '2342', '9000', '55', '�213��'), (2, '3211', '3223', '1115', '7000', '44', '�058��'),
(2, '3211', '3223', '1115', '7000', '44', '�824��'), (1, '2342', '2342', '2342', '9000', '55', '�595��'),
(1, '2342', '2342', '2342', '9000', '55', '�995��')
go

select [Length_Transport]+' '+[Width_Transport]+' '+[Height_Transport] as '��������', [Load_Copacity] as '����������������', [Copacity] as '�����������', 
[Number_Transport] as '�����', [Name_Model] as '������' from [dbo].[Transport]
inner join [dbo].[Model] on [ID_Model] = [Model_ID]
go

create table [dbo].[Customer]
(
	[ID_Customer] [int] not null identity(1,1),
	[Name_Customer_Organization] [varchar] (50) not null,
	[Organization_Address] [varchar] (max) not null,
	[TIN] [varchar] (12) not null,
	[BIC] [varchar] (9) not null,
	[OKPO] [varchar] (8) not null,
	[Login_Customer] [varchar] (50) not null,
	[Password_Customer] [varchar] (32) not null,
	[Name_Customer] [varchar] (32) not null,
	[Surname_Customer] [varchar] (32) not null,
	[Lastname_Customer] [varchar] (32) null default('-'),
	[Type_Organization_ID] [int] not null
	constraint [PK_Customer] primary key clustered
	([ID_Customer] ASC) on [PRIMARY],
	constraint [CH_TIN] check 
	([TIN] like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
	constraint [UQ_TIN] unique ([TIN]),
	constraint [CH_BIC] check ([BIC] like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
	constraint [CH_OKPO] check ([OKPO] like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
	constraint [UQ_OKPO] unique ([OKPO]),
	constraint [CH_Login_Customer] check 
	(len([Login_Customer]) >=4),
	constraint [UQ_Login_Customer] unique ([Login_Customer]),
	constraint [CH_Password_Customer] check 
	(len([Password_Customer]) >=4),
	constraint [FK_Type_Organization_Customer] foreign key ([Type_Organization_ID])
	references [dbo].[Type_Organization] ([ID_Type_Organization])
)
go


insert into [dbo].[Customer] ([Type_Organization_ID], [Name_Customer_Organization], [Organization_Address], [TIN], [BIC], [OKPO],
[Login_Customer], [Password_Customer], [Name_Customer], [Surname_Customer], [Lastname_Customer])
values (3, '"���������"', '��. ������������, �. 3, ���. 3', '623874628773', '487238473', '00432445', 'Qwerty1', '1234567', '����', '������', '��������'),
(3, '"��������"', '��. ������������, �. 6, �. 1', '584638576223', '004342561', '21123156', 'Qwerty2', '1234567', '�����', '��������', '���������'),
(2, '"����� ��������������"', '��. ������������, �. 2, ���. 1', '464736767782', '000423213', '32847234', 'Qwerty3', '1234567', '���������', '������', '����������'),
(1, '"�-������"', '��. �����, �. 2, �. 6', '784738748772', '762314876', '00345343', 'Qwerty4', '1234567', '�������', '��������', '���������'),
(3, '"����-������"', '��. ��������, �. 13, �. 5', '723847282341', '594823589', '00232312', 'Qwerty5', '1234567', '���������', '�������', '������������')
go


select [Name_Customer]+' '+[Surname_Customer]+' '+[Lastname_Customer] as '��� ����������', [Login_Customer] as '�����', [Password_Customer] as '������',
[TIN] as '���', [BIC] as '���', [OKPO] as '����', [Type_Name] as '��� �����������', [Name_Customer_Organization] as '�������� �����������',
[Organization_Address] as '����� �����������' from [dbo].[Customer]
inner join [dbo].[Type_Organization] on [ID_Type_Organization] = [Type_Organization_ID]
go

create table [dbo].[Carrier]
(
	[ID_Carrier] [int] not null identity(1,1),
	[Name_Carrier] [varchar] (50) not null,
	[Type_Organization_ID] [int] not null
	constraint [PK_Carrier] primary key clustered
	([ID_Carrier] ASC) on [PRIMARY],
	constraint [UQ_Name_Carrier] unique ([Name_Carrier]),
	constraint [FK_Type_Organization_Carrier] foreign key ([Type_Organization_ID])
	references [dbo].[Type_Organization] ([ID_Type_Organization])
)
go

update [dbo].[Carrier] set [Type_Organization_ID] = 2 where [ID_Carrier] = 1
go

delete [dbo].[Carrier] where [ID_Carrier] = 2
go

insert into [dbo].[Carrier] ([Name_Carrier], [Type_Organization_ID])
values ('"��������-��������"', 1), ('"��������"', 3), ('"���������"', 2),
('"����������"', 3), (' "���������"', 3)
go

select [Name_Carrier] as '�������� �����������', [Type_Name] as '��� �����������' from [dbo].[Carrier]
inner join [dbo].[Type_Organization] on [ID_Type_Organization] = [Type_Organization_ID]
go

select [Name_Carrier] as '�������� �����������', [Type_Name] as '��� �����������' from [dbo].[Carrier]
inner join [dbo].[Type_Organization] on [ID_Type_Organization] = [Type_Organization_ID]
where [Type_Name] = '���' 
go

create table [dbo].[Employee]
(
	[ID_Employee] [int] not null identity(1,1),
	[Name_Employee] [varchar] (32) not null,
	[Surname_Employee] [varchar] (32) not null,
	[Lastname_Employee] [varchar] (32) null default('-'),
	[SNILS] [varchar] (14) not null,
	[FOMS] [varchar] (16) not null,
	[Login_Employee] [varchar] (50) not null,
	[Password_Employee] [varchar] (32) not null,
	[Carrier_ID] [int] not null
	constraint [PK_Employee] primary key clustered
	([ID_Employee] ASC) on [PRIMARY],
	constraint [UQ_SNILS] unique ([SNILS]),
	constraint [CH_SNILS] check
	([SNILS] like ('[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9] [0-9][0-9]')),
	constraint [UQ_FOMS] unique ([FOMS]),
	constraint [CH_FOMS] check
	([FOMS] like ('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
	constraint [UQ_Login_Employee] unique ([Login_Employee]),
	constraint [CH_Login_Employee] check (len([Login_Employee])>=8),
	constraint [CH_Password_Employee] check 
	(len([Password_Employee]) >=4),
	constraint [FK_Carrier_Employee] foreign key ([Carrier_ID])
	references [dbo].[Carrier] ([ID_Carrier])
)
go

update [dbo].[Employee] set [Name_Employee] = '������' where [ID_Employee] = 1
go

delete [dbo].[Employee] where [ID_Employee] = 1
go

insert into [dbo].[Employee] ([Name_Employee], [Surname_Employee], [Lastname_Employee], [SNILS], [FOMS], [Login_Employee], [Password_Employee], [Carrier_ID])
values ('��������', '�������', '���������', '155-144-737 00', '7849123112311240', 'Driver__1', '1234567', 1),
('�������', '��������', '����������', '152-512-232 00', '2384198471152980', 'Driver__2', '1234567', 2),
('����', '������', '��������', '124-512-535 00', '8712638716238760', 'Driver__3', '1234567', 3),
('����', '������', '��������', '654-412-123 00', '4739247392487910', 'Driver__4', '1234567', 4),
('�����', '������', '��������', '412-123-321 00', '3487162487619280', 'Driver__5', '1234567', 5)
go

select [Name_Employee]+' '+[Surname_Employee]+' '+[Lastname_Employee] as '��� ����������', [SNILS] as '�����', [FOMS] as '����', [Login_Employee] as '�����',
[Password_Employee] as '������', [Name_Carrier] as '�������� ����������� �����������' from [dbo].[Employee]
inner join [dbo].[Carrier] on [ID_Carrier] = [Carrier_ID]
go

create table [dbo].[Route_Sheet]
(
	[ID_Route_Sheet] [int] not null identity(1,1),
	[Number_Route_Sheet] [varchar] (max) not null,
	[Date_Route_Sheet] [date] not null default(getdate()),
	[Time_Route_Sheet] [time] not null default(getdate()),
	[Carrier_ID] [int] not null,
	[Transport_ID] [int] not null
	constraint [PK_Route_Sheet] primary key clustered
	([ID_Route_Sheet] ASC) on [PRIMARY],
	constraint [CH_Number_Route_Sheet] check
	([Number_Route_Sheet] like ('[0-9][0-9][0-9][0-9]-[0-9][0-9]')),
	constraint [FK_Carrier_Route_Sheet] foreign key ([Carrier_ID])
	references [dbo].[Carrier] ([ID_Carrier]),
	constraint [FK_Transport_Route_Sheet] foreign key ([Transport_ID])
	references [dbo].[Transport] ([ID_Transport]),
)
go

update [dbo].[Route_Sheet] set [Number_Route_Sheet] = '2372-22' where [ID_Route_Sheet] = 3
go

delete [dbo].[Route_Sheet] where [ID_Route_Sheet] = 5
go

insert into [dbo].[Route_Sheet] ([Number_Route_Sheet], [Date_Route_Sheet], [Time_Route_Sheet], [Carrier_ID], [Transport_ID])
values ('0001-21', Convert(date, '24.12.2021'), Convert(time, '17:43:00'), 1, 1),
('0002-21', Convert(date, '28.12.2021'), Convert(time, '18:22:00'), 2, 2),
('0003-22', Convert(date, '01.01.2022'), Convert(time, '05:23:00'), 3, 3),
('0004-22', Convert(date, '01.12.2022'), Convert(time, '23:32:00'), 4, 4),
('0005-22', Convert(date, '03.12.2022'), Convert(time, '20:21:00'), 5, 5)
go

select [Number_Route_Sheet] as '�����', [Date_Route_Sheet] as '����', [Time_Route_Sheet] as '�����', [Name_Carrier] as '����������',
[Name_Model]+' '+[Number_Transport] from [dbo].[Route_Sheet]
inner join [dbo].[Carrier] on [ID_Carrier] = [Carrier_ID]
inner join [dbo].[Transport] on [ID_Transport] = [Transport_ID] inner join [dbo].[Model] on [ID_Model] = [Model_ID]
go

create table [dbo].[Application]
(
	[ID_Application] [int] not null identity(1,1),
	[Number_Application] [varchar] (max) not null,
	[Date_Application] [date] not null default(getdate()),
	[Time_Application] [time] not null default(getdate()),
	[Status_Application] [varchar] (15) not null,
	[Customer_ID] [int] not null,
	[Route_Sheet_ID] [int] not null
	constraint [PK_Application] primary key clustered
	([ID_Application] ASC) on [PRIMARY],
	constraint [CH_Status_Application] check 
	([Status_Application] in ('���������', '��������������', '�������')),
	constraint [FK_Customer_Application] foreign key ([Customer_ID])
	references [dbo].[Customer] ([ID_Customer]),
	constraint [FK_Route_Sheet_Application] foreign key ([Route_Sheet_ID])
	references [dbo].[Route_Sheet] ([ID_Route_Sheet])
)
go

insert into [dbo].[Application] ([Number_Application], [Date_Application], [Time_Application], [Status_Application], [Customer_ID], [Route_Sheet_ID])
values ('1', Convert(date, '23.12.2021'), Convert(time, '17:43'), '���������', 1, 1),
('2', Convert(date, '28.12.2021'), Convert(time, '16:23'), '���������', 2, 2),
('3', Convert(date, '01.01.2022'), Convert(time, '00:00'), '���������', 3, 3),
('4', Convert(date, '01.01.2022'), Convert(time, '19:32'), '���������', 4, 4),
('5', Convert(date, '03.01.2022'), Convert(time, '17:21'), '��������������', 5, 5)
go

select [Number_Application] as '����� ������', [Date_Application] as '����', [Time_Application] as '�����', [Status_Application] as '������',
[Name_Customer]+' '+[Surname_Customer]+' '+[Lastname_Customer] as '��� ����������', [Number_Route_Sheet] as '����� ����������� �����' from [dbo].[Application]
inner join [dbo].[Customer] on [ID_Customer] = [Customer_ID]
inner join [dbo].[Route_Sheet] on [ID_Route_Sheet] = [Route_Sheet_ID]
go

select [Number_Application] as '����� ������', [Date_Application] as '����', [Time_Application] as '�����', [Status_Application] as '������',
[Name_Customer]+' '+[Surname_Customer]+' '+[Lastname_Customer] as '��� ����������', [Number_Route_Sheet] as '����� ����������� �����' from [dbo].[Application]
inner join [dbo].[Customer] on [ID_Customer] = [Customer_ID]
inner join [dbo].[Route_Sheet] on [ID_Route_Sheet] = [Route_Sheet_ID]
where Convert(int, [Number_Application]) >= 3
go

create table [dbo].[Points_Route_Sheet]
(
	[ID_Point_Route_Sheet] [int] not null identity(1,1),
	[Delivery_Point_ID] [int] not null,
	[Route_Sheet_ID] [int] not null
	constraint [PK_Point_Route_Sheet] primary key clustered
	([ID_Point_Route_Sheet] ASC) on [PRIMARY],
	constraint [FK_Delivery_Point] foreign key ([Delivery_Point_ID])
	references [dbo].[Delivery_Points] ([ID_Delivery_Point]),
	constraint [FK_Route_Sheet] foreign key ([Route_Sheet_ID])
	references [dbo].[Route_Sheet] ([ID_Route_Sheet]),
)
go

insert into [dbo].[Points_Route_Sheet] ([Delivery_Point_ID], [Route_Sheet_ID])
values (1,1), (2,1), (1,2), (4,2), (1,3), (1,4), (3,4), (1,5), (5,5)
go

select [Delivery_Address] as '����� ��������', [Number_Route_Sheet] as '����� ����������� �����' from [dbo].[Points_Route_Sheet]
inner join [dbo].[Delivery_Points] on [ID_Delivery_Point] = [Delivery_Point_ID]
inner join [dbo].[Route_Sheet] on [ID_Route_Sheet] = [Route_Sheet_ID]
order by [Number_Route_Sheet] ASC
go

create table [dbo].[Post_Customer]
(
	[ID_Post_Customer] [int] not null identity(1,1),
	[Post_ID] [int] not null,
	[Customer_ID] [int] not null
	constraint [PK_Post_Customer] primary key clustered
	([ID_Post_Customer] ASC) on [PRIMARY],
	constraint [FK_Post] foreign key ([Post_ID])
	references [dbo].[Post] ([ID_Post]),
	constraint [FK_Customer] foreign key ([Customer_ID])
	references [dbo].[Customer] ([ID_Customer]),
)
go

insert into [dbo].[Post_Customer] ([Post_ID], [Customer_ID])
values (2,1), (2,2), (4,3), (3,4), (4,5)
go

select [Name_Customer]+' '+[Surname_Customer]+' '+[Lastname_Customer] as '��� ���������', [Name_Post] as '���������' from [dbo].[Post_Customer]
inner join [dbo].[Customer] on [ID_Customer] = [Customer_ID]
inner join [dbo].[Post] on [ID_Post] = [Post_ID]
go

create table [dbo].[Country_Trasnport]
(
	[ID_Country_Transport] [int] not null identity(1,1),
	[Country_ID] [int] not null,
	[Transport_ID] [int] not null
	constraint [PK_Country_Transport] primary key clustered
	([ID_Country_Transport] ASC) on [PRIMARY],
	constraint [FK_Country] foreign key ([Country_ID])
	references [dbo].[Country] ([ID_Country]),
	constraint [FK_Transport] foreign key ([Transport_ID])
	references [dbo].[Transport] ([ID_Transport]),
)
go

insert into [dbo].[Country_Trasnport] ([Country_ID], [Transport_ID])
values (1,1), (1,2), (2,3), (2,4), (2,5)
go

select [Number_Transport] as '�����', [Name_Country] as '������' from [dbo].[Country_Trasnport]
inner join [dbo].[Country] on [ID_Country] = [Country_ID]
inner join [dbo].[Transport] on [ID_Transport] = [Transport_ID]
go

create table [dbo].[Post_Employee]
(
	[ID_Post_Employee] [int] not null identity(1,1),
	[Post_ID] [int] not null,
	[Employee_ID] [int] not null
	constraint [PK_Post_Employee] primary key clustered
	([ID_Post_Employee] ASC) on [PRIMARY],
	constraint [FK_Post_Employee] foreign key ([Post_ID])
	references [dbo].[Post] ([ID_Post]),
	constraint [FK_Employee] foreign key ([Employee_ID])
	references [dbo].[Employee] ([ID_Employee]),
)
go

insert into [dbo].[Post_Employee] ([Employee_ID], [Post_ID])
values (1,1),(2,1),(3,1),(4,1),(5,1)
go

select [Name_Employee]+' '+[Surname_Employee]+' '+[Lastname_Employee] as '��� ����������', [Login_Employee] as '�����', [Name_Post] as '���������' from [dbo].[Post_Employee]
inner join [dbo].[Employee] on [ID_Employee] = [Employee_ID]
inner join [dbo].[Post] on [ID_Post] = [Post_ID]
go

create table [dbo].[Cargo_Application]
(
	[ID_Cargo_Application] [int] not null identity(1,1),
	[Cargo_ID] [int] not null,
	[Application_ID] [int] null
	constraint [PK_Cargo_Application] primary key clustered
	([ID_Cargo_Application] ASC) on [PRIMARY],
	constraint [FK_Cargo] foreign key ([Cargo_ID])
	references [dbo].[Cargo] ([ID_Cargo]),
	constraint [FK_Application] foreign key ([Application_ID])
	references [dbo].[Application] ([ID_Application])
)
go

insert into [dbo].[Cargo_Application] ([Cargo_ID], [Application_ID])
values (1,1), (2,2), (3,3), (4,4), (5,5)
go

select [Description_Cargo] as '�������� ������', [Number_Application] as '����� ������' from [dbo].[Cargo_Application]
inner join [dbo].[Cargo] on [ID_Cargo] = [Cargo_ID]
inner join [dbo].[Application] on [ID_Application] = [Application_ID]
go

create table [dbo].[Employee_License]
(
	[ID_Employee_License] [int] not null identity(1,1),
	[Employee_ID] [int] not null,
	[License_ID] [int] null
	constraint [PK_Employee_License] primary key clustered
	([ID_Employee_License] ASC) on [PRIMARY],
	constraint [FK_Employee_License] foreign key ([Employee_ID])
	references [dbo].[Employee] ([ID_Employee]),
	constraint [FK_License] foreign key ([License_ID])
	references [dbo].[License] ([ID_License])
)
go

insert into [dbo].[Employee_License] ([Employee_ID], [License_ID])
values (1,1), (2,1), (3,1), (3,2), (4,1),(5,1)
go

select [Name_Employee]+' '+[Surname_Employee]+' '+[Lastname_Employee] as '���', [Login_Employee] as '�����',
[Type_License] as '��������� ����' from [dbo].[Employee_License]
inner join [dbo].[Employee] on [ID_Employee] = [Employee_ID]
inner join [dbo].[License] on [ID_License] = [License_ID]
go
