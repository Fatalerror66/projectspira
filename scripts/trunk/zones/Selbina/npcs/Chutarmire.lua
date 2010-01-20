-----------------------------------
--	Author: Arcanedemon
-- 	Chutarmire
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
player:showText(npc,543);
shop = player:createShop(4);
stock = {0x12A0,5751,
	0x12AA,8100,
	0x129B,11970,
	0x1291,16560,
	0x1296,21870,
	0x12A5,27900,
	0x12BD,1165,
	0x12C7,2097,
	0x12B8,4147,
	0x12AE,7025,
	0x12B3,10710,
	0x12C2,15120,
	0x12DD,22680,
	0x12E7,12600,
	0x12E1,4644,
	0x12FB,8100}
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