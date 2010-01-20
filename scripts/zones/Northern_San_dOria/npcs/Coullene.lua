-- Auto-Generated Script from FFXImonV3 
-- By: Mana  
----------------------------------- 
-- onTrade Action 
----------------------------------- 
function onTrade(player,npc,trade) 
 	coullene = player:getVar("coullene")
	sandyQuest16 = player:getQuestStatus(0,16)
	item1 = trade:hasItemQty(532,1);
	if item1 == true then
		if sandyQuest16 == 1 and coullene == 0 then
			player:setVar("coullene",1)
			player:specialMessage(0x8fd)
			player:showText(npc,0x8fc)
			trade:isComplete()
		elseif sandyQuest16 == 1 and coullene == 1 then
			player:specialMessage(0x8fe)
		end
	end 
end; 
----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 
player:showText(npc,1497) 
end; 
