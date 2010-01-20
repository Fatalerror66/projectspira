--	Author: ReaperX, Tenjou
-- 	CoP Mission 1.1 "The Rites of Life" initial CS


require("/scripts/globals/common");
require("/scripts/globals/settings");

-- 0003 menu -> port animation -> fade darkness
-- 0004 menu -> port animation -> fade darkness
-- 000E port animation

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cop_status = player:getMissionStatus(6,1); --The Rites of Life
player:setVar("porter_lock",0);
if (cop_status == 0) then
	--Awesome opening CS
	cs = 0x16;
	player:currentMission(6,1); --Start Promathia Mission "The Rites of Life"
else
  cs = -1;
end
return cs;
end;

---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize()
registerRegion(0xb8, 1, 403, 409, -34, -33 , 83, 89 ); -- Third Floor G-6 porter to Middle Delkfutt's Tower
registerRegion(0xb8, 2, 390, 397, -34, -33 ,-49,-43 ); -- Third Floor G-6 porter to Middle Delkfutt's Tower "1"
--print("Lower Delkfutt's Tower Teleporters initialized.")
end 

function onRegionEnter(player, regionID)

if (player:getVar("porter_lock") == 0) then
  switch (regionID): caseof {
  ---------------------------------
  [1] = function (x)
  ---------------------------------
    --print("starting event 3")
    player:setVar("porter_lock",1);
    player:startEvent(Event(3));
  end,

  ---------------------------------
  [2] = function (x)
  ---------------------------------
    --print("starting event 4")
    player:setVar("porter_lock",1);
    player:startEvent(Event(4));
  end,

  default = function (x)
  --print("default");
  end,}
end;
end;
 
---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 3) then
  player:setVar("porter_lock",0);
  if (option == 1) then
    player:setPos(-28 , -48 , 80, 111, 0x9d);
  end;
elseif (csid == 4) then
	player:setPos(-51 , -48 , -40, 246, 0x9d);
	if (option == 1) then
	  player:setVar("porter_lock",0);
	end;
end;
end;