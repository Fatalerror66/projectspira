-----------------------------------
--	Author: Almendro
-- 	??? (qm1.lua)
-- 	Quest involved: "True Strength" http://wiki.ffxiclopedia.org/wiki/True_Strength
-----------------------------------
-- Include
require("scripts/globals/settings");
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
require("scripts/zones/Castle_Oztroja/TextIDs");
-----------------------------------
-- Initialization
Yagudodrink = 4558;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	player:specialMessage(1177); -- A mysterious flame is burning..  (its only a guess)
end; 
 
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	count = trade:getItemCount();
    Yagudodrink1 = trade:hasItemQty(Yagudodrink,1); 
	gil = trade:getGil();
	temp_TrueStrength = player:getVar("temp_TrueStrength");	  
if ( temp_TrueStrength == 1 and count == 1 and Yagudodrink1 and gil == 0) then
	if(os.time() > getGlobalVar("[NM_Dead]Huu_Xalmo_the_Savage"))then
		player:specialMessage(1178,Yagudodrink); -- You hold <a> <item> over the flame... A peculiar scent covers the area.
		trade:isComplete();
		-- display message if there is one
		zone = Zone(player:getZone());
		zone:spawnMob("HuuXalmotheSav",player:getXPos()-1,player:getYPos(),player:getZPos()-1,player:getRot(),player:getId());
	end
elseif(count == 1)then
	--anyother item traded or player who trades a yagudo drink but doesnt have the quest on will display this message
	player:specialMessage(1179,trade:getItem(1)); -- You hold <a> <item> over the flame. But nothing happens.
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;