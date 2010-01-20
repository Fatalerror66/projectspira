-----------------------------------
--	Author: Aurelias
-- 	Hasim
-- 	Spell Shop
-----------------------------------
-- Includes
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,572);
shop = player:createShop(5); 
	shop:addItem(4612,(23400*SHOP_PRICE)); 
	shop:addItem(4616,(11200*SHOP_PRICE)); 
	shop:addItem(4617,(19932*SHOP_PRICE)); 
	shop:addItem(4653,(32000*SHOP_PRICE)); 
	shop:addItem(4668,(1760*SHOP_PRICE)); 
	shop:addItem(4669,(3624*SHOP_PRICE)); 
	shop:addItem(4670,(930*SHOP_PRICE)); 
	shop:addItem(4671,(156*SHOP_PRICE)); 
	shop:addItem(4672,(5754*SHOP_PRICE)); 
	shop:addItem(4673,(360*SHOP_PRICE)); 
	shop:addItem(4674,(1760*SHOP_PRICE)); 
	shop:addItem(4675,(3624*SHOP_PRICE)); 
	shop:addItem(4676,(930*SHOP_PRICE)); 
	shop:addItem(4677,(156*SHOP_PRICE)); 
	shop:addItem(4678,(5754*SHOP_PRICE)); 
	shop:addItem(4679,(360*SHOP_PRICE)); 
player:sendShop(shop); 
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);
-----------------------------------
-- Trades go below.
-----------------------------------

end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("OPTION:",option);
end;