-----------------------------------
--	Author: Arcanedemon
-- 	Torapiont
-- 	Standard Merchant
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,538);
shop = player:createShop(4);
stock = {0x401B,10,
	0x4043,7727,
	0x4081,11588,
	0x40C8,37800,
	0x4103,11040,
	0x4141,4095,
	0x429A,333,
	0x429B,1409,
	0x42C1,571,
	0x439B,9,
	0x43B8,5,
	0x43A6,3,
	0x43A8,7}
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
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;