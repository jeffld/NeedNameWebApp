

CREATE TABLE [nnCompanies] (
    [CompanyID] int  NOT NULL ,
    [CompanyName] varchar(255)  NOT NULL ,
    [CompanyJobSiteID] int  NOT NULL ,
    CONSTRAINT [PK_nnCompanies] PRIMARY KEY CLUSTERED (
        [CompanyID] ASC
    )
)

CREATE TABLE [nnJobSites] (
    [JobSiteID] int  NOT NULL ,
    [JobSiteName] varchar(255)  NOT NULL ,
    CONSTRAINT [PK_nnJobSites] PRIMARY KEY CLUSTERED (
        [JobSiteID] ASC
    )
)

CREATE TABLE [nnJobSiteSkills] (
    [SkillID] int  NOT NULL ,
    [JobSiteID] int  NOT NULL ,
    [SkillName] varchar(255)  NOT NULL ,
    CONSTRAINT [PK_nnJobSiteSkills] PRIMARY KEY CLUSTERED (
        [SkillID] ASC
    )
)

CREATE TABLE [nnMemberContractors] (
    [MemberID] int  NOT NULL ,
    [MemberName] varchar(255)  NOT NULL ,
    CONSTRAINT [PK_nnMemberContractors] PRIMARY KEY CLUSTERED (
        [MemberID] ASC
    )
)

CREATE TABLE [nnMemberSkills] (
    [MemberID] int  NOT NULL ,
    [SkillID] int  NOT NULL ,
    [SkillDescription] varchar(4000)  NOT NULL ,
    [CertificationDate] datetime  NOT NULL ,
    [ExpirationDate] datetime  NOT NULL ,
    [TrainingCompany] varchar(255)  NOT NULL ,
    [TrainerName] varchar(255)  NOT NULL ,
    CONSTRAINT [PK_nnMemberSkills] PRIMARY KEY CLUSTERED (
        [MemberID] ASC,[SkillID] ASC
    )
)

ALTER TABLE [nnCompanies] WITH CHECK ADD CONSTRAINT [FK_nnCompanies_CompanyJobSiteID] FOREIGN KEY([CompanyJobSiteID])
REFERENCES [nnJobSites] ([JobSiteID])

ALTER TABLE [nnCompanies] CHECK CONSTRAINT [FK_nnCompanies_CompanyJobSiteID]

ALTER TABLE [nnJobSites] WITH CHECK ADD CONSTRAINT [FK_nnJobSites_JobSiteID] FOREIGN KEY([JobSiteID])
REFERENCES [nnJobSiteSkills] ([JobSiteID])

ALTER TABLE [nnJobSites] CHECK CONSTRAINT [FK_nnJobSites_JobSiteID]

ALTER TABLE [nnMemberContractors] WITH CHECK ADD CONSTRAINT [FK_nnMemberContractors_MemberID] FOREIGN KEY([MemberID])
REFERENCES [nnMemberSkills] ([MemberID])

ALTER TABLE [nnMemberContractors] CHECK CONSTRAINT [FK_nnMemberContractors_MemberID]

