---------------------------------
-- Includes
---------------------------------
require("/scripts/globals/common");
require("/scripts/globals/settings");
require("/scripts/globals/status");
---------------------------------
---------------------------------
-- Initialization
ZONE_ID = 0x93;
---------------------------------
-- onZoneIn
---------------------------------
function onZoneIn(player,prevZone)
cs = -1;
musketeers_status = player:getMissionStatus(1,10); 
mission_status =  player:getVar("mission_status");

if (musketeers_status == 1) and (mission_status == 2) then
  cs = 0x78;
  player:setVar("mission_status",3); -- quadav killing (can't be implemented right now)
  -- in my tests, this CS failed to play about half the time. No idea why.
end;
return cs;
end;

---------------------------------
-- onInitialize
---------------------------------
function onInitialize(zone)
---------------------------------
-- Aflictor
-- registerRegion(zoneID,regionID,west,east,high,low,south,north)
registerRegion(0x93,1,-151,-128,23,24.2,9,33);
---------------------------------
-- Beadeaux Coffer/Chest anti-RTM measures
setGlobalVar("["..ZONE_ID.."]TreasureCoffer",0);
setGlobalVar("["..ZONE_ID.."]TreasureChest",0);
--print("Beadeaux coffers/chests illusion time reset.");
---------------------------------
end;

---------------------------------
-- onRegionEnter
---------------------------------
function onRegionEnter(player, regionID)
switch (regionID): caseof {
---------------------------------
[1] = function (x)  -- The Aflictor --
---------------------------------
	if(player:getQuestStatus(1,34) == 1 and player:getVar("TCC_Curse_tempVar") == 0)then
		player:setVar("TCC_Curse_tempVar",1);
	end
	curse = player:getStatusEffect(EFFECT_CURSE);
	 mute = player:getStatusEffect(EFFECT_MUTE);
	if( curse == nil and mute == nil)then
		player:addStatusEffect(EFFECT_CURSE,75,0,300);
	end
end,

default = function (x)
end,}

end;