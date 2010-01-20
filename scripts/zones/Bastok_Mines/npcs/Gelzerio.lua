-----------------------------------
--	Author: Arcanedemon
-- 	Gelzerio
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,990);
conquest = 1; -- Need Conquest Check
nation = player:getNation();
shop = player:createShop(1);
stock = {0x43ED,486,1,
	0x338E,19602,1,
	0x43F4,3,2,
	0x43EE,212,2,
	0x32B8,111,3,
	0x3230,1899,3,
	0x31B8,118,3,
	0x3130,2470,3,
	0x32B0,1269,3,
	0x31B0,1363,3,
	0x30B0,1742,3,
	0x43F3,10,3,
	0x3138,216,3,
	0x338C,10054,3,
	0x3238,172,3,
	0x43EF,64,3}

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