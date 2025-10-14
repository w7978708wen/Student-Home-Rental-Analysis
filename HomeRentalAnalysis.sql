/* Capacity tracker: */
SELECT c.full_building_name 'Location Offered',
	   count(a.location_offered) 'Capacity Used Up', 
	   (c.capacity - count(a.location_offered)) 'Capacity Left',
	   c.capacity 'Capacity'
FROM dbo.capacity c
LEFT JOIN dbo.applicant a 
	ON a.Location_offered = c.full_building_name
	AND a.application_status = 'Offer Accepted'
GROUP BY c.full_building_name, c.capacity;

/* Display the top 10 most expensive building + room type options in the $1000 - $2000 category: */

/* Note: Joined the capacity table with the pricing table, 
because the room building in pricing table is encoded
and the full room building name column is available in the pricing table. 
I encountered this scenario in my actual project before. */

SELECT TOP 10 c.full_building_name 'Room Building', 
	   p.room_type 'Room Type', 
	   p.total_monthly_cost 'Total Monthly Cost'
FROM dbo.pricing p
JOIN dbo.capacity c
ON p.room_building = c.coded_name
WHERE p.total_monthly_cost LIKE '1%'
ORDER BY p.total_monthly_cost DESC;

/* What are returner applicants' 1st room preferences: */

/* Note: Can infer residence buildings have strong with user-retention, 
althogh do not have the information of where the returner applicants lived previously */
SELECT _1st_Room_Preference "1st Room Preference", 
		count(_1st_Room_Preference) "Count"
FROM dbo.applicant 
WHERE Classification_Description = 'Returner'
GROUP BY _1st_Room_Preference;

