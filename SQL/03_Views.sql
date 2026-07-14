CREATE VIEW Internship_Dashboard AS

SELECT
    s.Name,
    c.Company_Name,
    a.Applied_Date,
    a.Status,
    o.Stipend,
    o.Accepted

FROM applications a

JOIN students s
ON a.Student_ID=s.Student_ID

JOIN companies c
ON a.Company_ID=c.Company_ID

LEFT JOIN offers o
ON a.Application_ID=o.Application_ID;