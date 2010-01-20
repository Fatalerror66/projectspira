-----------------------------------
--	Author: Arcanedemon
-- 	Brave Wolf
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
player:showText(npc,420);
shop = player:createShop(4);
stock = {0x300D,31201,
	0x300E,60260,
	0x369B,24373,
	0x310A,66066,
	0x318A,35285,
	0x320A,52552,
	0x328A,32382,
	0x3141,9423,
	0x31C1,4395,
	0x3241,6279,
	0x32C1,4084,
	0x3122,28654,
	0x31A2,15724,
	0x3224,23063,
	0x32A2,14327}
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