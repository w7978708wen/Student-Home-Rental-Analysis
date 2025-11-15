USE HomeRentalAnalysis;
GO

/* Query 1. Capacity Tracker: */
SELECT c.full_building_name 'Location Offered',
	   count(a.location_offered) 'Capacity Used Up', 
	   (c.capacity - count(a.location_offered)) 'Capacity Left',
	   c.capacity 'Capacity'
FROM dbo.capacity c
LEFT JOIN dbo.applicant a 
	ON a.Location_offered = c.full_building_name
	AND a.application_status = 'Offer Accepted'
GROUP BY c.full_building_name, c.capacity;

/* Query 1's expected output:
+--------------------+----------------+--------------+----------+
| Location Offered   | Capacity Used Up | Capacity Left | Capacity |
+--------------------+----------------+--------------+----------+
| Amazing Apartment  | 3              | 197          | 200      |
| Brilliant Apartment| 2              | 298          | 300      |
| Great College      | 2              | 298          | 300      |
| Fantastic Apartment| 6              | 394          | 400      |
| Incredible College | 0              | 500          | 500      |
| Wonderful College  | 0              | 500          | 500      |
+--------------------+----------------+--------------+----------+ 
*/


/* Query 2. Display the top 10 most expensive building + room type options in the $1000 - $2000 category: */

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

/* Query 2's expected output:
+--------------------+-------------+-------------------+
| Room Building      | Room Type   | Total Monthly Cost|
+--------------------+-------------+-------------------+
| Fantastic Apartment| Single Room | 1620              |
| Brilliant Apartment| 1 Bedroom   | 1600              |
| Incredible College | Single Room | 1450              |
| Wonderful College  | Single Room | 1420              |
| Wonderful College  | 1 Bedroom   | 1320              |
| Fantastic Apartment| 1 Bedroom   | 1320              |
| Incredible College | 1 Bedroom   | 1300              |
| Wonderful College  | 2 Bedroom   | 1170              |
| Fantastic Apartment| 2 Bedroom   | 1170              |
| Fantastic Apartment| 5 Bedroom   | 1120              |
+--------------------+-------------+-------------------+
*/


/* Query 3. What are returner applicants' 1st room preferences: */

/* Note: Can infer which residence buildings have strong user-retention, 
althogh do not have the information of where the returner applicants lived previously */
SELECT _1st_Room_Preference "1st Room Preference", 
		count(_1st_Room_Preference) "Count"
FROM dbo.applicant 
WHERE Classification_Description = 'Returner'
GROUP BY _1st_Room_Preference;

/* Query 3's expected output: 
+----------------------------------+-------+
| 1st Room Preference              | Count |
+----------------------------------+-------+
| 1-Bedroom - Amazing Apartment    | 1     |
| 1-Bedroom - Great College        | 1     |
| 2-Bedroom - Amazing Apartment    | 1     |
| 2-Bedroom - Great College        | 1     |
| 5-Bedroom - Brilliant Apartment  | 1     |
| Single Room - Amazing Apartment  | 3     |
+----------------------------------+-------+
*/

