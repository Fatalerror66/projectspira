-----------------------------------
--	Author: Arcanedemon
-- 	Zaira
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
stock = {0x12FE,111,1,
	0x12E6,360,2,
	0x12DC,82,2,
	0x12FD,2250,2,
	0x129A,324,3,
	0x1295,1584,3,
	0x12EB,4644,3,
	0x12ED,2250,3,
	0x12F0,6366,3,
	0x1290,837,3,
	0x12EC,3688,3,
	0x12EE,1827,3,
	0x12EF,1363,3,
	0x11FF,61,3,
	0x12A4,3261,3,
	0x12A9,140,3}

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