-----------------------------------
--	Author: JesseJames Jax
-- 	Rosel
-- 	"Rosel the Armorer" Quest completed
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");
function onTrigger(player,npc)
RoseltheArmorer = player:getQuestStatus(0,2);
Reciept = 0x0077;
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	if (RoseltheArmorer == 0) then
		player:startEvent(Event(0x020b));
	elseif (player:getVar("DeliveredtoGuilerme") == 2) then
		player:startEvent(Event(0x020f));
	elseif (RoseltheArmorer == 1) then
		player:startEvent(Event(0x020c));
	end

end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	end
 	rosel = player:getVar("rosel")
	sandyQuest16 = player:getQuestStatus(0,16)
	item1 = trade:hasItemQty(532,1);
	if item1 == true then
		if sandyQuest16 == 1 and rosel == 0 then
			player:setVar("rosel",1)
			player:specialMessage(2129)
			player:showText(npc,0x446)
			trade:isComplete()
		elseif sandyQuest16 == 1 and rosel == 1 then
			player:specialMessage(2130)
		end
	end

end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)


	if (csid == 0x020b and option == 0) then
		player:addKeyItem(Reciept);
		player:addQuest(0,2);
		player:setVar("DeliveredtoGuilerme",1)
		player:specialMessage(KEYITEM_OBTAINED,Reciept);
	elseif (csid == 0x020f and player:getVar("Prince") == 1) then
		player:setVar("DeliveredtoGuilerme",0)
		player:setVar("Prince",0)
		player:addGil(200)
		player:specialMessage(GIL_OBTAINED,200);
		player:completeQuest(0,2);
		player:addFame(0,SAN_FAME*30);
		player:setTitle(54); -- 	 Entrance Denied
	elseif (csid == 0x020f and player:getVar("Prince") == 2) then
		player:setVar("DeliveredtoGuilerme",0)
		player:setVar("Prince",0)
		player:addGil(100)
		player:specialMessage(GIL_OBTAINED,100);
		player:completeQuest(0,2);
		player:addFame(0,SAN_FAME*30);
		player:setTitle(54); -- 	 Entrance Denied
	end
end;