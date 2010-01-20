require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice)
if(csid == 0x213) then
	player:setVar("firstLogin",-1);
	--print("Firstlogin now set to -1");
end

if (csid == 0x92) then
	player:setVar("thePriceOfPeace",2);
	--print("HAYYYY");
end

if (csid == 0x0367) then -- CoP Mission
  player:currentMission(6,18); -- "Memories of a Maiden"
  player:currentMission(6,19); -- "Comedy of Errors, Part I"
end
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
player:setAnimation(0);
cs = -1;

---Windurst Waters start CS---
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE == 1) then
	player:setPos(-40,-5,80,0x40);
	player:setVar("firstLogin",-1);
	player:setHomePoint();
	--print("Opening cutscene bypassed, firstLogin set to -1.");
end
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE ~= 1) then
   cs = 0x213;
   player:setPos(-40,-5,80,0x40);
   player:setVar("firstLogin",-1);
   player:setHomePoint();
   --print("Firstlogin now set to -1");
end

cop_status1 = player:getMissionStatus(6,13); -- "The Road Forks"
cop_status2 = player:getMissionStatus(6,18); -- "Memories of a Maiden"
--print("The Road Forks", cop_status1, "Memories of a Maiden:", cop_status2);
comedy_of_errors_status = player:getVar("ComedyofErrors");

if (cop_status1 == 2) and (cop_status2 == 0) then  -- this may have to be fixed
  cs = 0x0367;
end

--reset all counters for quest "Hat in Hand" in case of logout or zone out
player:setVar("hatInHand-BondadaCS",0);
player:setVar("hatInHand-HonoiGomoiCS",0);
player:setVar("hatInHand-KenapaKeppaCS",0);
player:setVar("hatInHand-ClaisCS",0);
player:setVar("hatInHand-KyumeRomehCS",0);
player:setVar("hatInHand-TosukaPorikaCS",0);
player:setVar("hatInHand-PechiruMashiruCS",0);
player:setVar("hatInHand-MachitataCS",0);
local hat = player:getVar("hatInHand");
--prepare for repeat start
if (hat == 2 or hat == 3) then
	player:setVar("hatInHand",4);
end

return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize()
currZone = 0xee;
--print("Initializing Rhinostery Stairway");
registerRegion(currZone,1,14,24,-10,-5,-208,-206);
--print("Rhinostery Stairway Initialization success!");
end;


function onRegionEnter(player, regionID)

--variables--
 
windyonethree = player:getVar("thePriceOfPeace");
windyonethreef = player:getVar("thePriceOf-LeppeHoppeCS");

switch (regionID): caseof {
---------------------------------
[1] = function (x)
---------------------------------
if (windyonethree == 1 and windyonethreef == 2) then
	player:startEvent(Event(0x92));
	player:setVar("thePriceOfPeace",2);
end
 end,
---------------------------------
default = function (x) end,}
end;