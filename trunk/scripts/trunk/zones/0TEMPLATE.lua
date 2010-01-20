-----------------------------------
--	Author: 
-- 	Name of NPC
-- 	Description; please be descript about what this NPC does, what's missing, why, etc.
-----------------------------------

-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/<zone_name>/TextIDs"] = nil;
require("scripts/zones/<zone_name>/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	npcname = npc:getName();
	npcid = npc:getId();
	--print("Name:",npcname);
	--print("NPC ID:",npcid);
	-----------------------------------
	-- Dialogues,cutscenes,etc. go below.
	-----------------------------------
	player:startEvent(Event(0x000)); --Event ID.  May need to set params.
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
	--questflag = player:getVar(""); --Possible quest flags
	item1 = trade:hasItemQty(0x000,1); --Item ID and amount; add more as needed.
	if (count == 1 and item1 == true and questflag == 0) then --# of slots needed, check for item, and check for questflag.
		--Correct trade, usually completes a quest, hence the quest flag.
		player:startEvent(Event(0x000));
	end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	--print("CSID:",csid);
	--print("OPTION:",option);
end;