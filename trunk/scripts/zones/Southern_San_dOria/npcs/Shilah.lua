-----------------------------------
--	Author: JesseJames
--      Edited: Mana (added shop and corrected text event)
-- 	Shilah
-- 	
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


nation = player:getNation();


-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------

player:showText(npc,0x6b9)

shop = player:createShop(0)

-- 	  Citizen: All
-- 	  Conquest: San d'Oria, Any rank 
shop:addItem(0x110c,(103*SHOP_PRICE));
shop:addItem(0x1104,(0xb4*SHOP_PRICE));
shop:addItem(0x118c,(0x21c*SHOP_PRICE));
shop:addItem(0x11b5,(0x438*SHOP_PRICE));
shop:addItem(0x1152,(0x1194*SHOP_PRICE));
shop:addItem(0x1167,(0xb4*SHOP_PRICE));
shop:addItem(0x11d0,(0x54b*SHOP_PRICE));
shop:addItem(0x1143,(0x189c*SHOP_PRICE));
shop:addItem(0x11dc,(0x661*SHOP_PRICE));
shop:addItem(0x119d,(0xa*SHOP_PRICE));
shop:addItem(0x1159,(0x345*SHOP_PRICE));
shop:addItem(0x118e,(0x9be*SHOP_PRICE));

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