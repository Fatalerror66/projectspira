---------------------------------------
-- Author: Almendro
-- ??? (qm4.lua)
-- Involved in "Lovers in the Dusk" quest
---------------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");
---------------------------------------
-- Initialization
ChansondeLiberte = 0x156;
SirenFlute = 17346;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	LoversintheDusk = player:getQuestStatus(1,63);
	hour = getVanaHour();
	if(LoversintheDusk == 1 and player:hasKeyItem(ChansondeLiberte) and hour >= 16 and hour < 18)then
		player:startEvent(Event(0xCC));
	elseif(LoversintheDusk == 1 and player:hasKeyItem(ChansondeLiberte))then
		player:specialMessage(1530); -- Carmelo said something about the hues of dusk...
	else
		player:specialMessage(1529); -- There is nothing out of the ordinary here.
	end
end;


-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if(csid == 0xCC)then
	player:completeQuest(1,63);
	player:removeKeyItem(ChansondeLiberte);
	player:addItem(SirenFlute);
	player:specialMessage(ITEM_OBTAINED,SirenFlute);
	player:addFame(1,BAS_FAME*150);
end
end;