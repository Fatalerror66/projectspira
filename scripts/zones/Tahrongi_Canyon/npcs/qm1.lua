-----------------------------------
--	Author: Aurelias
--	???
--	Spawns The Goblin Archaeologist
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- Initialization
betweentrades = 1800; --How long till the player can trade another item
-----------------------------------
--onTrigger Action--
-----------------------------------
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
history = player:getVar("archaeologist_Tah_Canyon");
goblin = getGlobalVar("archaeologist_Tah_Canyon")
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

if(goblin == 0) then
	player:showText(npc,01010);
	player:specialMessage(01020);
elseif(goblin == 1)then
	player:showText(npc,01010);
	player:specialMessage(01019);
elseif(goblin == 2)then
	player:showText(npc,01010);
	player:specialMessage(01018);
elseif(goblin == 3)then
	player:showText(npc,01010);
	player:specialMessage(01017);
elseif(goblin == 4)then
	player:showText(npc,01010);
	player:specialMessage(01016);
elseif(goblin == 5)then
	player:showText(npc,01010);
	player:specialMessage(01015);
elseif(goblin == 6)then
	player:showText(npc,01010);
	player:specialMessage(01014);
elseif(goblin == 7)then
	player:showText(npc,01010);
	player:specialMessage(01013);
end
end; 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
history = player:getVar("archaeologist_Tah_Canyon");
goblin = getGlobalVar("archaeologist_Tah_Canyon")
npcX = npc:getXPos();
npcY = npc:getYPos();
npcZ = npc:getZPos();

if(count == 1 and history < os.time() and goblin == 0)then
	trade:isComplete();
	player:showText(npc,01035);
	player:specialMessage(01019);
	setGlobalVar("archaeologist_Tah_Canyon",1)
	player:setVar("archaeologist_Tah_Canyon",os.time() + betweentrades);
	
elseif(count == 1 and history < os.time() and goblin == 1)then
	trade:isComplete();
	player:showText(npc,01034);
	player:specialMessage(01018);
	setGlobalVar("archaeologist_Tah_Canyon",2)
	player:setVar("archaeologist_Tah_Canyon",os.time() + betweentrades);
	
elseif(count == 1 and history < os.time() and goblin == 2)then
	trade:isComplete();
	player:showText(npc,01033);
	player:specialMessage(01017);
	setGlobalVar("archaeologist_Tah_Canyon",3)
	player:setVar("archaeologist_Tah_Canyon",os.time() + betweentrades);
	
elseif(count == 1 and history < os.time() and goblin == 3)then
	trade:isComplete();
	player:showText(npc,01032);
	player:specialMessage(01016);
	setGlobalVar("archaeologist_Tah_Canyon",4)
	player:setVar("archaeologist_Tah_Canyon",os.time() + betweentrades);

elseif(count == 1 and history < os.time() and goblin == 4)then
	trade:isComplete();
	player:showText(npc,01031);
	player:specialMessage(01015);
	setGlobalVar("archaeologist_Tah_Canyon",5)
	player:setVar("archaeologist_Tah_Canyon",os.time() + betweentrades);

elseif(count == 1 and history < os.time() and goblin == 5)then
	trade:isComplete();
	player:showText(npc,01030);
	player:specialMessage(01014);
	setGlobalVar("archaeologist_Tah_Canyon",6)
	player:setVar("archaeologist_Tah_Canyon",os.time() + betweentrades);

elseif(count == 1 and history < os.time() and goblin == 6)then
	trade:isComplete();
	player:showText(npc,01029);
	player:specialMessage(01013);
	setGlobalVar("archaeologist_Tah_Canyon",7)
	player:setVar("archaeologist_Tah_Canyon",os.time() + betweentrades);
	
elseif(count == 1 and history < os.time() and goblin == 7)then
	trade:isComplete();
	player:showText(npc,01010);
	player:specialMessage(01012);
	setGlobalVar("archaeologist_Tah_Canyon",0)
	player:setVar("archaeologist_Tah_Canyon",0);
	loc = Zone(0x75);
	loc:spawnMob("GoblinArchaeol",npcX,npcY,npcZ,128,player:getId());
else
	player:specialMessage(01011);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;