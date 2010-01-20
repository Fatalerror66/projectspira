-----------------------------------
--	Author: Arcanedemon
-- 	Zafif
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");
Astral = 0; -- Need to check status of Astral Can.

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,1073);
shop = player:createShop(9);
stock = {0x1204,23400,
	0x1208,11200,
	0x1209,19932,
	0x122D,32000,
	0x122E,91116,
	0x1280,85500,
	0x1215,35000,
	0x1227,20000,
	0x1211,2330,
	0x1212,19200,
	0x1213,13300,
	0x1214,8586,
	0x1304,77600,
	0x1270,27000,
	0x128E,99375,
	0x1268,28500}
i = 1;
while i <= (table.getn(stock)-1) do
	shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
	i = i+2;
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