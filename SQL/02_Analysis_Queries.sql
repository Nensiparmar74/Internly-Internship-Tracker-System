USE internship_tracker;


-- Total Applications

SELECT COUNT(*) AS TotalApplications
FROM applications;


-- Application Status Analysis

SELECT
    Status,
    COUNT(*) AS Total
FROM applications
GROUP BY Status
ORDER BY Total DESC;


-- Top 10 Companies by Applications

SELECT
    c.Company_Name,
    COUNT(*) AS Applications
FROM applications a
JOIN companies c
ON a.Company_ID = c.Company_ID
GROUP BY c.Company_Name
ORDER BY Applications DESC
LIMIT 10;


-- Application Source Analysis

SELECT
    Source,
    COUNT(*) AS Total
FROM applications
GROUP BY Source
ORDER BY Total DESC;


-- Average Internship Stipend

SELECT
    ROUND(AVG(Stipend),2) AS Average_Stipend
FROM offers;


-- Highest Stipend Companies

SELECT
    c.Company_Name,
    MAX(o.Stipend) AS Highest_Stipend
FROM offers o
JOIN applications a
ON o.Application_ID = a.Application_ID
JOIN companies c
ON a.Company_ID = c.Company_ID
GROUP BY c.Company_Name
ORDER BY Highest_Stipend DESC
LIMIT 10;


-- Offer Acceptance Rate

SELECT
    COUNT(*) AS Total_Offers,

    SUM(CASE 
        WHEN Accepted = 'Yes' 
        THEN 1 ELSE 0 END) AS Accepted_Offers,

    ROUND(
        SUM(CASE WHEN Accepted='Yes' THEN 1 ELSE 0 END)
        *100.0 / COUNT(*),2
    ) AS Acceptance_Rate_Percentage

FROM offers;


-- Monthly Application Trend

SELECT
    DATE_FORMAT(Applied_Date,'%Y-%m') AS Month,
    COUNT(*) AS Total_Applications
FROM applications
GROUP BY Month
ORDER BY Month;


-- Average Interview Rounds

SELECT
    ROUND(AVG(Rounds_Per_Application),2)
    AS Average_Interview_Rounds

FROM
(
    SELECT
        Application_ID,
        COUNT(*) AS Rounds_Per_Application

    FROM interviews

    GROUP BY Application_ID

) AS t;


-- Industry Wise Applications

SELECT
    c.Industry,
    COUNT(*) AS Total_Applications

FROM applications a

JOIN companies c
ON a.Company_ID=c.Company_ID

GROUP BY c.Industry

ORDER BY Total_Applications DESC;