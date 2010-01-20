-----------------------------------
--	Author: Aurelias
-- 	???
-- 	Used in quest 'Not meant to be'
-----------------------------------

-- Includes
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	NotMeantToBe = player:getVar("NotMeantToBe");
	lamia = getGlobalVar("CaedarvaMireLamiaNo27");
	mosh = getGlobalVar("CaedarvaMireMoshdahn");
	complete = getGlobalVar("NotMentToBeComplete");
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if(lamia == 1) then
	player:specialMessage(930);
elseif(mosh == 1) then
	player:specialMessage(930);
elseif(complete > os.time() and NotMeantToBe == 4) then
	player:setVar("NotMeantToBe",5);
	player:startEvent(Event(0x12));
elseif(mosh == 2 and lamia == 2 and NotMeantToBe == 4) then
	setGlobalVar("CaedarvaMireLamiaNo27",0);
	setGlobalVar("CaedarvaMireMoshdahn",0);
	setGlobalVar("NotMentToBeComplete",os.time() + 300);
	player:setVar("NotMeantToBe",5);
	player:startEvent(Event(0x12));
elseif(NotMeantToBe == 1) then
	player:startEvent(Event(0x10));
elseif(NotMeantToBe == 3) then
	player:startEvent(Event(0x11));
elseif(NotMeantToBe == 4) then
	player:startEvent(Event(0x13));
else
	player:specialMessage(930);
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
	--print("CSID:",csid);
	--print("OPTION:",option);
if(csid == 0x10) then
	player:setVar("NotMeantToBe",2);	
elseif(csid == 0x11) then
	player:setVar("NotMeantToBe",4);	
elseif(csid == 0x12) then
	player:setVar("NotMeantToBe",6);	
elseif(csid == 0x13) then
	loc = Zone(0x4f);
	loc:spawnMob("LamiaNo.27",449.773,-7,-275.011,52475,player:getId());
	loc:spawnMob("Moshdahn",446.590,-7,-275.282,52224,player:getId());
end
end;