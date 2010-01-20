-----------------------------------
--	Author: Aurelias
-- 	Celestina
-- 	Involved in the Sand Charm quest, no shop yet.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
require("scripts/zones/Mhaura/TextIDs");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
charm = player:getVar("The_Sand_Charm");

if(charm == 4)then
	celestina = Event(0x7e);
	celestina:setParams(13095);
	player:startEvent(celestina);
		else
	end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
charm = player:getVar("The_Sand_Charm");
sandcharm = trade:hasItemQty(0x3327,1);
count = trade:getItemCount();

if(count == 1 and sandcharm and charm == 5) then
	player:startEvent(Event(0x7f));
	else
	end

end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if(csid == 0x7e and option == 70)then
player:addQuest(4,8);
		player:setVar("The_Sand_Charm",5);
		end
if(csid == 0x7f) then
	player:removeItem(0x3327)
	player:specialMessage(23,0x18a); 
	player:addKeyItem(0x18a)
	player:completeQuest(4,8)
	player:setVar("The_Sand_Charm",100);
	else
end

end;