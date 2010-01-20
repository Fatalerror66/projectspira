require("/scripts/globals/armorStorage");
-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Taulenne
-- Armor Storage NPC 
-- By: Mana
-----------------------------------
-- Bastok Markets - Sinon 0x18B,0x18C
-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1767)
	end

 
---EIGHT TRADE SLOTS--
if trade:getItemCount() >= 4 and trade:getItemCount() < 6 then
item1 = trade:getItem(1);
item2 = trade:getItem(2);
item3 = trade:getItem(3);
item4 = trade:getItem(4);
end
if trade:getItemCount() == 5 then
item5 = trade:getItem(5);
else
item5 = 0;
end

 -- Local Variables
gil = (player:getCurrGil());

tradedSet = 0 -- did you trade a full set?   0= NO   1 = YES

--print("trading");

-- Define variables based off of a global script
result = {}
result = checkTradedSet(item1,item2,item3,item4,item5)
tradedSet = result[3]
keyItem = result[1]
storeCost = result[2]

-- actual trade event script
if tradedSet == 1 then
event = Event(0x80304);
event:setParams(keyItem,0,0,0,0,storeCost);
player:startEvent( event);
player:addKeyItem(keyItem)
player:specialMessage(212, keyItem);
-- takes the armor from your inventory
player:removeItem(item1);
player:removeItem(item2);
player:removeItem(item3);
player:removeItem(item4);
if trade:getItemCount() == 5 then
player:removeItem(item5);
end
else
--print("oops,either wrong items traded or a script malfunction")
end

end;
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
 
function onTrigger(player,npc)
 
-- armor set 1 0xFFF = everything 12
-- armor set 2 0x3FFFF = everything 18
-- armor set 3 0x3FFF = everything 14
-- armor set 4 0xF7FFFF = everything 23
-- armor set 5 0xFFFFF = everything 20

-- Local Variables
gil = (player:getCurrGil());

player:setVar("armorStorageMenu",0)
menuFilter = {}
-- use global function to get menu filter for sets character has stored
menuFilter = getStoredSets(player) 

-- Play event with menu filter and enjoy!
event = Event(0x80305)
event:setParams((menuFilter[1]),(menuFilter[2]),(menuFilter[3]),(menuFilter[4]),gil,(menuFilter[5]));
player:startEvent(event);

end;
 
 
--------------------------------------
-- Default function to be called when no callback function is specified.
--------------------------------------
function onEventSelection(player,csid,option)
--print("the option was ",option);
--print("Event ID is ",csid);
if csid == 0x305 then
  -- variables
  armor = {}
  -- Use global script to acquire armor set information
  armor = getSetInfo(option) 

  if option > 0 and option < 1073741824 then 
    -- send more information to event when something was selected on the menu
    player:updateEvent(armor[6],armor[3],armor[4],armor[5],armor[2],armor[7])
  end

end

end;

--------------------------------------
-- Self defined function that will be triggered on event finish.
--------------------------------------
function onEventFinish(player,csid,option)
--print("the menuchoice was ",option);
--print("Event ID is ",csid);

if csid == 0x305 then
  -- variables
  armor = {}
  -- Use global script to acquire armor set information
  armor = getSetInfo(option) 

  -- return stored items script
  if option > 0 and option < 1073741824 then 
    player:removeGil(armor[7]) -- take gil required for removing armor from storage
    player:removeKeyItem(armor[1]) -- take key item for stored set
    player:specialMessage(213, armor[1]);
    player:addItem(armor[2])
    player:specialMessage(209, armor[2]);
    player:addItem(armor[3])
    player:specialMessage(209, armor[3]);
    player:addItem(armor[4])
    player:specialMessage(209, armor[4]);
    player:addItem(armor[5])
    player:specialMessage(209, armor[5]);
    if (armor[6]) == 0 then 
      -- do nothing if the 5th item has an item ID of 0x0
      -- for 4 item sets
    else 
      -- check shows this is a 5 item set,return 5th item
      player:addItem(armor[6])
      player:specialMessage(209, armor[6]);
    end
  end

end

end;
