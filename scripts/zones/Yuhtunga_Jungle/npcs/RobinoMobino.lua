-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Ronbino-Mobino
-- 	Outpost Vendor
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/globals/conquest"] = nil;
require("scripts/globals/conquest");
package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
require("scripts/zones/Yuhtunga_Jungle/TextIDs");

region = ELSHIMOLOWLANDS;


-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
--Parameters--
-- Nation,TeleToggle,???,???,???,???,???,???
-- Nation: 0 = No Control, 1 = Full Control, 2 = Allied Control
-- TeleToggle: 0 = Off, Any other val = Tele Cost
-----------------------------------
Vendor = Event(0x7FF4);

arg1 = getArg1(region_control[region], player);

if (region_control[region] == player:getNation()) then
	nation = 1;
elseif (arg1 < 0x700) then
	nation = 2;
else
	nation = 0;
end;

Vendor:setParams(nation,OP_TeleFee(player, region),0,0,0,0,0,0);
player:startEvent(Vendor);
end;

function onEventSelection(player,csid,option)
--print(csid,option);
-- param 1: player's gil
---param 2: overrides the default gil cost of 300 gil
player:updateEvent(player:getCurrGil(),OP_TeleFee(player, region) );
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (option == 1) then
	createOPVendorShop(player);
elseif (option == 2) then
	player:removeGil(OP_TeleFee(player, region));
	toHomeNation(player);
end
end;