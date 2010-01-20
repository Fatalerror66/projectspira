-----------------------------------
--	Author: Mana
-- 	Benaige 
-- 	Standard Merchant  
-- 	Location: Raimbroy's Groceries Southern San d'Oria (F-7) 
-----------------------------------
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)





nation = player:getNation();
player:showText(npc,0x6bf)
shop = player:createShop(0);
-- 	  Citizen: All
-- 	  Conquest: San d'Oria, Any rank 
--Crying Mustard 25 - 29 
--Rye Flour 36 - 41 
--Rock Salt 14 - 16 
--Distilled Water 10 - 12 
--Cibol 198 - 228 
shop:addItem(0x26d,(29*SHOP_PRICE));
shop:addItem(0x263,(41*SHOP_PRICE));
shop:addItem(0x3a8,(16*SHOP_PRICE));
shop:addItem(0x119d,(12*SHOP_PRICE));
shop:addItem(0x1472,(228*SHOP_PRICE));
-- if 2nd place conquest or better
-- 	  Citizen: All
-- 	  Conquest: San d'Oria, 1st, 2nd 
--Dried Marjoram 43 - 49 
--San d'Orian Flour 54 - 62 
--Maple Sugar 36 - 41 
--Semolina 1,800 - 2,200 
--Zucchini 442 - 452 
--Paprika 511 - 522 
shop:addItem(0x26e,(49*SHOP_PRICE));
shop:addItem(0x262,(62*SHOP_PRICE));
shop:addItem(0x273,(41*SHOP_PRICE));
shop:addItem(0x730,(2200*SHOP_PRICE));
shop:addItem(0x165e,(452*SHOP_PRICE));
shop:addItem(0x166c,(522*SHOP_PRICE));
-- end
if nation == 0 then -- and 1st place conquest
-- 	  Citizen: San d'Orians Only
-- 	  Conquest: San d'Oria, 1st 
--Cinnamon 234 - 270 
--Millioncorn 43 - 49 
shop:addItem(0x274,(270*SHOP_PRICE));
shop:addItem(0x275,(49*SHOP_PRICE));
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