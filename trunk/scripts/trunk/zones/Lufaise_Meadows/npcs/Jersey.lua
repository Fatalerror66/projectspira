-----------------------------------
--	Author: Arcanedemon
-- 	Jersey
-- 	Outpost Vendor
-----------------------------------
require("scripts/globals/settings");

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
Vendor:setParams(1,0,0,0,0,0,0,0);
player:startEvent(Vendor);
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
end
end;