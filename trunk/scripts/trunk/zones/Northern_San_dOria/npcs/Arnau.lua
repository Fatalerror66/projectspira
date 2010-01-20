-- Arnau (CoP mission 3.3A, San d'Oria missions 1-3, 7-2)
-- By: Mana, ReaperX

----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
-- DO NOT DELETE !!! 
-- All sandy NPCs not directly related to Flyers for Regine quest must have this conditional trade script. 
-- it is just a conditional line to say the NPC refused to accept the flyer. 
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then 
		player:specialMessage(1767) 
	end 
end; 

--[[ events:
0026 CoP 3.3 CS (Ulmia and Chasalvige)
0033 CoP 3.3 CS
0014 "The Royal Knight you search for, Francmage M Mistalle, joined the Multinational Expedition 30 years ago.."
0004 "Currently, the Cathedral is conducting preparations for the Rites of Succession." (between 9-1 and 9-2)
0003 "The papsque is currently being held at the Chateau d'Oraguille for questioning on the matters at hand."
0002 "The papsque has returned from Chateau d'Oraguille and will now pay penitence for his sins." 
0217 New adventurer CS
0208 "I shall begin shortly. Should you have any questions, kindly beseech the friar at the narthex."
024D (Abioleget CS for quest "The Vicasque's Sermon")
0247 doesnt do anything
02B5 Sandy Mission 1-3 CS
02B6 Sandy Mission 1-3 CS
0010 (CS showing the coming of age ceremony of the princess;  Rochefogne appears and reveals his identity) between Sandy 8-1 and 8-2
0001 (9-2 opening CS) Shamonde declares the commencement of the rites of succession. Rochefogne appears and triess to take Lightbringer. An orc steals it. Shamonde betrays himself.
--]]

----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
mission_status = player:getVar("mission_status");
cop_status = player:getMissionStatus(6,15);          -- "Vicissitudes"
vicissitudes_status = player:getVar("Vicissitudes"); -- 0 if we only got opening Ulmia CS so far

if (vicissitudes_status == 0) and (cop_status == 1) then
	player:startEvent(Event(0x33));
elseif (player:getMissionStatus(0,2) == 1) and (mission_status == 1) then
	player:startEvent(Event(0x2B5));
elseif (player:getVar("Sandy_1_3_optional_CS") == 1) then
	player:setVar("Sandy_1_3_optional_CS",0);
	player:startEvent(Event(0x2B6));
elseif (player:getMissionStatus(0,22) == 2) and (player:getMissionStatus(0,23) == 0) then
	player:startEvent(Event(0x4)) 	
elseif (player:getMissionStatus(0,23) == 1) and (mission_status == 2 ) then
	player:startEvent(Event(0x3)) 	
elseif ((player:getMissionStatus(0,23) == 1) and (mission_status >= 3)) or ((player:getRank() == 10) and (player:getNation() == 0)) then
	player:startEvent(Event(0x2)) 	
else
 	player:startEvent(Event(0x208)) -- default response, verified on retail
end
end; 


  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x33) then
	player:setVar("Vicissitudes",1);                     -- now we need to get CS from Chasalvige
elseif (csid == 0x2B5) then
	player:setVar("mission_status",2);
end
if (player:getMissionStatus(0,2) == 1) and (mission_status == 2) and (DEBUG_MODE) and (csid == 0x208) then
	player:setPos(-156, -10, 80, 119, 0x8C);			-- to Ghelsba
end

end;