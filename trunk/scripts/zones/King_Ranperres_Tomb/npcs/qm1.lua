-----------------------------------
--	Author: Aurelias
-- 	???
-- 	Teleports player to lower level!
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/King_Ranperres_Tomb/TextIDs"] = nil;
require("scripts/zones/King_Ranperres_Tomb/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	player:startEvent(Event(0xA));	
end;

-----------------------------------
-- Default function to be called when no callback function is specified.
-----------------------------------
function onEventSelection(player,csid,option)
	if(option == 100) then
		player:updateEvent(0x64,5,6,0,0,0,0,0xbe)
	end
end; 