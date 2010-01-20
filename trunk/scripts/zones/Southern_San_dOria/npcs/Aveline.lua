-----------------------------------
--	Author: Mana
-- 	Aveline 
--Type: Standard Merchant  
--Location: Southern San d'Oria F-7, in Raimbroy's Grocery  
-----------------------------------
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)





nation = player:getNation();

player:showText(npc,0x6bf)

shop = player:createShop(0);
--  Sells to everyone when
--  San d'Oria is 1st, 2nd, or 3rd 
--Olive Oil 14 - 17 
--Sage 166 - 203 
--San d'Orian Carrot 28 - 35 
--San d'Orian Grape 68 - 83 
shop:addItem(0x279,(17*SHOP_PRICE));
shop:addItem(0x27e,(203*SHOP_PRICE));
shop:addItem(0x1125,(35*SHOP_PRICE));
shop:addItem(0x114f,(83*SHOP_PRICE));
-- if 2nd place conquest or better
--  Sells to everyone
--  when San d'Oria is 1st or 2nd
--Faerie Apple 39 - 48 
--La Theine Cabbage 21 - 26 
shop:addItem(0x110b,(48*SHOP_PRICE));
shop:addItem(0x110e,(26*SHOP_PRICE));
-- end
if nation == 0 then -- and 1st place conquest
--  Sells to San d'Orians only
--  when San d'Oria is 1st 
--Apple Vinegar 79 - 91 
--Bay Leaves 117 - 143 
--Frost Turnip 28 - 35 
--Saruta Orange 28 - 35 
shop:addItem(0x271,(91*SHOP_PRICE));
shop:addItem(0x26f,(143*SHOP_PRICE));
shop:addItem(0x111e,(35*SHOP_PRICE));
shop:addItem(0x1128,(35*SHOP_PRICE));
end
player:sendShop(shop);
end; 
-----------------------------------
-- onTrade Action
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
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;