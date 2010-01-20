-----------------------------------
--	Author: Arcanedemon
-- 	Than Posbei
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,462);
shop = player:createShop(2);
stock = {0x3127,10833,
	0x32A7,5332,
	0x30A7,7026,
	0x31A7,5707,
	0x3223,8666,
	0x3324,28777,
	0x3001,110,
	0x3098,404,
	0x3198,331,
	0x3298,309,
	0x3118,618,
	0x3004,4531,
	0x3007,59607}
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