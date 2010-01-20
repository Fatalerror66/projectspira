require("/scripts/globals/armorStorage");
-----------------------------------
-- Area:Bastok Market
--  NPC: sinon
-- Armor Storage NPC 
-----------------------------------
-- Bastok Markets - Sinon 0x18B,0x18C
-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
 
    -- Get all trade items from the stack
    -- Get all trade items from the stack
    for i=1,table.getn(arg) do
          --print(i,arg[i])
    end
npc = arg[1];
player = arg[2];
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
char = (player:getId());
npc = (npc:getName());
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
event = Event(0x8018B);
event:setParams(keyItem,0,0,0,0,storeCost);
player:startEvent( event);
player:addKeyItem(keyItem)
-- takes the armor from your inventory
player:removeItem(arg[3]);
player:removeItem(arg[5]);
player:removeItem(arg[7]);
player:removeItem(arg[9]);
player:removeItem(arg[11]);
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
char = (player:getId());
--player:setCurrGil(99999999)
npc = (npc:getName());
player:setVar("armorStorageMenu",0)
menuFilter = {}
menuFilter = getStoredSets(player) -- use global function to get menu filter for sets character has stored

-- Play event with menu filter and enjoy!
event = Event(0x8018C)
event:setParams((menuFilter[1]),(menuFilter[2]),(menuFilter[3]),(menuFilter[4]),gil,(menuFilter[5]));
player:startEvent( event);

end;
 
 
--------------------------------------
-- Default function to be called when no callback function is specified.
--------------------------------------
function onEventFinish(player,csid,menuchoice)
--print("the menuchoice was ",menuchoice);
--print("Event ID is ",csid);
if csid == 0x18C then
-- variables
armorStorageMenu = player:getVar("armorStorageMenu")
armor = {}
armor = getSetInfo(menuchoice) -- Use global script to acquire armor set information

if menuchoice ~= 0 and menuchoice ~= 1073741824 then -- send more information to event when something was selected on the menu
player:updateEvent(armor[2],armor[3],armor[4],armor[5],armor[6],armor[7])
end

-- return stored items script
if armorStorageMenu == 1 and menuchoice ~= 1073741824 then 
player:removeKeyItem(armor[1]) -- take key item for stored set
player:addItem(armor[2])
player:addItem(armor[3])
player:addItem(armor[4])
player:addItem(armor[5])
if (armor[6]) == 0 then -- do nothing if the 5th item has an item ID of 0x0
-- for 4 item sets
else -- check shows this is a 5 item set,return 5th item
player:addItem(armor[6])
end
player:removeGil(armor[7]) -- take gil required for removing armor from storage
end

-- used to track the menu levels - option bug work-arorund

armorStorageMenu = (armorStorageMenu + 1) 
player:setVar("armorStorageMenu",armorStorageMenu)
end

if csid == 0x18B then

end

-- Used outside ALL loops to release NPC after event to prevent freezing. REQUIRED FUNCTION
--player:sendRelease()
end;

--------------------------------------
-- Self defined function that will be triggered on event 0x80073 finish.
--------------------------------------
function onEventXFinish(player,csid,menuchoice)
--print("the menuchoice was ",menuchoice);
--print("Event ID is ",csid);


end;

