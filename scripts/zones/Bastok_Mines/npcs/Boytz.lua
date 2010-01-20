-----------------------------------
--	Author: Arcanedemon
-- 	Boytz
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,989);
conquest = 1; -- Need Conquest Check
nation = player:getNation();
shop = player:createShop(1);
stock = {0x1020,4445,1,
	0x1037,736,2,
	0x1010,837,2,
	0x43A6,3,2,
	0x1034,290,3,
	0x00D9,900,3,
	0x43B8,5,3,
	0x1036,2387,3,
	0x43A8,7,3,
	0x025D,180,3}

i = 1;
while i <= (table.getn(stock)-1) do
	if (stock[i+2] == 1) then
		if (nation == 1 and conquest == 1) then
			shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
		end
	elseif (stock[i+2] == 2) then
		if (conquest <= 2) then
			shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
		end
	else
		shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
	end
	i = i+3;
	if (i >= table.getn(stock)) then 
		break; 
	end
end

if (conquest == 3) then
	shop:addItem(0x03FF,5520*SHOP_PRICE);
end
if (conquest >= 2) then
	shop:addItem(0x03FE,3643*SHOP_PRICE);
end

player:sendShop(shop);
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;