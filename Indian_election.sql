select 
distinct count(parliament_constituency) As Total_Seats
from constituencywise_results;


select
s.state as state_name,
COUNT(cr.parliament_constituency) as Total_Seats
from constituencywise_results cr
INNER JOIN statewise_results sr on
cr.parliament_constituency = sr.parliament_constituency
INNER JOIN states s on sr.state_id = s.state_id 
group by s.state;

select
	SUM(CASE 
		WHEN Party IN(
			'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')
                THEN WON
			ELSE 0
		END) as NDA_Total_Seats_Won
from partywise_results;
            
select 
	party as Party_Name,
	won as Seats_Won
from 
	partywise_results
where
            Party IN(
			'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')
ORDER BY Seats_Won desc;

SELECT 
    SUM(CASE 
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN Won
            ELSE 0 
        END) AS INDIA_Total_Seats_Won
FROM 
    partywise_results;

SET SQL_SAFE_UPDATES = 0;

select party as Party_Name, won as Seats_Won
FROM 
partywise_results
where party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            )
order by won desc;

ALTER TABLE partywise_results
ADD party_alliance VARCHAR(100);

UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP', 'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
 'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI', 'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC', 'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD', 'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP', 'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);

UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE Party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);

UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;

#Winning Candidate’s name, their party name, total votes, and the margin of victory for a specific state and constituency?

select cr.winning_candidate, pr.party, pr.party_alliance, cr.total_votes, 
cr.margin, cr.constituency_name, s.state
from constituencywise_results cr JOIN partywise_results pr
ON cr.party_id = pr.party_id
JOIN statewise_results sr ON cr.parliament_constituency = sr.parliament_constituency
JOIN states s ON sr.state_id = s.state_id
where s.state = 'Uttar Pradesh' and cr.constituency_name = 'GHAZIABAD';

#What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
SELECT 
    cd.candidate, cd.party,
    cd.EVM_votes, cd.postal_votes,
    cd.total_votes, cr.constituency_name
FROM constituencywise_details cd
RIGHT JOIN constituencywise_results cr
ON cd.constituency_id = cr.constituency_id
WHERE cr.constituency_name = 'GHAZIABAD'
order by total_votes desc;

SELECT * FROM constituencywise_details WHERE EVM_votes IS NOT NULL LIMIT 10;

 
 
 

SELECT 
		p.party,
		COUNT(cr.Constituency_ID) AS Seats_Won
	FROM 
		constituencywise_results cr
	JOIN 
		partywise_results p ON cr.Party_ID = p.Party_ID
	JOIN 
		statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
	JOIN states s ON sr.State_ID = s.State_ID
	WHERE 
		s.state = 'Andhra Pradesh'
	GROUP BY 
		p.party
	ORDER BY 
		Seats_Won DESC;


#Which parties won the most seats in a state and how many seats did each party won?

select pr.party, count(cr.constituency_name)
from partywise_results pr JOIN constituencywise_results cr
ON pr.party_id = cr.party_id 
JOIN statewise_results sr
ON cr.parliament_constituency = sr.parliament_constituency
JOIN states s ON sr.state_id = s.state_id
WHERE 
    s.state = 'Andhra Pradesh'
group by pr.party
order by pr.party;

select s.state, 
SUM(CASE when pr.party_alliance= 'NDA' then 1 else 0 end) as NDA_seats_won,
SUM(CASE when pr.party_alliance= 'I.N.D.I.A' then 1 else 0 end) as INDIA_seats_won,
SUM(CASE when pr.party_alliance= 'OTHER' then 1 else 0 end) as OTHER_seats_won
from partywise_results pr JOIN constituencywise_results cr
ON pr.party_id = cr.party_id 
JOIN statewise_results sr
ON cr.parliament_constituency = sr.parliament_constituency
JOIN states s ON sr.state_id = s.state_id
group by s.state;

SELECT 
cd.candidate,
cd.party,
cd.EVM_votes,
cr.constituency_name 
FROM constituencywise_details cd
INNER JOIN constituencywise_results cr ON cd.Constituency_ID =cr.Constituency_ID
ORDER BY cd.EVM_votes DESC
limit 10;


WITH RankedCandidates AS (
    SELECT 
        cd.constituency_id,
        cd.candidate,
        cd.party,
        cd.EVM_votes,
        cd.postal_votes,
        cd.EVM_votes + cd.postal_votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.constituency_id ORDER BY cd.EVM_votes + cd.postal_votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.constituency_id = cr.constituency_id
    JOIN 
        statewise_results sr ON cr.parliament_constituency = sr.parliament_constituency
    JOIN 
        states s ON sr.state_id = s.state_id
    WHERE 
        s.state = 'Maharashtra'
)

SELECT 
  cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.candidate END) AS Runnerup_Candidate
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.constituency_id = cr.constituency_id
GROUP BY 
    cr.constituency_name
ORDER BY 
    cr.constituency_name;


select 
COUNT(DISTINCT cr.constituency_id) as Total_Seats,
COUNT(DISTINCT cd.candidate) as Total_Candidates,
COUNT(DISTINCT cd.party) as Total_Parties,
SUM(cd.EVM_votes) as Total_EVM_votes, 
SUM(cd.postal_votes) as Total_postal_votes, 
SUM(cd.total_votes) as Total_Votes
from constituencywise_details cd JOIN constituencywise_results cr
ON cd.constituency_id = cr.constituency_id
JOIN statewise_results sr ON cr.parliament_constituency = sr.parliament_constituency
JOIN states S ON sr.state_id = S.state_id
JOIN partywise_results pr ON cr.party_id = pr.party_id
where S.state = 'Maharashtra';


SET SQL_SAFE_UPDATES = 0;






