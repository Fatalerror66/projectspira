-----------------------------------
--	Author: Arcanedemon
-- 	Sororo
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,993);
conquest = 1; -- Need Conquest Check
nation = player:getNation();
shop = player:createShop(1);
stock = {0x1221,1165,1,
	0x1236,7025,1,
	0x1238,837,1,
	0x1202,585,2,
	0x121C,140,2,
	0x1226,1165,2,
	0x1235,2097,2,
	0x1200,61,3,
	0x1207,1363,3,
	0x12E1,180,3,
	0x120F,324,3,
	0x1210,990,3,
	0x11FE,82,3,
	0x122B,219,3,
	0x1230,584,3,
	0x1271,29700,3}

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
player:sendShop(shop);
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;