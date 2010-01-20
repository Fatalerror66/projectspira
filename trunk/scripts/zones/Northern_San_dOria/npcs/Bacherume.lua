-- Auto-Generated Script from FFXImonV3 
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

--- events: ---
-- 0x0036 : can't let you into the castle until the rites of succession have taken place
-- 0x0238 : "hey! who said you could go in? Get back here, scum!"
-- 0x0239 : ?
-- 0x032A : CS for Aht Urhgan Mission 5: "Confessions of Royalty"

----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 

emissary_status1 = player:getMissionStatus(1,6);      -- The Emissary (San d'Oria) (Sandy 1st path)
emissary_status2 = player:getMissionStatus(1,8);      -- The Emissary (San d'Oria) (Sandy 2nd path)

mission_status = player:getVar("mission_status");
--print("Mission Status : ",mission_status);

if (player:hasKeyItem(311) == 1) then -- Raillefal's letter
  player:startEvent(Event(0x032A)) 
elseif ((emissary_status1 > 0) and (mission_status >= 3)) or ((emissary_status2 > 0) and (mission_status > 15)) or (player:getRank() >=3) then
  player:showText(npc,1614) 
elseif (emissary_status == 0) and (player:getNation() ~= 0) then -- not San d'Orian and not on mission
 player:startEvent(Event(0x0238)) 
elseif (player:getNation() == 2) and (player:getRank() <2) then
 player:startEvent(Event(0x0036)) 
else
  player:showText(npc,1612) 
end
end; 
