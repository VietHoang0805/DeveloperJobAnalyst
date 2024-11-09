-- 1. Số lượng ứng viên theo quốc gia
SELECT Country, COUNT(ProfileID) AS TotalApplicants
FROM DIM_Profile
GROUP BY Country
ORDER BY TotalApplicants DESC;

-- 2. Số lượng ứng viên theo trình độ học vấn
SELECT EdLevel, COUNT(ProfileID) AS TotalApplicants
FROM DIM_Profile
WHERE EdLevel IS NOT NULL
GROUP BY EdLevel;

-- 3. Số lượng ứng viên làm việc tại văn phòng
SELECT RemoteWork, COUNT(ProfileID) AS RemoteWorkerCount
FROM Fact_CandidateProfile
WHERE RemoteWork = 'In-person'
GROUP BY RemoteWork;

-- 4. Top 5 ngôn ngữ lập trình ứng viên đã sử dụng nhiều nhất
SELECT TOP 5 LanguageHaveWorkedWith, COUNT(TechskillID) AS TotalUsers
FROM DIM_TechSkills
GROUP BY LanguageHaveWorkedWith
ORDER BY TotalUsers DESC;

-- 5. Top 10 công cụ kỹ thuật mà ứng viên đã sử dụng nhiều nhất
SELECT TOP 10 ToolsTechHaveWorkedWith, COUNT(TechskillID) AS TotalUsers
FROM DIM_TechSkills
WHERE ToolsTechHaveWorkedWith IS NOT NULL
GROUP BY ToolsTechHaveWorkedWith
ORDER BY TotalUsers DESC;

-- 6. Top 10 nền tảng làm việc phổ biến nhất mà ứng viên đã sử dụng
SELECT TOP 10 PlatformHaveWorkedWith, COUNT(TechskillID) AS TotalUsers
FROM DIM_TechSkills
WHERE PlatformHaveWorkedWith IS NOT NULL
GROUP BY PlatformHaveWorkedWith
ORDER BY TotalUsers DESC;

-- 7. Top 5 loại cơ sở dữ liệu đã sử dụng phổ biến nhất
SELECT TOP 5 DatabaseHaveWorkedWith, COUNT(TechskillID) AS TotalUsers
FROM DIM_TechSkills
WHERE DatabaseHaveWorkedWith IS NOT NULL
GROUP BY DatabaseHaveWorkedWith
ORDER BY TotalUsers DESC;

-- 8. Top 5 hoạt động ở ngoài lập trình phổ biến nhất của ứng viên
SELECT TOP 5 CodingActivities, COUNT(ExperienceID) AS TotalApplicants
FROM DIM_Experience
GROUP BY CodingActivities
ORDER BY TotalApplicants DESC;

-- 9. Số lượng ứng viên theo nguồn học lập trình
SELECT TOP 5 DevType, OrgSize, COUNT(ExperienceID) AS TotalApplicants
FROM DIM_Experience
GROUP BY DevType, OrgSize
ORDER BY TotalApplicants DESC;


--  10. Top 5 những công cụ quản lý công việc cộng tác mà ứng viên đã sử dụng
SELECT TOP 5 OfficeStackAsyncHaveWorkedWith, COUNT(WorkEnvID) AS TotalApplicants
FROM DIM_WorkEnvironment
WHERE OfficeStackAsyncHaveWorkedWith IS NOT NULL
GROUP BY OfficeStackAsyncHaveWorkedWith
ORDER BY TotalApplicants DESC;

-- 11. Top 10 ngôn ngữ lập trình mà ứng viên muốn làm việc nhiều nhất
SELECT TOP 10 LanguageWantToWorkWith, COUNT(TechskillID) AS TotalUsers
FROM Fact_TechStack
WHERE LanguageWantToWorkWith IS NOT NULL
GROUP BY LanguageWantToWorkWith
ORDER BY TotalUsers DESC;

-- 12. Top 10 công cụ kỹ thuật mà ứng viên muốn sử dụng nhiều nhất
SELECT TOP 10 ToolsTechWantToWorkWith, COUNT(TechskillID) AS TotalUsers
FROM Fact_TechStack
WHERE ToolsTechWantToWorkWith IS NOT NULL
GROUP BY ToolsTechWantToWorkWith
ORDER BY TotalUsers DESC;

-- 13. Số lượng ứng viên theo số năm kinh nghiệm
SELECT YearsCodePro, COUNT(ExperienceID) AS TotalApplicants
FROM DIM_Experience
WHERE YearsCodePro IS NOT NULL
GROUP BY YearsCodePro 
ORDER BY TotalApplicants DESC;

-- 14. Số lượng ứng viên theo quy mô tổ chức
SELECT OrgSize, COUNT(ExperienceID) AS TotalApplicants
FROM DIM_Experience
WHERE OrgSize IS NOT NULL
GROUP BY OrgSize;

-- 15. Top 10 danh sách các công nghệ nền tảng web mà ứng viên đã sử dụng
SELECT TOP 10 TechskillID, WebframeHaveWorkedWith
FROM DIM_TechSkills
WHERE WebframeHaveWorkedWith IS NOT NULL;
