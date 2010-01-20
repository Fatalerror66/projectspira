-----------------------------------
--	Author: ReaperX
-- 	Quasilumin
--  For the 20 Quasilumins in Al'taieu. Talk to all 20 to get the map.
--  ***** All dialogs verified on retail *****
-----------------------------------
-- the NPC IDs and text IDs for the quasis are in the same order, so
-- a simple shift suffices to convert NPC ID into text ID, with one
-- exception: Quasilumin #16 (the one right at the ramp to the palace
-- has two texts:
-- Text 1: "You wish to open the gate to the Grand Palace of Hu'Xzoi? Then you must first visit the outer towers."
-- This one is given when you are on CoP mission 8-1. After you gain entrance to the palace, this changes to
-- Text 2: "We are unable to enter the Grand Palace of Hu'Xzoi. Beings of our nature are not permitted inside."
-- I verified on retail that quasi #16 gives text 2 on a char that has completed CoP missions. I couldn't verify
-- text 1.

base_id = 16912958; -- ID of the first Quasilumin NPC in the database
dialog_offset = 1110; -- "I...don't know... I don't know anything..."

MapOfAltaieu = 0x1BC;

require("scripts/globals/settings");
package.loaded["scripts/zones/Altaieu/TextIDs"] = nil;
require("scripts/zones/Altaieu/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
id = npc:getId();
d = id - base_id;
quasilumin_status = player:getVar("quasilumin_status");

if (quasilumin_status < 1048575) then 	-- only give usual dialog if we are not on final click of the map quest.
	if (d == 15) and (player:getMissionStatus(6,59) == 1) then -- special handling for this Quasilumin if player is on CoP Mission 8-1
		player:showText(npc, dialog_offset + 16);
	elseif (d <= 15) then
		player:showText(npc, dialog_offset + d);
	else
		player:showText(npc, dialog_offset + d + 1); -- needed to skip one text ID as explained above.
	end;
end;

if (player:hasKeyItem(MapOfAltaieu) == 0) then -- for map quest
	-- need to break up this number into its bits now, doing it manually because I don't know any lua function that
	-- can do this.
	if (quasilumin_status == 1048575) then -- all 20 bits are set - map quest complete!
		player:addKeyItem(MapOfAltaieu);
		player:showText(npc, dialog_offset + 21); -- "You seem unfamiliar with the city of Al'Taieu. Perhaps this may assist you in your travels."
		player:specialMessage(KEYITEM_OBTAINED, MapOfAltaieu);
		player:setVar("quasilumin_status",0);
	else
		bit = {}
		for i = 19,0,-1 do 
			twop = 2^i
			if (quasilumin_status >= twop) then
				bit[i]=1;
				quasilumin_status = quasilumin_status - twop;
			else
				bit[i]=0;
			end;
		end;
		bit[d] = 1; -- we have talked to this quasi.
		for i = 0,19 do 
			quasilumin_status = quasilumin_status + (2^i)*bit[i];
		end
		player:setVar("quasilumin_status",quasilumin_status);
		--print("Quasilumin Status = ",quasilumin_status);
	end;
end
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
 end;