-----------------------------------
-- Utility functions
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
--	Author: Almendro
-- 	Time in real world seconds remaining till 0:00 in Vana'diel
-----------------------------------
function secondsRemainingTillMidnight()
	hours = getVanaHour();
	minutes = getVanaMinute();
	VanaDayInMinutes = 1440;
	currentVanaDayInMinutes = hours*60 + minutes;
	timeRemainingVanaMinutes = VanaDayInMinutes - currentVanaDayInMinutes;
	timeRemainingRealSeconds = math.floor(timeRemainingVanaMinutes*2.4);
	return timeRemainingRealSeconds;
end;

-----------------------------------
--	Author: ReaperX
-- 	CanEquip() provides a common functionality needed by some NPCs selling 
--  gear, such as conquest gate guards and Assault NPCs. Returns 0 if the
--  player's job can't equip the item, 1 if the level is merely too low, 2
--  if the item can currently be equipped. The necessary LUA functions to 
--  make this determination are currently missing so the function just returns
--  2 for now.
-----------------------------------

function canEquip(player, itemid)
return 2;
end;

-----------------------------------
--	Author: ReaperX
-- 	Returns 1 if player has sea access, 0 otherwise.
-----------------------------------

function SeaAccess(player)
	if (player:getMissionStatus(6, 57) == 2) then -- CoP 7.5 "The Warrior's Path"
	-- this didn't work when I tested it, even though it should be straightforward.
		value = 1;
	else
		value = 0;
	end;
	return 1; -- hardcoded 1 for now to give everyone sea acess.
end;