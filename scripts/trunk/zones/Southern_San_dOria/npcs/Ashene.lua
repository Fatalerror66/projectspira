-----------------------------------
--	Author: Mana
-- 	Ashene 
-- 	Standard Merchant  
-- 	Location: Southern San d'Oria K-7, in Helbort's Blades 
-----------------------------------
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


nation = player:getNation();


player:showText(npc,0x6c0);

shop = player:createShop(0);
-- 	  Citizen: All
-- 	  Conquest: San d'Oria, Any rank 
-- 	Cesti 129 - 149    ID 0x4001
-- 	Bronze Dagger 140 - 162    ID 0x4040
-- 	Brass Dagger 837 - 967    ID 0x4041
-- 	Brass Xiphos 3,523 - 4,071    ID 0x4093
-- 	Bronze Sword 241 - 278    ID 0x4097
-- 	Spatha 1,674 - 1,934    ID 0x40b5
shop:addItem(0x4001,(149*SHOP_PRICE));
shop:addItem(0x4040,(162*SHOP_PRICE));
shop:addItem(0x4041,(967*SHOP_PRICE));
shop:addItem(0x4093,(4071*SHOP_PRICE));
shop:addItem(0x4097,(278*SHOP_PRICE));
shop:addItem(0x40b5,(1934*SHOP_PRICE));
-- if 2nd place conquest or better
-- 	  Citizen: All
-- 	  Conquest: San d'Oria, 1st, 2nd 
-- 	Dagger 1,827 - 2,111   ID 0x4042
-- 	Iron Sword 7,128 - 8,236    ID 0x4098
-- 	Longsword 8,294 - 9,584    ID 0x40b6
shop:addItem(0x4042,(2111*SHOP_PRICE));
shop:addItem(0x4098,(8236*SHOP_PRICE));
shop:addItem(0x40b6,(9584*SHOP_PRICE));
-- end
if nation == 0 then -- and 1st place conquest
-- 	  Citizen: San d'Orians Only
-- 	  Conquest: San d'Oria, 1st 
-- 	Baselard 4,309 - 4,979   ID 0x4047
-- 	Gladius 16,934 - 19,568   ID 0x4094
-- 	Broadsword 21,067 - 24,344   ID 0x40a1
-- 	Hunting Sword 35,769 - 41,333   ID 0x40c0
-- 	Fleuret 13,406 - 15,491  ID 0x408c
shop:addItem(0x4047,(4979*SHOP_PRICE));
shop:addItem(0x4094,(19568*SHOP_PRICE));
shop:addItem(0x40a1,(24344*SHOP_PRICE));
shop:addItem(0x40c0,(41333*SHOP_PRICE));
shop:addItem(0x408c,(15491*SHOP_PRICE));
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