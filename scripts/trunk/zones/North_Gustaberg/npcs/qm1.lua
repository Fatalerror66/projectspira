-----------------------------------
--	Author: SharXeniX
--  ???
-- 	Used for quest "The Siren Tear's."
-----------------------------------
-- Includes
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
      TheSirensTear = player:getQuestStatus(1,0);
TheSirensTearRepeat = player:getVar("TheSirensTearRepeat");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (TheSirensTear == 1 or TheSirensTearRepeat == 2) then
		player:startEvent(Event(0xA));
	else
		player:specialMessage(967); -- "The shining object is washed further downstream." need confirmation about this message when you dont have the quest active
	end
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	--yes selected
	if(option == 0) then
		if(player:getEquip(1)>0 or player:getEquip(2)>0 or player:getMainJob() == 2)then
			player:specialMessage(970);			
		else
			if(player:hasItem(576) == 1)then
				player:specialMessage(970);
				-- depopNPC() and appear in another location after 5 minutes or so
			elseif(player:getFreeSlotCount(0)>=1) then
				player:addItem(576);
				player:specialMessage(188,576,1);
				player:setVar("TheSirensTearRepeat",3);
			else
				player:specialMessage(179,576);
			end
		end
	end
end;