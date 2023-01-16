-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT campaign.backers_count, campaign.cf_id, campaign.outcome
FROM campaign
WHERE (campaign.outcome = 'live')
ORDER BY campaign.backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT (backer.cf_id), backer.cf_id
FROM backers
GROUP BY backer.cf_id
ORDER BY COUNT(backer.cf_id) DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT con.first_name, con.last_name, con.email (campaign.goal - campaign.pledged) as remaining_goal_amount
INTO email_contacts_remaining_goal_amount
FROM campaign
INNER JOIN contacts as con
ON (campaign.contact_id = con.contact_id)
WHERE (campaign.outcome = 'live')
ORDER BY remaining_goal_amount DESC;



-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT backers.email, backers.first_name, backers.last_name, campaign.cf_id, 
campaign.company_name, campaign.description, (campaign.goal - campaign.pledged) as
left_of_goal
INTO email_backers_remaining_goal_amount
FROM campaign
INNER JOIN backers
ON (campaign.cf_id = backers.cf_id)
WHERE (campaign.outcome = 'live')
ORDER BY backers.last_name, backers.email DESC;


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;

