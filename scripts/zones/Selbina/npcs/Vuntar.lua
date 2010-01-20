-----------------------------------
--	Author: Arcanedemon, Aurelias
-- 	Vuntar
-- 	Cargo Quest
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
require("scripts/zones/Selbina/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
cargo = player:getVar("Cargo_Selbina");
if(cargo == 1) then
player:startEvent(Event(0x0033)); --Intro CS
else
player:startEvent(Event(0x0032)); --Starting quest CS
player:setVar("Cargo_Selbina",1);
player:addQuest(4,20);
end
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

cargo = player:getVar("Cargo_Selbina");
berry881 = trade:hasItemQty(0x11b1,1);
berry874 = trade:hasItemQty(0x11b2,1);
berry864 = trade:hasItemQty(0x11b3,1);
count = trade:getItemCount();

if(count == 1 and cargo == 1 and berry881) then --'rolanberry (881 C.E.)'
player:startEvent(Event(0x0034)); --Reward CS
player:setVar("Cargo_Selbina",881);
else
if(count == 1 and cargo == 1 and berry874) then --'rolanberry (874 C.E.)'
player:startEvent(Event(0x0034)); --Reward CS
player:setVar("Cargo_Selbina",874);
else
if(count == 1 and cargo == 1 and berry864) then --'rolanberry (864 C.E.)'
player:startEvent(Event(0x0034)); --Reward CS
player:setVar("Cargo_Selbina",864);
end
end
end

end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
cargo = player:getVar("Cargo_Selbina");
if(csid == 0x34 and cargo == 881) then
	player:setVar("Cargo_Selbina",1);
	player:specialMessage(21,800);
	player:addGil(GIL_RATE*800)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*800);
	player:removeItem(0x11b1)
	player:completeQuest(4,20);
	else
	if(csid == 0x34 and cargo == 874) then
	player:setVar("Cargo_Selbina",1);
	player:addGil(GIL_RATE*2000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*2000);
	player:removeItem(0x11b2)
	player:completeQuest(4,20);
	else
	if(csid == 0x34 and cargo == 864) then
	player:setVar("Cargo_Selbina",1);
	player:addGil(GIL_RATE*3000)
	player:specialMessage(GIL_OBTAINED,GIL_RATE*3000);
	player:removeItem(0x11b3)
	player:completeQuest(4,20);
	else
	end
	end
	end
end;