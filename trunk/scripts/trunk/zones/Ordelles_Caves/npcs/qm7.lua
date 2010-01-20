-----------------------------------
--	Author: Aurelias
-- 	??? 
--	Spawns Necroplasm for Eco Warrior
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------


function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	sand = player:getVar("eco_warrior_sand")
	spawned = getGlobalVar("OrdelleNecroplasm");
	
if(spawned == 1)then
	player:specialMessage(915);
elseif(sand == 2) then
	loc = Zone(0xC1);
	loc:spawnMob("Necroplasm",-118.870,32.500,45.690,235,player:getId()); --spawns Necroplasm
	player:specialMessage(985);
elseif(sand == 3) then
	player:specialMessage(182,0x1D8);
	player:setVar("eco_warrior_sand",4)
	player:addKeyItem(0x1D8); --gives player keyitem
else
	player:specialMessage(915);
end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);
-----------------------------------
-- Trades go below.
-----------------------------------

end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;