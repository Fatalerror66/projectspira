-----------------------------------
--	Author: Mana
-- 	Lusiane
-- 	Type: Standard Merchant  
--        Location: Southern San d'Oria F-8, in front of Taumila's Sundries  
-----------------------------------
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)





nation = player:getNation();
--player:startEvent(Event(0x235));
player:showText(npc,0x6b9)

shop = player:createShop(0);
--   Citizen: All
--   Conquest: San d'Oria, Any rank 
--Little Worm 3 - 4 
--Scroll of Light Threnody 110 - 124 
--Scroll of Lightning Threnody 1265 - 1431 
--Willow Fishing Rod 66 - 74 
shop:addItem(0x43f4,(4*SHOP_PRICE));
shop:addItem(0x13cc,(124*SHOP_PRICE));
shop:addItem(0x13ca,(1431*SHOP_PRICE));
shop:addItem(0x43ef,(74*SHOP_PRICE));
-- if 2nd place conquest or better
-- 	  Citizen: All
-- 	  Conquest: San d'Oria, 1st, 2nd 
--Lugworm 9 - 12 
--Yew Fishing Rod 217 - 245
shop:addItem(0x43f3,(12*SHOP_PRICE));
shop:addItem(0x43ee,(245*SHOP_PRICE));
-- end
if nation == 0 then -- and 1st place conquest
-- 	  Citizen: San d'Orians Only
-- 	  Conquest: San d'Oria, 1st 
--Bamboo Fishing Rod 496 - 561 
shop:addItem(0x43ed,(561*SHOP_PRICE));
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