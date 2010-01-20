-----------------------------------
--	Author: Arcanedemon
-- 	Mamaroon
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,910);
shop = player:createShop(9);
stock = {0x09C5,29950,
	0x09C6,29950,
	0x1264,5160,
	0x1265,4098,
	0x1266,2500,
	0x1267,2030,
	0x1268,1515,
	0x1269,7074,
	0x12FB,9000,
	0x12FC,27000}
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