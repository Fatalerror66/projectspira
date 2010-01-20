-----------------------------------
--	Author: Arcanedemon
-- 	Neigepance
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,992);
conquest = 1; -- Need Conquest Check
nation = player:getNation();
shop = player:createShop(1);
stock = {0x034D,1150,1,
	0x439B,9,1,
	0x45CA,695,3,
	0x45C4,82,3,
	0x0348,7,3,
	0x13D1,50784,3,
	0x45C6,695,3,
	0x11C1,62,3,
	0x45C8,126,3,
	0x4278,11,3,
	0x4279,82,3}

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