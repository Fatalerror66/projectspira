-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Kuleo
-- 	Outpost Vendor
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/conquest"] = nil;
require("scripts/globals/conquest");
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
require("scripts/zones/North_Gustaberg/TextIDs");

region = GUSTABERG;

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
	shop = player:createShop(9);
	stock = {0x1034,316,
		0x1037,800,
		0x1020,4832,
		0x1036,2595,
		0x1010,910};
	i = 1;
	while i <= (table.getn(stock)-1) do
		shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
		i = i+2;
		if (i >= table.getn(stock)) then 
			break; 
		end
	end
	player:sendShop(shop);
elseif (option == 2) then
	player:removeGil(OP_TeleFee(player, region));
	toHomeNation(player);
end
end;