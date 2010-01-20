-----------------------------------
--	Author: Mana
-- 	Apairemant
-- 	Regional Vendor NPC 
--        Gustaberg Region 
--        Sulfur 703 - 795   ID: 0x3a6
--        Popoto 43 - 49   ID: 0x26b
--        Rye Flour 36 - 41    ID: 0x263
--        Eggplant 40 - 45    ID: 0x1124
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)




--print("SHOP_PRICE Multiplier",SHOP_PRICE);
-- Thanks Tenjou
-- regional influence needed to determine if to call the shop and the correct text line to show
--player:showText(npc,);
--Open shop!!
nation = player:getNation();
fame = player:getFame(0);
famelevel = 1;
if (fame >= 2450) then famelevel = 9;
elseif (fame >= 2200) then famelevel = 8;
elseif (fame >= 1952) then famelevel = 7;
elseif (fame >= 1700) then famelevel = 6;
elseif (fame >= 1300) then famelevel = 5;
elseif (fame >= 900) then famelevel = 4;
elseif (fame >= 500) then famelevel = 3;
elseif (fame >= 200) then famelevel = 2; end

fameMult = (SHOP_PRICE*(1-(0.0144*(famelevel-1))))
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
shop = Shop();
shop:addItem(0x3a6,(795*fameMult));
shop:addItem(0x26b,(49*fameMult));
shop:addItem(0x263,(41*fameMult));
shop:addItem(0x1124,(45*fameMult));
--shop:addItem(,);
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