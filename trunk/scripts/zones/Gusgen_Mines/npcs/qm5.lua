-----------------------------------
--	Author: Aurelias
-- 	??? 
--	Spawns Puddings for Eco Warrior
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------


function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	bast = player:getVar("eco_warrior_bast")
	spawned = getGlobalVar("GusgenPudding");
	
if(spawned == 1)then
	player:specialMessage(957);
elseif(bast == 2) then
	loc = Zone(0xC4);
	loc:spawnMob("Pudding",19.874,-60.100,-20.569,191,player:getId()); 
	loc:spawnMob("Pudding",25.218,-60.100,-17.630,191,player:getId()); 
	player:specialMessage(955);
elseif(bast == 3) then
	player:specialMessage(23,0x1D9);
	player:setVar("eco_warrior_bast",4)
	player:addKeyItem(0x1D9); --gives player keyitem
else
	player:specialMessage(957);
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