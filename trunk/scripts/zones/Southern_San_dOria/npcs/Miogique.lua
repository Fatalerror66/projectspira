-----------------------------------
-- Area: Southern San d'Oria
--   
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
-- Local Variables
nation = player:getNation();
 
player:showText(npc,0x6c1)

shop = player:createShop(0)

-- 	  Citizen: All
-- 	  Conquest: San d'Oria, Any rank 150
shop:addItem(0x30a0,(150*SHOP_PRICE));
shop:addItem(0x30a1,(0x5bf*SHOP_PRICE));
shop:addItem(0x3098,(0x18c*SHOP_PRICE));
shop:addItem(0x309a,(0x325d*SHOP_PRICE));
shop:addItem(0x3088,(0x2412*SHOP_PRICE));
shop:addItem(0x3120,(0xe6*SHOP_PRICE));
shop:addItem(0x3121,(0x8bc*SHOP_PRICE));
shop:addItem(0x3118,(0x25c*SHOP_PRICE));
shop:addItem(0x311a,(0x5028*SHOP_PRICE));
shop:addItem(0x3108,(0x37b0*SHOP_PRICE));
shop:addItem(0x31a0,(0x7e*SHOP_PRICE));
shop:addItem(0x31a1,(0x4cc*SHOP_PRICE));
shop:addItem(0x3198,(0x144*SHOP_PRICE));
shop:addItem(0x319a,(0x2a15*SHOP_PRICE));
shop:addItem(0x3188,(0x1dbe*SHOP_PRICE));

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
 
 
--------------------------------------
-- Default function to be called when no callback function is specified.
--------------------------------------
function onEventFinish(player,csid,menuchoice)
--print("the menuchoice was ",menuchoice);
--print("Event ID is ",csid);

end;

--------------------------------------
-- Self defined function that will be triggered on event 0x80073 finish.
--------------------------------------
function onEventXFinish(player,csid,menuchoice)
--print("the menuchoice was ",menuchoice);
--print("Event ID is ",csid);


-- Used outside ALL loops to release NPC after event to prevent freezing. REQUIRED FUNCTION
--player:sendRelease()

end;

