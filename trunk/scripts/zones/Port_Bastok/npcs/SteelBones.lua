-----------------------------------
--	Author: Almendro
-- 	Steel Bones
-- 	Guest of Hauteur Quest
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
           Maul = 0x4295;
    ReplicaMaul = 0x4412;
GuestofHauteur = player:getQuestStatus(1,3);
if( GuestofHauteur == 1 and player:getVar("GuestofHauteur") == 1 and (player:getEquip(1) == Maul or player:getEquip(1) == ReplicaMaul) )then
	player:startEvent(Event(0x39));
else
	player:startEvent(Event(0x1D));
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
if(csid == 0x39)then
	player:addKeyItem(0xB); -- Letter from Domien
	player:specialMessage(KEYITEM_OBTAINED,0xB);
	player:setVar("GuestofHauteur",2);
end
end;