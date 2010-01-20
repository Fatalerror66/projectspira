-----------------------------------
--	Author: Aurelias
-- 	Susu
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
	shop:addItem(4629,(35000*SHOP_PRICE)); 
	shop:addItem(4647,(20000*SHOP_PRICE)); 
	shop:addItem(4625,(2330*SHOP_PRICE)); 
	shop:addItem(4626,(19200*SHOP_PRICE)); 
	shop:addItem(4627,(13300*SHOP_PRICE)); 
	shop:addItem(4628,(8586*SHOP_PRICE)); 
	shop:addItem(4680,(244*SHOP_PRICE)); 
	shop:addItem(4681,(400*SHOP_PRICE)); 
	shop:addItem(4682,(780*SHOP_PRICE)); 
	shop:addItem(4683,(2030*SHOP_PRICE)); 
	shop:addItem(4684,(4608*SHOP_PRICE)); 
	shop:addItem(4694,(244*SHOP_PRICE)); 
	shop:addItem(4695,(400*SHOP_PRICE)); 
	shop:addItem(4696,(780*SHOP_PRICE)); 
	shop:addItem(4697,(2030*SHOP_PRICE)); 
	shop:addItem(4698,(4608*SHOP_PRICE)); 
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