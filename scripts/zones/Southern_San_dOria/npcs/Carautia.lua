-----------------------------------
--	Author: Mana
-- 	Carautia
-- 	Type: Standard Merchant  
--        Location: Southern San d'Oria K-8, in Rosel's Armour Shop  

-----------------------------------
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)





player:showText(npc,0x6c1);

nation = player:getNation();

shop = player:createShop(0);
-- 	  Citizen: All
-- 	  Conquest: San d'Oria, Any rank 
--Maple Shield 544 - 629 
--Bronze Subligar 187 - 216 
--Brass Subligar 1,800 - 2,080 
--Leather Trousers 482 - 557 
--Bronze Leggings 115 - 133 
--Brass Leggings 1,116 - 1,289 
--Leather Highboots 302 - 349 
shop:addItem(0x3002,(629*SHOP_PRICE));
shop:addItem(0x3220,(216*SHOP_PRICE));
shop:addItem(0x3221,(2080*SHOP_PRICE));
shop:addItem(0x3218,(557*SHOP_PRICE));
shop:addItem(0x32a0,(133*SHOP_PRICE));
shop:addItem(0x32a1,(1289*SHOP_PRICE));
shop:addItem(0x3298,(349*SHOP_PRICE));
-- if 2nd place conquest or better
-- 	  Citizen: All
-- 	  Conquest: San d'Oria, 1st, 2nd 
--Mahogany Shield 4,482 - 5,179 
--Studded Trousers 16,552 - 19,127 
--Studded Boots 10,054 - 11,618 
shop:addItem(0x3004,(5179*SHOP_PRICE));
shop:addItem(0x321a,(19127*SHOP_PRICE));
shop:addItem(0x329a,(11618*SHOP_PRICE));
-- end
if nation == 0 then -- and 1st place conquest
-- 	  Citizen: San d'Orians Only
-- 	  Conquest: San d'Oria, 1st 
--Chain Hose 11,340 - 13,104 
--Greaves 6,966 - 8,049 
--Kite Shield 10,281 
shop:addItem(0x3208,(13104*SHOP_PRICE));
shop:addItem(0x3288,(8049*SHOP_PRICE));
shop:addItem(0x3012,(10281*SHOP_PRICE));
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