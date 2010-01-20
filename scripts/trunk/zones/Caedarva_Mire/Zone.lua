-----------------------------------
--	Author: Aurelias
--	Entering the swamps gives Weight, Haste or Flee Icons
-----------------------------------

require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
cs = -1;
return cs;
end;


function onInitialize()

--registerRegion(zoneID, regionID, west, east, high, low , south, north ); 

registerRegion(0x4F, 1,  450, 466, -5, -7 , -344, -333 );
registerRegion(0x4F, 2,  451, 464, -5, -7 , -313, -298 );  
registerRegion(0x4F, 3,  295, 303, -13, -15 , -384, -370 );  
registerRegion(0x4F, 4,  296, 306, -13, -15 , -351, -341 );  
registerRegion(0x4F, 5,  139, 143, -5, -7 , -187, -175 );

	WeightTimer = 10
	HasteTimer = 60
	FleeTimer = 60
	QuickeningTimer = 60
	StoneskinTimer = 60
	SlowTimer = 60

--print("Caedarva Mire Swamps Initialized.");
	--Clear Quests
	setGlobalVar("CaedarvaMireLamiaNo27",0);
	setGlobalVar("CaedarvaMireMoshdahn",0);
	setGlobalVar("NotMentToBeComplete",0);
end

function onRegionEnter(player, regionID)

WEIGHT = player:getStatusEffect(EFFECT_WEIGHT);
HASTE = player:getStatusEffect(EFFECT_HASTE);
FLEE = player:getStatusEffect(EFFECT_FLEE);
QUICKENING = player:getStatusEffect(EFFECT_QUICKENING);
STONESKIN = player:getStatusEffect(EFFECT_STONESKIN);
SLOW  = player:getStatusEffect(EFFECT_SLOW);

switch (regionID): caseof {
---------------------------------
[1] = function (x)  
---------------------------------

if(WEIGHT == nil and HASTE == nil and FLEE == nil and QUICKENING == nil and STONESKIN == nil and SLOW == nil) then
	badeffect = math.random(1,10);
if(badeffect > 2) then
	player:addStatusEffect(EFFECT_WEIGHT,0,0,WeightTimer);
	player:specialMessage(907);
elseif(badeffect < 2) then
	goodeffect = math.random(1,5);
if(goodeffect == 1)then
	player:addStatusEffect(EFFECT_HASTE,0,0,HasteTimer);
	player:specialMessage(908);
elseif(goodeffect == 2)then
	player:addStatusEffect(EFFECT_FLEE,0,0,FleeTimer);
	player:specialMessage(908);
elseif(goodeffect == 3)then
	player:addStatusEffect(EFFECT_QUICKENING,0,0,QuickeningTimer);
	player:specialMessage(908);
elseif(goodeffect == 4)then
	player:addStatusEffect(EFFECT_STONESKIN,0,0,StoneskinTimer);
	player:specialMessage(908);
elseif(goodeffect == 5)then
	player:addStatusEffect(EFFECT_SLOW,0,0,SlowTimer);
	player:specialMessage(908);
end
end
end
end,

---------------------------------
[2] = function (x)  
---------------------------------
if(WEIGHT == nil and HASTE == nil and FLEE == nil and QUICKENING == nil and STONESKIN == nil and SLOW == nil) then
	badeffect = math.random(1,10);
if(badeffect > 2) then
	player:addStatusEffect(EFFECT_WEIGHT,0,0,WeightTimer);
	player:specialMessage(907);
elseif(badeffect < 2) then
	goodeffect = math.random(1,5);
if(goodeffect == 1)then
	player:addStatusEffect(EFFECT_HASTE,0,0,HasteTimer);
	player:specialMessage(908);
elseif(goodeffect == 2)then
	player:addStatusEffect(EFFECT_FLEE,0,0,FleeTimer);
	player:specialMessage(908);
elseif(goodeffect == 3)then
	player:addStatusEffect(EFFECT_QUICKENING,0,0,QuickeningTimer);
	player:specialMessage(908);
elseif(goodeffect == 4)then
	player:addStatusEffect(EFFECT_STONESKIN,0,0,StoneskinTimer);
	player:specialMessage(908);
elseif(goodeffect == 5)then
	player:addStatusEffect(EFFECT_SLOW,0,0,SlowTimer);
	player:specialMessage(908);
end
end
end
end,

---------------------------------
[3] = function (x)  
---------------------------------
if(WEIGHT == nil and HASTE == nil and FLEE == nil and QUICKENING == nil and STONESKIN == nil and SLOW == nil) then
	badeffect = math.random(1,10);
if(badeffect > 2) then
	player:addStatusEffect(EFFECT_WEIGHT,0,0,WeightTimer);
	player:specialMessage(907);
elseif(badeffect < 2) then
	goodeffect = math.random(1,5);
if(goodeffect == 1)then
	player:addStatusEffect(EFFECT_HASTE,0,0,HasteTimer);
	player:specialMessage(908);
elseif(goodeffect == 2)then
	player:addStatusEffect(EFFECT_FLEE,0,0,FleeTimer);
	player:specialMessage(908);
elseif(goodeffect == 3)then
	player:addStatusEffect(EFFECT_QUICKENING,0,0,QuickeningTimer);
	player:specialMessage(908);
elseif(goodeffect == 4)then
	player:addStatusEffect(EFFECT_STONESKIN,0,0,StoneskinTimer);
	player:specialMessage(908);
elseif(goodeffect == 5)then
	player:addStatusEffect(EFFECT_SLOW,0,0,SlowTimer);
	player:specialMessage(908);
end
end
end
end,

---------------------------------
[4] = function (x) 
---------------------------------
if(WEIGHT == nil and HASTE == nil and FLEE == nil and QUICKENING == nil and STONESKIN == nil and SLOW == nil) then
	badeffect = math.random(1,10);
if(badeffect > 2) then
	player:addStatusEffect(EFFECT_WEIGHT,0,0,WeightTimer);
	player:specialMessage(907);
elseif(badeffect < 2) then
	goodeffect = math.random(1,5);
if(goodeffect == 1)then
	player:addStatusEffect(EFFECT_HASTE,0,0,HasteTimer);
	player:specialMessage(908);
elseif(goodeffect == 2)then
	player:addStatusEffect(EFFECT_FLEE,0,0,FleeTimer);
	player:specialMessage(908);
elseif(goodeffect == 3)then
	player:addStatusEffect(EFFECT_QUICKENING,0,0,QuickeningTimer);
	player:specialMessage(908);
elseif(goodeffect == 4)then
	player:addStatusEffect(EFFECT_STONESKIN,0,0,StoneskinTimer);
	player:specialMessage(908);
elseif(goodeffect == 5)then
	player:addStatusEffect(EFFECT_SLOW,0,0,SlowTimer);
	player:specialMessage(908);
end
end
end
end,

---------------------------------
[5] = function (x)  
---------------------------------
if(WEIGHT == nil and HASTE == nil and FLEE == nil and QUICKENING == nil and STONESKIN == nil and SLOW == nil) then
	badeffect = math.random(1,10);
if(badeffect > 2) then
	player:addStatusEffect(EFFECT_WEIGHT,0,0,WeightTimer);
	player:specialMessage(907);
elseif(badeffect < 2) then
	goodeffect = math.random(1,5);
if(goodeffect == 1)then
	player:addStatusEffect(EFFECT_HASTE,0,0,HasteTimer);
	player:specialMessage(908);
elseif(goodeffect == 2)then
	player:addStatusEffect(EFFECT_FLEE,0,0,FleeTimer);
	player:specialMessage(908);
elseif(goodeffect == 3)then
	player:addStatusEffect(EFFECT_QUICKENING,0,0,QuickeningTimer);
	player:specialMessage(908);
elseif(goodeffect == 4)then
	player:addStatusEffect(EFFECT_STONESKIN,0,0,StoneskinTimer);
	player:specialMessage(908);
elseif(goodeffect == 5)then
	player:addStatusEffect(EFFECT_SLOW,0,0,SlowTimer);
	player:specialMessage(908);
end
end
end
end,

default = function (x)
--print("default");
end,}
end;
 

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,option)
--print("CSID------------:",csid);
--print("OPTION----------:",option);
end;