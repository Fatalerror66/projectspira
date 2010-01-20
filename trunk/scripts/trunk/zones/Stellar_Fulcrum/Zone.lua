--	Author: ReaperX
-- 	Teleporters

require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------


---------------------------------
-- onZoneIn
---------------------------------
function onZoneIn(player,prevZone)
player:setVar("porter_lock",0);
cs = -1;
return cs;
end;


---------------------------------
-- onInitialize
---------------------------------

function onInitialize(zone)
registerRegion(0xb3, 1, -522, -517, -2, -1,  -49,  -43 ); -- To Upper Delkfutt's Tower
--print("Stellar Fulcrum Teleporter initialized.")
end;

function onRegionEnter(player, regionID)

if (player:getVar("porter_lock") == 0) and (regionID == 1) then
  player:setVar("porter_lock",1);
  player:startEvent(Event(8));
end;
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid ==8) then
 if (option == 1) then
    player:setPos(-370 , -178 , -40, 243, 0x9e);
end;
 player:setVar("porter_lock",0);
end;
end;



