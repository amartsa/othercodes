////1)Which are the drop off locations with highest Tips between 7 am and 9:30 am? 
////- This should tell us where the richest people WORK 
////ASSUMPTIONS: 
////Richest people tip the most, regardless of fare. 
////Typical Tip is between 10% - 20%, so anything above that is consider above average

MATCH (l1:ComArea)-[tr:TRIPS]->(l2:ComArea)
WHERE tr.dHour IN RANGE(7,9)
WITH toFloat(tr.Tips/tr.Fare) AS TipPercnt,tr,l2
WHERE TipPercnt > 0.20
RETURN COUNT (tr) AS Ntrips, l2.comArea, AVG(TipPercnt) ORDER BY Ntrips DESC

////2)Which are the pick up locations with highest Tips between 6 am and 8 am? 
////- This should tell us where the richest people LIVE
////ASSUMPTIONS: 
////Richest people tip the most, regardless of fare. 
////Typical Tip is between 10% - 20%, so anything above that is consider above average

MATCH (l1:ComArea)-[tr:TRIPS]->(l2:ComArea)
WHERE tr.dHour IN RANGE(6,8)
WITH toFloat(tr.Tips/tr.Fare) AS TipPercnt,tr,l1
WHERE TipPercnt > 0.20
RETURN COUNT (tr) AS Ntrips, l1.comArea, AVG(TipPercnt) ORDER BY Ntrips DESC





	
