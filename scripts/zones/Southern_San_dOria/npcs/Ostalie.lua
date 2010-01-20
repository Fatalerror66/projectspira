-- Area: Southern San d'Oria
--  NPC: Ostalie
--  Item Shop
-- By: Mana
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
-- Variables
nation = player:getNation();

player:showText(npc,0x6b9)

shop = player:createShop(0)

-- 	  Citizen: All
-- 	  Conquest: San d'Oria, Any rank 
shop:addItem(0x3388,(370*SHOP_PRICE));
shop:addItem(0x3389,(0x97e*SHOP_PRICE));
shop:addItem(0x338c,(0x2746*SHOP_PRICE));
shop:addItem(0x30b8,(0x9*SHOP_PRICE));
shop:addItem(0x3138,(0xd8*SHOP_PRICE));
shop:addItem(0x31b8,(0x76*SHOP_PRICE));
shop:addItem(0x3238,(0xac*SHOP_PRICE));
shop:addItem(0x1036,(0x91f*SHOP_PRICE));
shop:addItem(0x1034,(0x11c*SHOP_PRICE));
shop:addItem(0x1037,(0x2d0*SHOP_PRICE));
shop:addItem(0x1010,(0x333*SHOP_PRICE));
shop:addItem(0x1020,(0x1fc*SHOP_PRICE));
shop:addItem(0x25d,(0xb4*SHOP_PRICE));
-- if 2nd place conquest or better
-- 	  Citizen: All
-- 	  Conquest: San d'Oria, 1st, 2nd 
-- end
if nation == 0 then -- and 1st place conquest
-- 	  Citizen: San d'Orians Only
-- 	  Conquest: San d'Oria, 1st 
end
player:sendShop(shop);

end;
 
 
-----------------------------------
-- More to come...
-----------------------------------

