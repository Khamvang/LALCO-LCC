
#All campaign on LCC of each HQ and team
SELECT 
	CASE t.id WHEN 23 THEN 'HO' WHEN 27 THEN 'HO' WHEN 34 THEN 'Luangprabang' WHEN 35 THEN 'Oudomxay'
		WHEN 36 THEN 'Pakse' WHEN 37 THEN 'Attapue' WHEN 38 THEN 'Houaphan' WHEN 39 THEN 'Sainyabuli'
		WHEN 40 THEN 'Thakek' WHEN 41 THEN 'Paksan' WHEN 42 THEN 'Savannakhet' WHEN 43 THEN 'HO'
		WHEN 44 THEN 'Xiengkhouang' WHEN 48 THEN 'Salavan'  ELSE '#N/A'
	END 'branch_name',
	t.name ,
	ccl.campaign_id ,
	c.name 'campaign_name',
	ccl.contact_list_id ,
	cl.name 'contact_list_name',
	cl.filename ,
	ccl.`limit` 'total number in campaign',
	null `Target in campaign`,
	null `call first 1 no answer`,
	null 'not yet call',
	null 'Total remain number',
	CASE c.status WHEN 1 THEN 'Active' WHEN 0 THEN 'Inactive' ELSE '' END 'Status',
	c.campaign_status ,
	c.created_at 'date_created',
	c.updated_at 'date_updated'
FROM hqcallcenter_db.campaign_contact_lists ccl 
LEFT JOIN hqcallcenter_db.campaigns c ON (ccl.campaign_id = c.id)
LEFT JOIN hqcallcenter_db.teams t ON (c.team_id = t.id)
LEFT JOIN hqcallcenter_db.contact_lists cl ON (cl.id = ccl.contact_list_id)
WHERE c.created_at >= '2024-06-01' -- t.id in (23,27,43) 
ORDER BY c.id;



#All campaign on LCC of each branch and team
SELECT 
	CASE t.id WHEN 23 THEN 'HO' WHEN 27 THEN 'HO' WHEN 34 THEN 'Luangprabang' WHEN 35 THEN 'Oudomxay'
		WHEN 36 THEN 'Pakse' WHEN 37 THEN 'Attapue' WHEN 38 THEN 'Houaphan' WHEN 39 THEN 'Sainyabuli'
		WHEN 40 THEN 'Thakek' WHEN 41 THEN 'Paksan' WHEN 42 THEN 'Savannakhet' WHEN 43 THEN 'HO'
		WHEN 44 THEN 'Xiengkhouang' WHEN 48 THEN 'Salavan' WHEN 49 THEN 'VTP Team' WHEN 52 THEN 'Luangnamtha'  
		when 53 then 'Xaisomboun' when 54 then 'Bokeo' when 55 then 'Sekong' ELSE '#N/A'
	END 'branch_name',
	t.name ,
	ccl.campaign_id ,
	c.name 'campaign_name',
	ccl.contact_list_id ,
	cl.name 'contact_list_name',
	cl.filename ,
	ccl.`limit` 'total number in campaign',
	null `Target in campaign`,
	null `call first 1 no answer`,
	null 'not yet call',
	null 'Total remain number',
	CASE c.status WHEN 1 THEN 'Active' WHEN 0 THEN 'Inactive' ELSE '' END 'Status',
	c.campaign_status ,
	c.created_at 'date_created',
	c.updated_at 'date_updated'
FROM callcenter_db.campaign_contact_lists ccl 
LEFT JOIN callcenter_db.campaigns c ON (ccl.campaign_id = c.id)
LEFT JOIN callcenter_db.teams t ON (c.team_id = t.id)
LEFT JOIN callcenter_db.contact_lists cl ON (cl.id = ccl.contact_list_id)
WHERE c.created_at >= '2024-06-01' -- t.id in (34,35,36,37,38,39,40,41,42,44,48)
ORDER BY c.id;

