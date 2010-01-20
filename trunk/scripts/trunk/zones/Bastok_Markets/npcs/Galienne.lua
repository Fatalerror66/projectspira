-----------------------------------
--	Author: ChrisKara10
--  Galienne
--  Chocobo Racing NPC - UNCOMPLETE!!!
-----------------------------------
-- Includes

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
bf = player:getFame(1);
nation = player:getNation();

--print("Name:",npcname);
--print("NPC ID:",npcid);
--print("Bastok Fame",bf);

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
vcschocobo = player:getVar("vcsChocoboRacingAssociate");
	
	if vcschocobo == 0 then
		--- Ask to join the Team ---
		if nation == 1 then
			event0x1CD = Event(0x1CD);
			event0x1CD:setParams(1,3);
			player:startEvent(event0x1CD);
		elseif nation == 0 then
			event0x1CE = Event(0x1CE);
			event0x1CE:setParams(1,1);
			player:startEvent(event0x1CE);
		elseif nation == 2 then
			event0x1CE = Event(0x1CE);
			sendEvent(player,0x01ce,1,1);
			player:startEvent(event0x1CE);
		end
	else
		if vcschocobo == 1 and nation == 1 then
		player:startEvent(Event(0x01cc));
		end
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
	
	--if (csid == 0x1cd and option == 101) then
	--player:setVar("vcsChocoboRacingAssociate",1);	end;
	--end;
end; 