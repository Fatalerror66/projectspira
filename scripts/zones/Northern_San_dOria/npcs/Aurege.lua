-- Auto-Generated Script from FFXImonV3 
-- By: Mana 
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
----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
-- 0x204 quest completion event for Aurege
-- 0x206 quest completion event for Guilberdrier
-- 0x209 offer quest "Exit the Gambler"
-- 514 after quest completion text for Aurege
	exitTheGambler = player:getQuestStatus(0,101)
	varchet = player:getVar("varchet")
	if exitTheGambler <= 1 and varchet <= 1 then
		event = Event(0x209)
		if exitTheGambler == 0 then
			player:addQuest(0,101)
		end
	elseif exitTheGambler == 1 and varchet == 2 then
		event = Event(0x204)
		player:completeQuest(0,101)
		player:addFame(0,SAN_FAME*20)
		player:setTitle(51)
		player:addKeyItem(0x187)
	elseif exitTheGambler == 2 then
		event = Event(514)
	end
	player:startEvent(event)
end; 
