-----------------------------------
--	Author: Aurelias
-- 	??? 
--	Spawns 3 Wyrmfly for Eco Warrior
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------


function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	wind = player:getVar("eco_warrior_wind")
	spawned = getGlobalVar("ShakhramiWyrmfly");
	
if(spawned == 1)then
	player:specialMessage(955);
elseif(wind == 2) then
	player:specialMessage(884);
	loc = Zone(0xC6);
	loc:spawnMob("Wyrmfly",147.652,9.009,-220.763,191,player:getId()); 
	loc:spawnMob("Wyrmfly",139.379,10.382,-218.744,191,player:getId()); 
	loc:spawnMob("Wyrmfly",130.048,9.649,-214.918,191,player:getId()); 
elseif(wind == 3) then
	player:specialMessage(23,0x1DA);
	player:setVar("eco_warrior_wind",4)
	player:addKeyItem(0x1DA); --gives player keyitem
else
	player:specialMessage(955);
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