with nv_geo AS (
    SELECT geom, countyfp20, vtdst20
    FROM nv_precincts_2020
),

nv_results AS (
    SELECT county, county_fips, precinct, selection, IFNULL(votes,0) as votes
    FROM nv_general_results_2020
    WHERE race = 'President and Vice President of the United States'
)

SELECT *
FROM nv_geo 
LEFT JOIN nv_results ON county_fips=countyfp20 AND precinct= LTRIM(vtdst20,'0');