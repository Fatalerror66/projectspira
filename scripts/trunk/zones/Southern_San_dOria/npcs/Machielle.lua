
-----------------------------------
-- Area: Southern San d'Oria
--  NPC
--  
-- By: Mana
-----------------------------------

-----------------------------------
-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	end

end;
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
 
function onTrigger(player,npc)
-- Store info
player:showText(npc,0x06bc) -- wrong text ID

shop = player:createShop(0);
shop:addItem(0x27f,(108*SHOP_PRICE));
shop:addItem(0x1125,(28*SHOP_PRICE));
shop:addItem(0x262,(54*SHOP_PRICE));
shop:addItem(0x114f,(68*SHOP_PRICE));
--shop:addItem(,);
player:sendShop(shop);
end; 
 

end;
 
