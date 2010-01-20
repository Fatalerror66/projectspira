-----------------------------------
--	Author: Arcanedemon, Aurelias
-- 	Sharin-Garin
-- 	Gives out runic portal permits, depending on rank, imperial standing and AC.
-----------------------------------
--	Param 1 (Nothing seemingly)
--	Param 2(Mercenary Check)
--	Param 3(Does player already have runic pass?)
--	Param 4(Players Imperial Standing)
--	Param 5(Is Astral Candescence there?)
--	Param 6(Cost)
--	Param 7(Is player Captian rank?)
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	astral = getGlobalVar("AstralCandescence")
	runicpass = player:hasKeyItem(0x30E)
	cost = 200 --200 IS to get a permit
	captain = player:hasKeyItem(0x38D)
	impstanding = 200 --No function yet
	merc = 2 --Probably could be done, but not really important atm
	
	--print("AC:",astral);
	--print("Runic Pass:",runicpass);
	--print("Cost:",cost);
	--print("Captain:",captain);
	--print("Imperial Standing:",impstanding);
	
	sharingarin = Event(0x8C);
	sharingarin:setParams(0,merc,runicpass,impstanding,astral,cost,captain);
	player:startEvent(sharingarin);
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
--print("RESULT:",option);

if(csid == 0x8C and option == 1) then
	player:addKeyItem(0x30E);
	player:specialMessage(23,0x30E);
	--take IS
	elseif(csid == 0x8C and option == 2)then
			player:addKeyItem(0x30E);
			player:specialMessage(23,0x30E);
			else
	end
end;