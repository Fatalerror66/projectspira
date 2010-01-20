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

    -- Get all trade items from the stack
    -- Get all trade items from the stack
    for i=1,table.getn(arg) do
          --print(i,arg[i])
    end

---EIGHT TRADE SLOTS--
item1,quantity1 = player:getItemInfo(arg[3]);
item2,quantity2 = player:getItemInfo(arg[5]);
item3,quantity3 = player:getItemInfo(arg[7]);
item4,quantity4 = player:getItemInfo(arg[9]);
item5,quantity5 = player:getItemInfo(arg[11]);
item6,quantity6 = player:getItemInfo(arg[13]);
item7,quantity7 = player:getItemInfo(arg[15]);
item8,quantity8 = player:getItemInfo(arg[17]);
if arg[3] == 0 then
giltraded = arg[4]
else
giltraded = 0
end;

 -- Local Variables


end;
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
 
function onTrigger(player,npc)

nation = player:getNation();

 
player:showText(npc,0x6c0)

shop = player:createShop(0)

-- 	  Citizen: All
-- 	  Conquest: San d'Oria, Any rank
shop:addItem(0x4300,(38*SHOP_PRICE));
shop:addItem(0x4301,(0x1e2*SHOP_PRICE));
shop:addItem(0x4302,(0x1bd8*SHOP_PRICE));
shop:addItem(0x4308,(0x1ba*SHOP_PRICE));
shop:addItem(0x430a,(0x4cae*SHOP_PRICE));
shop:addItem(0x43a6,(0x3*SHOP_PRICE));
shop:addItem(0x43a8,(0x7*SHOP_PRICE));
shop:addItem(0x43a9,(0x10*SHOP_PRICE));
shop:addItem(0x43aa,(0x7e*SHOP_PRICE));
shop:addItem(0x43b8,(0x5*SHOP_PRICE));
shop:addItem(0x4380,(0x627*SHOP_PRICE));

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

