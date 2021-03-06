USE [SimpleBlog]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 20/01/17 2:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Email] [varchar](50) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Password] [varchar](200) NULL,
	[Role] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 20/01/17 2:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[ShortDescription] [nvarchar](2000) NULL,
	[Content] [text] NULL,
	[Author] [varchar](50) NULL,
	[PostingDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[OldStatus] [varchar](50) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 20/01/17 2:22:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](500) NULL,
	[Author] [varchar](50) NULL,
	[ArticleID] [int] NULL,
	[PostingDate] [datetime] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'bang12@gmail.com', N'Bang Ty', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'member', N'New')
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'bongma.trolai1999@gmail.com', N'Cao Tuan Huy', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'member', N'Active')
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'dhthang@gmail.com', N'Admin', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'admin', N'New')
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'dhthang1998@gmail.com', N'Cao Tuan Huy', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'member', N'New')
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'dhthang9x01@gmail.com', N'Dang Hieu Thang', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'member', N'New')
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'dhthang9x02@gmail.com', N'Dang Hieu Thang', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'member', N'New')
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [Role], [Status]) VALUES (N'ngocrongsc1@gmail.com', N'Bach De', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'member', N'Active')
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (1, N'A bit about ASC Alert in Log Analytics workspace', N'Microsoft introduced Continuous Export in Azure Security Center allowing you to export security recommendation and alert to a Log Analytics workspace. You might wonder if data structure in alert is different from the data which is collected from configuring ASC data collection.', N'Microsoft introduced Continuous Export in Azure Security Center allowing you to export security recommendation and alert to a Log Analytics workspace. You might wonder if data structure in alert is different from the data which is collected from configuring ASC data collection.

This article is going to reveal a bit about the difference which would be helpful for you to explain to your customers.

Previously ASC allowed you to specify a Log Analytics workspace to store what its collects including security events (from Windows OS virtual machine). Not only security event if you pay attention enough you will notice that ACS alert is also collected into the workspace.', N'dhthang9x01@gmail.com', CAST(N'2019-12-12T00:00:00.000' AS DateTime), N'Active', N'Active')
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (2, N'Work with Azure Security Center alert in Log Analytics', N'Azure Security Center allows you to specify a Log Analytics (LA) workspace to collect data. As far as I know there are two data types that are fed to the configured workspace: SecurityAlert and SecurityEvent. Microsoft recently introduced a Continuous Export which provides the ability to export ASC alert to multiple sources such as Event Hub or Log Analytics.', N'Azure Security Center allows you to specify a Log Analytics (LA) workspace to collect data. As far as I know there are two data types that are fed to the configured workspace: SecurityAlert and SecurityEvent. Microsoft recently introduced a Continuous Export which provides the ability to export ASC alert to multiple sources such as Event Hub or Log Analytics.

In this article, I would like to share some queries to help you get started with Kusto Query Language in order to work with ASC alert data in LA workspace.', N'dhthang9x01@gmail.com', CAST(N'2019-12-14T00:00:00.000' AS DateTime), N'Active', N'Active')
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (3, N'asd', N'asd', N'asd', N'dhthang9x01@gmail.com', CAST(N'2019-12-13T00:00:00.000' AS DateTime), N'Deleted', NULL)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (4, N'Work with Azure Security Ce', N'aaaaaaaaaaaaaaaaa', N'asddddaasdsadasdsadsadasd', N'dhthang1998@gmail.com', CAST(N'2020-01-09T00:00:00.000' AS DateTime), N'Deleted', N'New')
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (5, N'asdsad', N'asdas', N'$$$$$$$$$$$$$$ "fkgjikgjf."', N'dhthang1998@gmail.com', CAST(N'2020-01-09T00:00:00.000' AS DateTime), N'New', N'New')
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (6, N'Random thoughts on a job fair', N'Random thoughts from a tech expo that I attended just now, not in any particular order. And some thoughts might have nothing to do with a tech expo, I am not apologizing.', N'Today I learned that there is career fair, and then there is job fair, each with a slight distinction from the other. The one I went to was probably more of the latter. But really, it was mostly about mascot costumes and freebies. So just.. fair?
If you are a company, and spend anywhere between some and shit lot of money for a booth, make sure your representative can represent something.
Recruiters should know about their company business nature, organization structure, and for what their job titles actually stand. The use of buzz words like partnership, innovation, or opportunities is bad communication and can''t be used to replace solid understanding on business model, job description, or career path respectively.
Developers coming to support recruitment are great helps. But they should know that while being there, they are effectively salesmen. If they can''t articulate, with a hint of passion, what their job is like in a day, a month, and a quarter, they are just wasting oxygen and space.
If you think that''s a lot to ask for, you are right. It should be. Hiring is the most impactful task one can make to his organization. Bring your highest caliber executives in, because otherwise TinyPulse is bringing their Director of Technology and awe your potential hires with insightful thoughts and sincerity.
If you are a recruiter, you should have a plan to deal with people who have zero interest in your vacancies. The very best candidates are seldom between jobs, they are more likely to be employed and well-paid, you need to poach them to stand any chance. They might not be hooked in the positions, but you can still get them interested in the company. Getting one''s contact info doesn''t mean shit, people are just polite. Being accountable for answering queries on business model, offering career development path, or simply representing your culture are all significantly more important. And as far as I can tell, nobody is keeping tabs. Be different.
If you are an attendee, don''t get annoyed if people shove flyers into your hands. They most likely didn''t mean any harm. They are just trying to do a good job within their capacity, given the little or zero training they received before hand. Be kind, take flyers, and enjoy a small conversation. You might learn something new while making someone''s day.
If you are looking for a job, reading between the lines of job titles and their descriptions is a great way to learn about a company''s modus operandi, tech stack, and drawbacks. For example:
If one is hiring multiple data analyst positions, it has a data-driven culture.
Tech stack is revealed through job description and requirement is self-explanatory, but also pay attention to what is not written. Overwhelming mentions of batch processing indicates a lack of stream processing.
A company''s drawbacks might get reflected in job requirements precisely because issues happen and the company is working on resolving them with fresh meat minds.
Similarly, if you want to follow a particular career path, however vague, look at a company''s vacancies whose jobs rely on yours. The number of vacancies shows how mature the company is in your chosen field and how much support you gonna receive. For example, big data engineers can look for vacancies of analytics and ML; front-end developers, product and design; product managers, any sign of customer interaction. There should be a healthy combination of both business and technical vacancies for a good network effect. Nothing is worse than spending your time one something with zero impact on anyone.
People in outsourcing industry should get panic if they aren''t working on hard problems. That you can code the same CRUD operation in 5 different languages is a waste of resource rather than something to be proud of. Local powerhouses like Ahamove or Tiki are solving hard problems that impact the life of millions of people. And it doesn''t matter if they can do it in only one language. They are doing it.', N'bang12@gmail.com', CAST(N'2020-01-11T00:00:00.000' AS DateTime), N'Active', N'Active')
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (7, N'Free ebook: “Microsoft Azure Defense In Depth”', N'I promised myself regardless of the result between Vietnam and Uzbekistan in the final match of AFC U23 Championship 2018, I would publish my 350-page book I wrote and sold on Amazon market. The eBook has been sold over 60 copies since the release date. For those who don’t know the book, here is the introduction.', N'I promised myself regardless of the result between Vietnam and Uzbekistan in the final match of AFC U23 Championship 2018, I would publish my 350-page book I wrote and sold on Amazon market. The eBook has been sold over 60 copies since the release date. For those who don’t know the book, here is the introduction.
The book will cover common security design consideration and guidance on how to apply defense in depth strategy to your system hosted on Microsoft Azure IaaS. You will also learn number of different security practices along with Microsoft Azure built-in features to prevent common attacks (e.g. brute-force attack, DDoS, surface attack).
The book can be downloaded publicly here: https://gallery.technet.microsoft.com/Azure-Defense-In-Depth-17a27b50

I was planning to write a new book in 2018 covering more practical experiences in security for both Azure IaaS and PaaS from development to architecting. Stay tuned!

Regards,
-T.s', N'bang12@gmail.com', CAST(N'2020-01-11T00:00:00.000' AS DateTime), N'Active', NULL)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (8, N'Identical IIS filesystem path in SharePoint', N'The filesystem path for the IIS website does not point to and NTFS drive. SharePoint requires all web servers in the farm to be configured identically. This requirement extends to drive letter name', N'I suddenly ran into a problem related to inconsistent IIS filesystem path today when creating a new web application in SharePoint 2010. SharePoint threw the message
The filesystem path for the IIS website does not point to and NTFS drive. SharePoint requires all web servers in the farm to be configured identically. This requirement extends to drive letter name
Because the environment was highly secured by several hardening guidelines so checking around IIS hardening was flashed in my mind first. Indeed there was a rule requiring the IIS root to be moved to another location. The registry path HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\InetStp contains a key named PathWWWRoot that specify the root folder of IIS. After changing to the same location with other SharePoint web application’s locations and performed iisreset, I managed to create a new web application.

Make sure if you are going to change the IIS filesystem path, you need to migrate all because SharePoint doesn’t support inconsistent IIS path for different web applications.', N'bang12@gmail.com', CAST(N'2020-01-11T00:00:00.000' AS DateTime), N'Active', N'Active')
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (9, N'Microsoft Office direct-edit functionality in hardened SharePoint environment', N'Working and troubleshooting in a highly secure and hardened environment has never been easy. Recently my end users have reported an issue related to editing Microsoft Office documents in SharePoint 2013 environment. When they open a document from SharePoint document library, such as Microsoft Word document, there is a window pop-up asking the message “How would you like to open this file?” with two options: Read Only and Edit. Whether they select an option, Microsoft Word client application always set opening document read-only mode. If they click Enable Editing then make changes, Microsoft Word client application always asks them to save to their computer locally while they wish to directly save to SharePoint library.', N'Working and troubleshooting in a highly secure and hardened environment has never been easy. Recently my end users have reported an issue related to editing Microsoft Office documents in SharePoint 2013 environment. When they open a document from SharePoint document library, such as Microsoft Word document, there is a window pop-up asking the message “How would you like to open this file?” with two options: Read Only and Edit. Whether they select an option, Microsoft Word client application always set opening document read-only mode. If they click Enable Editing then make changes, Microsoft Word client application always asks them to save to their computer locally while they wish to directly save to SharePoint library.

The environment is a bit of special with two domain controllers. One is used to issue SharePoint service account while another is responsible for end user accounts. The environment has been implemented and hardened by the corporate security policies (e.g. Windows Server, IIS hardening guideline).
After a few investigations, I have realized that if I allow OPTIONS, PROPFIND and HEAD methods through Request Filtering (HTTP Verb), I will be able to edit then save back to SharePoint document library directly. The existing corporate security policy only allows GET and POST methods. OPTIONS, PROPFIND and HEAD methods are involved to make WebDAV functional.

When you open Microsoft Office document from SharePoint (or any other file server), Internet Explorer (IE) ends GET request to download the file to the Temporary Internet Files on the client machine. IE invokes Office to open the document. Office then starts trying to determine if the file can be authored or not so it can open the file for editing or read-only. Office will issue OPTIONS call on the parent folder of the Office document to determine server capability. In case OPTIONS call can’t return expected headers or valid response, Office again tries to determine if it can author against this server or not by using more WebDAV calls: HEAD, OPTIONS and PROPFIND. If all calls fail, Office will open the document read-only. When you want to edit the document, Office doesn’t trust your document so it asks you to save somewhere in your computer first.

The following references can help if you are required to provide justification to your security team in order to allow special methods for WebDAV call.', N'bang12@gmail.com', CAST(N'2020-01-11T00:00:00.000' AS DateTime), N'Active', NULL)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (10, N'Be aware of backing up IIS MachineKeys', N'It’s quite difficult to tell you that I had had to spend 3 days looking into an issue when joining a machine to an existing SharePoint farm that I’m responsible for managing. This task shouldn’t have taken that long. Like every trivial workaround I have written in my blog, this post is just kindly warn you something that I experienced.', N'It’s quite difficult to tell you that I had had to spend 3 days looking into an issue when joining a machine to an existing SharePoint farm that I’m responsible for managing. This task shouldn’t have taken that long. Like every trivial workaround I have written in my blog, this post is just kindly warn you something that I experienced.
ecently one of the application servers in the farm went down and wasn’t accessible remotely. The infrastructure team came up with certificate issue on the remote desktop connection service. They did something I didn’t know but made the server work again. However, when I logged into SharePoint Central Administration website that was hosted in that machine’s IIS, SharePoint threw out several weird errors related to certificate. One of them was that I couldn’t change application pool identity either start IIS Admin service. SharePoint didn’t tell me where those certificates belong to. All of the errors were actually strange to me. I was afraid of the duplication of error made on other machines. Therefore, I decided to disconnect the machine out of the farm. And surely Central Administration service was started in the second application server first. Joining the first server to the farm was the next step then. However, this didn’t work as my expectation. Tracing log in ULS many times, I found that SharePoint always reported that “An exception occurred while committing IIS configuration changes: keyset does not exist” and “Unjoining farm”. It then terminated all processes of creating and assigning permissions to application pool or group. All web application began to be deleted. As a result, joining farm was failed. Reinstalling IIS role and running Preparation tool to automatically configure SharePoint didn’t help me.

In Google, folks suggest that the workaround is to assign permission to MachineKeys file in Program Data\Microsoft\Crypto\RSA\MachineKey. I even set add Everyone to read it but didn’t work. I thought that the MachineKeys file wasn’t valid or got overwritten by another one. This could possibly be a root cause. I found one full backup done by Windows Server Backup feature in the server that I could use. I restored MachineKeys folder to the same path. Finally I was then able to join that server to the existing farm.

What is the MachineKeys folder?
IIS uses MachineKeys feature for encryption. You can find many keys that do encryption in Program Data\Microsoft\Crypto\RSA\MachineKey. IIS Admin service replies on such a key to load and enumerate metabase. If you don’t have valid key, IIS Admin can’t be started.

Your application pool identity also replies on keys in this folder. If application pool can’t verify valid key, you can’t change to another identity.

Backup MachineKey
Backing up IIS machine key is strongly recommended since it affects IIS configuration and even application pool identity that makes your SharePoint alive.

There are several ways to back up IIS machine key. The easiest way is to back up the MachineKeys folder. Another way is to use the following command.
 aspnet_regiis -px "iisConfigurationKey" "C:\iisConfigurationKey.xml" –pri
Conclusion:
MachineKey has to be in the list of your SharePoint backup. Otherwise, you would have to deal with unknown errors that would steal your golden time. Below is the list of additional references I strongly recommend you to read.', N'bang12@gmail.com', CAST(N'2020-01-11T00:00:00.000' AS DateTime), N'Active', NULL)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (11, N'Quick tip to overcome limitation of uploading using SharePoint web service', N'I have been working with a team responsible for a big migration from MOSS 2007 to SharePoint 2013. The team has a migration tool using web service copy.asmx to move files across SharePoint version. None of issues has happened if we directly upload files into SharePoint library via uploading dialog. However, when we use the tool, it throws out the error that the given file exceeds the limit', N'I have been working with a team responsible for a big migration from MOSS 2007 to SharePoint 2013. The team has a migration tool using web service copy.asmx to move files across SharePoint version. None of issues has happened if we directly upload files into SharePoint library via uploading dialog. However, when we use the tool, it throws out the error that the given file exceeds the limit

We followed several basic tips to increase the maximum size supported by changing value in maxRequestLength in the root web.config. I thought that changing registry key in WebClient (WebDav) would get the issue sorted out as well.

We finally realized that adding the following code to the web.config in the path C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\15\ISAPI is one of the walkarounds.
Increase the value in exceutionTimeout  to extend the connection.

This post is just a quick tip in addition to lots of articles helping you to overcome the limitation when you use SharePoint web service to move or upload file into SharePoint.', N'bang12@gmail.com', CAST(N'2020-01-11T00:00:00.000' AS DateTime), N'Active', NULL)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (12, N'Machine-level backup in SharePoint scenario', N'Part of the backup process, many people would commonly perform a machine-level backup. This basically means everything including drives, file system, folder, system state or so on is backed up into a package. In their mind, if any of virtual machines goes down, they just simply need to restore a backup. In SharePoint scenario, this approach would be very risky even essentially things will be fully restored.', N'This topic has come out since I was responsible for providing backup and recovery solution for a medium SharePoint 2013 farm. The farm consists of 3 web front-end servers, 2 applications servers and a couple of database severs which are configured Failover Clustering.

Part of the backup process, many people would commonly perform a machine-level backup. This basically means everything including drives, file system, folder, system state or so on is backed up into a package. In their mind, if any of virtual machines goes down, they just simply need to restore a backup. In SharePoint scenario, this approach would be very risky even essentially things will be fully restored.

SharePoint stores its configuration in the hierarchical configuration store in the configuration database. This is synced to each machine in the farm by the configuration cache refresh timer job every 15 seconds. This process is to update file system cache, configuration cache or other things and let the configuration database know which servers belong to the farm. If you restore a machine with an out of sync cache you will have a potentially serious problem. The cache will update itself with a flush and repopulate but there will be a small time window of minutes where something could break. Another example of sync is crawling. Imagine you perform a backup in middle crawl, you will run the possibility of a search partition being out of sync when you restore a backup. Or even not during a crawl, you could just be making regular analytic processing updates and again restore one machine and index is out of sync.

There is no really an official documentation from Microsoft saying machine-level backup is supported in SharePoint scenario. In a single-server farm, machine-level backup may be well supported. For multi-server farm, this approach is supported for the farm in a fully stopped state. If you are to be required to back up your machine including operating system, the built-in Windows Server backup combining with some PowerShell scripts to create or join to a farm is a recommended best practice. I would like to thank Neil Hodgkinson, Wictor Wilen and other people for the valuable recommendations regarding my topic in MVP private forum.', N'bang12@gmail.com', CAST(N'2020-01-11T00:00:00.000' AS DateTime), N'Active', NULL)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (13, N'Intranet Collaboration Security in SharePoint – Part 1', N'The most well-known security story SharePoint folks are hearing these days is the statement of Keith Alexander – the director of the National Security Agency (NSA) and also the Commander of U.S. Cyber Command. According to U.S. Department of Defense, Alexander said that the leaker working in NSA Hawaii was a system administrator who was authorized to leaked information that was stored on the SharePoint servers. Although he didn’t blame directly the use of Microsoft SharePoint products and technologies, the statement apparently awakes lots of companies that are using SharePoint as a collaborative business platform to the perception of information security. Watch the interview between Keith Alexander and Pete Williams, Chief Justice Correspondent, NBC News below.', N'Daily activities on SharePoint is to create document, share information and work collaboratively.  Shared documents may contain intellectual property, financial report, confidential employee information, business result or so on. Imagine if any of these kinds of information are compromised to your company’s competitors someday, it will probably devastate the company’s business. The compromising would debase your company reputation.

I’ve been recently involved in a SharePoint disaster recovery project in which I had to recovery data after many computers and SharePoint servers were corrupted by a programmatically virus. To tell the truth, the reputation of this company is losing due to the attack. Obviously we all see that shareholders, stocks or financial-related stuffs in this company are strongly impacted. Another SharePoint security-intensive project I’ve done is to audit and harden a hosting SharePoint environment for an airport. In this project, I got to fix many misconfiguration and security breaches inside the SharePoint farm.

I think there is something I need myself to write to keep my brain more active in the field. That’s why I’ve come to a decision with a series of intranet collaboration security in the SharePoint platform. This series doesn’t cover in-depth security stuffs such as an explanation to cryptographic algorithm or the security mechanism of a specific SharePoint customization. Instead, it does focus on information security in your SharePoint intranet, mostly documents containing sensitive information. When it comes to SharePoint security, I’d consider the following areas:

Infrastructure & System: it includes Windows Server Operating System that is required before SharePoint deployment, IIS web server that is responsible for authentication and web services, and network devices e.g. firewall, reverse proxy.
Application: this includes configurations in your SharePoint farm, for example the configuration of Service account, application pool identity, Web part configuration. This may include customization or 3rd add-in for SharePoint.
Database: SharePoint content databases that contain shared sensitive documents; lists are stored in SQL Server.
Content: almost documents people share and work everyday. They need to be systematically controlled and protected from unauthorized users and threats from the Internet.
Compliance: to build a strong perimeter and an accurate security baseline, companies need to meet regulatory compliance. The compliance can be internally developed to meet specific security needs, or followed by international standards such as PCI DSS (Payment Card Industry Data Security Standard), SOX (Sarbanes-Oxley Act), HIPPA (Health Insurance Portability and Accountability Act)…Etc.

This article is just a summary of what I’m going to write by my experiences through many SharePoint projects I’ve done. Most of them included security requirements in which various SharePoint components must be protected.

I do hope this series help companies in terms of security plan for SharePoint to avoid information leakage as much as possible. It would be a small companion book in your pocket.
Stay tuned!', N'bang12@gmail.com', CAST(N'2020-01-11T00:00:00.000' AS DateTime), N'Active', N'Active')
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (20, N'aaaaaaaaaaaaaaaaaa', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', N'dhthang9x01@gmail.com', CAST(N'2020-01-14T14:51:32.577' AS DateTime), N'Deleted', N'Active')
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (21, N'Quick thought on CVE-2019-0962', N'Microsoft recently published a security vulnerability coded CVE-2019-0962 indicating possible elevation of privilege when deploying an Azure Automation account.
From what the CVE says, an elevation of privilege vulnerability exists in Azure Automation “RunAs account” runbooks for users with contributor role. This vulnerability could potentially allow members of an organization to access Key Vault secrets through a runbook, even if these members would personally not have access to that Key Vault.', N'Microsoft recently published a security vulnerability coded CVE-2019-0962 indicating possible elevation of privilege when deploying an Azure Automation account.

From what the CVE says, an elevation of privilege vulnerability exists in Azure Automation “RunAs account” runbooks for users with contributor role. This vulnerability could potentially allow members of an organization to access Key Vault secrets through a runbook, even if these members would personally not have access to that Key Vault.
Testing:
To me, it is not actually a security vulnerability. When you create a runbook and use RunAsAccount mode, Azure automatically creates a self-service certificate and a service principal that is granted Contributor role. If you have Runbook authoring privilege (RBAC) you can elevate the service principal to add itself to a target Key Vault access policy and read secret.
In a nutshell, there are three conditions for a successful exploitation:

Global admin/co-admin who can create “RunAs” account.
AzureRM.KeyVault module is imported into the exploitation runbook.
Runbook Write (Microsoft.Automation/automationAccounts/runbooks/draft/content/write).
Mitigation
The key issue here is Contributor role that is given to the automation account’s service principal. Obviously to mitigate the widespread access you need to grant the service principal only role you need. Microsoft provides the following PowerShell script to help check role assigned to automation account’s service principal in specified subscription and to help update a new role definition which exclude Azure Key Vault RBAC operation.

', N'dhthang1998@gmail.com', CAST(N'2020-01-16T02:34:05.907' AS DateTime), N'New', N'New')
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (22, N'Query private IP Address using Azure CLI', N'You’d probably guess that querying IP address using Azure CLI could not be easier with az vm list-ip-addresses. It should work if the environment is small and you don’t have virtual machine using the same name. In a large environment specially the one with DevOps you couldn’t avoid developers creating virtual machine using the same name.

In this post I’d like to give some clarification around querying IP address in a specific case when you’d like to perform VM audit level.', N'A paint point
Let’s take a look in az vm list-ip-addresses first. When running its response give you a JSON formatted result to list all VMs including its private IP address, public IP address and resource group.
Solution:
While relying on az vm list-ip-addresses doesn’t help in the case, you would need to figure out the unique key value and another data set to look up. Fortunately you have network interface card (NIC) information with shows up private IP address (ipConfigurations.privateIpAddress) when running
az network nic list . Sample data is as follows:
3
4
5
6
7
8
9
10
11
12
13
14
15
16
"ipConfigurations": [
      {
        "applicationGatewayBackendAddressPools": null,
        "applicationSecurityGroups": null,
        "etag": "W/\"12345-23a1-467b-b6e2-b909321212dssaad\"",
        "id": "/subscriptions/XXXXXXX-XXXX-XXXX-XXX-XXXXXXX/resourceGroups/vm-rg/providers/Microsoft.Network/networkInterfaces/vm-nic/ipConfigurations/ipconfig1",
        "loadBalancerBackendAddressPools": null,
        "loadBalancerInboundNatRules": null,
        "name": "ipconfig1",
        "primary": true,
        "privateIpAddress": "192.168.1.100",
        "privateIpAddressVersion": "IPv4",
        "privateIpAllocationMethod": "Dynamic",
        .....
      }
]
Conclusion
When doing VM audit level in your local network you would often need a list of host’ s IP (aka private IP address). It would be good to understand that you can name your virtual machine as similar as to another as long as they are not in the same resource group. By that way you’d encounter the above problem when doing the query and you’d need to find a unique lookup value. In the article VM resource ID and NIC resource ID would be the two best candidates. While VM resource ID seems not to be a choice, NIC resource ID is your need.

If you have another better solution I’d love to learn from you.', N'dhthang1998@gmail.com', CAST(N'2020-01-16T02:35:49.027' AS DateTime), N'Active', N'Active')
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (23, N'Test final', N'test final to submit lms', N'test final to submit lmstest final to submit lmstest final to submit lmstest final to submit lmstest final to submit lms', N'bang12@gmail.com', CAST(N'2020-01-17T02:25:59.410' AS DateTime), N'Deleted', N'Active')
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [Author], [PostingDate], [Status], [OldStatus]) VALUES (24, N'java servlet', N'abc', N'   ', N'bang12@gmail.com', CAST(N'2020-01-17T13:20:17.180' AS DateTime), N'New', N'New')
SET IDENTITY_INSERT [dbo].[Articles] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (1, N'Gooofffffff', N'dhthang9x01@gmail.com', 1, CAST(N'2019-12-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (2, N'Adasdsad', N'dhthang1998@gmail.com', 1, CAST(N'2019-12-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (3, N'aaaaaaaaaaaaaaaaaaaaaaaa', N'dhthang1998@gmail.com', 2, CAST(N'2020-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (4, N'This is helpful page', N'dhthang1998@gmail.com', 1, CAST(N'2020-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (5, N'Ahihi do ngoc', N'dhthang1998@gmail.com', 2, CAST(N'2020-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (6, N'AHIHI', N'dhthang9x01@gmail.com', 5, CAST(N'2020-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (7, N'Bai viet hay nha ban', N'dhthang9x01@gmail.com', 5, CAST(N'2020-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (8, N'Hay a', N'dhthang1998@gmail.com', 2, CAST(N'2020-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (9, N'Hello cac ban!', N'bang12@gmail.com', 10, CAST(N'2020-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (10, N'Very helpful!', N'dhthang9x01@gmail.com', 7, CAST(N'2020-01-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (11, N'Free !', N'dhthang9x01@gmail.com', 7, CAST(N'2020-01-14T14:17:59.930' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (12, N'Free Ebook', N'dhthang9x01@gmail.com', 7, CAST(N'2020-01-14T14:31:25.427' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (13, N'Good!', N'dhthang9x01@gmail.com', 6, CAST(N'2020-01-16T01:50:03.527' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (14, N'Good!', N'bang12@gmail.com', 22, CAST(N'2020-01-16T02:42:05.453' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (15, N'Good!', N'bang12@gmail.com', 22, CAST(N'2020-01-16T02:42:58.947' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (16, N'Very helpful!', N'ngocrongsc1@gmail.com', 22, CAST(N'2020-01-16T03:12:20.803' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (17, N'This is new comment!', N'ngocrongsc1@gmail.com', 22, CAST(N'2020-01-16T03:15:38.947' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (18, N'Bang was come here!', N'bang12@gmail.com', 6, CAST(N'2020-01-17T02:25:16.860' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (20, N'good', N'bang12@gmail.com', 9, CAST(N'2020-01-17T13:19:16.247' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Message], [Author], [ArticleID], [PostingDate]) VALUES (23, N'No comment!', N'bang12@gmail.com', 13, CAST(N'2020-01-17T14:14:24.477' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Article_Account] FOREIGN KEY([Author])
REFERENCES [dbo].[Accounts] ([Email])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Article_Account]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([Author])
REFERENCES [dbo].[Accounts] ([Email])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Articles] ([ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comment_Article]
GO
