-----------------------------------
--	Author: Mana
-- 	Ferdoulemiont 
-- 	Type: Standard Merchant  
--        Location: Southern San d'Oria I-11, Outside the Chocobo Stables 
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
-- 	  Citizen: All
-- 	  Conquest: San d'Oria, Any rank 
--Bug Broth 680 - 786 
--Carrion Broth 680 - 786 
--Carrot Broth 81 - 93 
--Chocobo Feather 7 - 8 
--Gysahl Greens 61 - 70 
--Herbal Broth 124 - 143 
--Pet Food Alpha Biscuit 10 - 12 
--Pet Food Beta Biscuit 81 - 93 
--Scroll of Chocobo Mazurka 49,680 - 69,000 
--Scroll of Knight's Minne 16 - 18 
--Scroll of Knight's Minne II 864 - 998 
--Scroll of Knight's Minne III 5,148 - 5,948 
--La Theine Millet ~1,984  
shop:addItem(0x45c6,(786*fameMult));
shop:addItem(0x45ca,(786*fameMult));
shop:addItem(0x45c4,(93*fameMult));
shop:addItem(0x348,(8*fameMult));
shop:addItem(0x11c1,(70*fameMult));
shop:addItem(0x45c8,(143*fameMult));
shop:addItem(0x4278,(12*fameMult));
shop:addItem(0x4279,(93*fameMult));
shop:addItem(0x13d1,(69000*fameMult));
shop:addItem(0x1385,(18*fameMult));
shop:addItem(0x1386,(998*fameMult));
shop:addItem(0x1387,(5948*fameMult));
shop:addItem(0x927,(1984*fameMult));
-- if 2nd place conquest or better
-- 	  Citizen: All
-- 	  Conquest: San d'Oria, 1st, 2nd 
--Dart 9 - 10  
shop:addItem(0x439b,(10*fameMult));
-- end
if nation == 0 then -- and 1st place conquest
-- 	  Citizen: San d'Orians Only
-- 	  Conquest: San d'Oria, 1st 
--Black Chocobo Feather 1125 - 1300 
shop:addItem(0x34d,(1300*fameMult));
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