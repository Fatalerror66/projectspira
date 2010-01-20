-----------------------------------
--	Author: Arcanedemon
-- 	Scamplix
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
player:showText(npc,422);
shop = player:createShop(4);
stock = {0x119D,10,
	0x1118,108,
	0x116A,270,
	0x0719,720,
	0x1020,4348,
	0x113C,292,
	0x118B,180,
	0x1010,819,
	0x1034,284,
	0x1043,1080,
	0x3410,4050,
	0x006B,180}
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