-----------------------------------
--	Author: Arcanedemon
-- 	Tomasa
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,1418);
conquest = 1; -- Need Conquest Check
nation = player:getNation();
shop = player:createShop(1);
stock = {0x112C,257,1,
	0x1139,73,1,
	0x1141,3036,1,
	0x115A,368,1,
	0x1127,22,2,
	0x11E2,143,2,
	0x1148,1012,2,
	0x1193,92,3,
	0x1154,294,3,
	0x1167,184,3,
	0x119D,10,3}

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