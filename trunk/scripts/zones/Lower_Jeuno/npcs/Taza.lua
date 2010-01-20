-----------------------------------
--	Author: Aurelias
-- 	Taza
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
	shop:addItem(4881,(11200*SHOP_PRICE)); 
	shop:addItem(4658,(26244*SHOP_PRICE)); 
	shop:addItem(4735,(19200*SHOP_PRICE)); 
	shop:addItem(4739,(14080*SHOP_PRICE)); 
	shop:addItem(4740,(26244*SHOP_PRICE)); 
	shop:addItem(4685,(15120*SHOP_PRICE)); 
	shop:addItem(4686,(9600*SHOP_PRICE)); 
	shop:addItem(4699,(15120*SHOP_PRICE)); 
	shop:addItem(4700,(9600*SHOP_PRICE)); 
	shop:addItem(4867,(18720*SHOP_PRICE)); 
	shop:addItem(4769,(19932*SHOP_PRICE)); 
	shop:addItem(4779,(22682*SHOP_PRICE)); 
	shop:addItem(4764,(27744*SHOP_PRICE)); 
	shop:addItem(4754,(33306*SHOP_PRICE)); 
	shop:addItem(4759,(39368*SHOP_PRICE)); 
	shop:addItem(4774,(45930*SHOP_PRICE)); 
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