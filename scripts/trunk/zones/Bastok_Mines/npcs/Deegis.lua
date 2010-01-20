-----------------------------------
--	Author: Arcanedemon
-- 	Deegis
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,987);
conquest = 1; -- Need Conquest Check
nation = player:getNation();
shop = player:createShop(1);
stock = {0x3088,9234,1,
	0x31A2,15552,1,
	0x3122,28339,1,
	0x30A2,18360,1,
	0x30A1,1471,2,
	0x3121,2236,2,
	0x31A1,1228,2,
	0x3098,396,2,
	0x3198,324,2,
	0x3118,604,2,
	0x30A0,151,3,
	0x3120,230,3,
	0x31A0,126,3,
	0x3188,7614,3,
	0x3108,14256,3}

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