
--PROBLEM-1
INSERT INTO rangers(ranger_id,name,region)
VALUES
(4,'Derek Fox','Coastal Plains')

--PROBLEM-2
SELECT count(DISTINCT species_id)  AS  unique_species_count FROM sightings

--PROBLEM-3
SELECT *
FROM sightings WHERE location LIKE '%Pass%';

--PROBLEM-4
SELECT r.name,count(s.sighting_id) As total_sightings
FROM rangers AS r
JOIN sightings AS s
ON r.ranger_id=s.ranger_id
GROUP BY r.name
ORDER BY r.name

--PROBLEM-5
SELECT sp.common_name
FROM species sp
LEFT JOIN sightings s
 ON 
 sp.species_id = s.species_id
WHERE s.species_id IS NULL;

--PROBLEM-6
SELECT sp.common_name,s.sighting_time,r.name FROM sightings s
JOIN species sp ON s.species_id = sp.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;


--PROBLEM-7
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';


--PROBLEM-8
SELECT  sighting_id,CASE 
        WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sightings;


--PROBLEM-9
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);
