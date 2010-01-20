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
history = player:getVar("archaeologist_La_Theine");
goblin = getGlobalVar("archaeologist_La_Theine")
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

if(goblin == 0) then
	player:showText(npc,01167);
	player:specialMessage(01177);
elseif(goblin == 1)then
	player:showText(npc,01167);
	player:specialMessage(01176);
elseif(goblin == 2)then
	player:showText(npc,01167);
	player:specialMessage(01175);
elseif(goblin == 3)then
	player:showText(npc,01167);
	player:specialMessage(01174);
elseif(goblin == 4)then
	player:showText(npc,01167);
	player:specialMessage(01173);
elseif(goblin == 5)then
	player:showText(npc,01167);
	player:specialMessage(01172);
elseif(goblin == 6)then
	player:showText(npc,01167);
	player:specialMessage(01171);
elseif(goblin == 7)then
	player:showText(npc,01167);
	player:specialMessage(01170);
end
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
history = player:getVar("archaeologist_La_Theine");
goblin = getGlobalVar("archaeologist_La_Theine");
npcX = npc:getXPos();
npcY = npc:getYPos();
npcZ = npc:getZPos();

if(count == 1 and history < os.time() and goblin == 0)then
	trade:isComplete();
	player:showText(npc,01192);
	player:specialMessage(01176);
	setGlobalVar("archaeologist_La_Theine",1)
	player:setVar("archaeologist_La_Theine",os.time() + betweentrades);
	
elseif(count == 1 and history < os.time() and goblin == 1)then
	trade:isComplete();
	player:showText(npc,01191);
	player:specialMessage(01175);
	setGlobalVar("archaeologist_La_Theine",2)
	player:setVar("archaeologist_La_Theine",os.time() + betweentrades);
	
elseif(count == 1 and history < os.time() and goblin == 2)then
	trade:isComplete();
	player:showText(npc,01190);
	player:specialMessage(01174);
	setGlobalVar("archaeologist_La_Theine",3)
	player:setVar("archaeologist_La_Theine",os.time() + betweentrades);

elseif(count == 1 and history < os.time() and goblin == 3)then
	trade:isComplete();
	player:showText(npc,01189);
	player:specialMessage(01173);
	setGlobalVar("archaeologist_La_Theine",4)
	player:setVar("archaeologist_La_Theine",os.time() + betweentrades);

elseif(count == 1 and history < os.time() and goblin == 4)then
	trade:isComplete();
	player:showText(npc,01188);
	player:specialMessage(01172);
	setGlobalVar("archaeologist_La_Theine",5)
	player:setVar("archaeologist_La_Theine",os.time() + betweentrades);

elseif(count == 1 and history < os.time() and goblin == 5)then
	trade:isComplete();
	player:showText(npc,01187);
	player:specialMessage(01171);
	setGlobalVar("archaeologist_La_Theine",6)
	player:setVar("archaeologist_La_Theine",os.time() + betweentrades);

elseif(count == 1 and history < os.time() and goblin == 6)then
	trade:isComplete();
	player:showText(npc,01186);
	player:specialMessage(01170);
	setGlobalVar("archaeologist_La_Theine",7)
	player:setVar("archaeologist_La_Theine",os.time() + betweentrades);
	
elseif(count == 1 and history < os.time() and goblin == 7)then
	trade:isComplete();
	player:showText(npc,01185);
	player:specialMessage(01169);
	setGlobalVar("archaeologist_La_Theine",0)
	player:setVar("archaeologist_La_Theine",0);
	loc = Zone(0x66);
	loc:spawnMob("GoblinArchaeol",npcX,npcY,npcZ,34,player:getId());
else
	player:specialMessage(01168);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;