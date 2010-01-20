-----------------------------------
--	Author: Arcanedemon
-- 	Glyke
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,428);
shop = player:createShop(5);
stock = {0x1104,184,
	0x1136,440,
	0x1138,128,
	0x1140,1400,
	0x1146,184,
	0x1147,276,
	0x1148,1012,
	0x1155,662,
	0x1159,855,
	0x115A,368,
	0x1168,2070,
	0x1193,92,
	0x11CB,1711,
	0x11CF,4585};
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