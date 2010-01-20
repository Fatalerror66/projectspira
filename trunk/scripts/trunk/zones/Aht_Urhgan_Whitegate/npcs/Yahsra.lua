-----------------------------------
--	Author: ReaperX
-- 	Yahsra  (Leujaoam assault NPC)
-- 	Get assault missions and item rewards
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


--------- some debug code ------------------------

-- player:setVar("MERCENARY_RANK",11); -- set your mercenary rank
-- player:setVar("ASSAULT_NUMBER",0) -- erase assault mission
player:setVar("LEUJAOAM_ASSAULT_POINTS",500000) -- give yourself that many assault points here

---------- end debug code ----------------------

----------- retrieve assault related variables  ---------

rank = player:getVar("MERCENARY_RANK")
leujaoam_assault_points = player:getVar("LEUJAOAM_ASSAULT_POINTS")  -- points for this area
has_key_item = player:hasKeyItem(0x313);                            -- has Imperial Army I.D. Tag?
current_assault_mission = player:getVar("ASSAULT_NUMBER");          -- this is the number of the assault mission that the player
																																		-- has signed up for. None = 0, Leujaoam Cleansing = 1, etc.
-- there is intentionally only one common variable for all areas since one can only have one active assault at a time.

--------- Mercenary Ranks -----------------
-- rank = 0 : has not completed Aht Urhgan Mission 3: President Salaheem yet -> is not a mercenary of Aht Urghan.
-- rank = 1 : PSC Private Second Class
-- rank = 2 : PFC Private First Class
-- rank = 3 : SP Superior Private
-- rank = 4 : LC Lance Corporal
-- rank = 5 : C Corporal
-- rank = 6 : S Sergeant
-- rank = 7 : SM Sergeant Major
-- rank = 8 : CS Chief Sergeant
-- rank = 9 : SL Second Lieutenant
-- rank = 10: FL First Lieutenant
-- rank = 11: Captain 

------------ end assault variables -----------------

-- Vashra has three events:
-- 0x0117 "Persons who have not completed mercenary registration are ineligible to sign up for Assault missions" (rank 0)
-- 0x0111 "This is the reception counter for assault missions in Leujaoam Sanctum." (rank > 0)
-- 0x010D (unknown function)

if (current_assault_mission > 0) then 
  has_assault_mission_already = 1;
else
  has_assault_mission_already = 0;
end;

if (rank == 0) then
  event = Event(0x0117);
else 
  event = Event(0x0111);
  event:setParams(rank,has_key_item, leujaoam_assault_points,has_assault_mission_already, 0); 
end

player:startEvent(event);
  
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
--onEventSelection Action--
-----------------------------------
function onEventSelection(player,csid,option)
--print("onEventSelection")
--print("onEventSelection - CSID:",csid);         
--print("onEventSelection - option ===",option); 


-- last_param: 0 = wrong job to equip, 1 = too low to equip, 2 can equip 
-- to check for equipment, 

-- here we would need something like last_param = player:canEquip(itemID) that returns the needed values.
-- could implement this on a case-by-case basis here, but would inefficient, since the item data that is 
-- already in the database and would have to be duplicated here.

player:updateEvent(0,0,0,0,2); --- last_param = 2 hardcoded for now.
end;

  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);

if (option >= 17) and (option <=161) then  -- player signed up one of the missions:

-- option = 17: Leujaoam Cleansing
-- option = 33: Orichalcum Survey
-- option = 49: Escort Professor Chanoix
-- option = 65: Shanarha Grass Conservation
-- option = 81: Counting Sheep
-- option = 97: Supplies Recovery
-- option = 113: Azure Experiments
-- option = 129: Imperial Code
-- option = 145: Red Versus Blue
-- option = 161: Bloody Rondo 
  
player:setVar("ASSAULT_NUMBER", (option-1)/16); -- number of current mission signed up for, has to be used later at entry.
player:addKeyItem(0x2FA); -- give player Leujaoam assault oders
player:specialMessage(23,0x2FA); -- obtained key item message
player:removeKeyItem(0x313); -- remove imperial army I.D. tag (can someone confirm that the key item is removed at this time??)
end;

if (option >= 16386) then  -- player chose to buy an item

--- rewards -----------------
-- option=16386: Stoic Earring 3,000 	 
-- option=32770: Unfettered Ring 5,000 	 
-- option=49154: Tempered Chain 8,000
-- option=65538: Potent Belt 10,000
-- option=81922: Miraculous Cape 10,000 	 
-- option=98306: Yigit Bulawa 15,000 	 
-- option=114690: Imperial Bhuj 15,000 	 
-- option=131074: Pahluwan Patas 15,000
-- option=147458: Amir Kolluks 20,000 	 
-- option=163842: Pahluwan Qalansuwa 20,000
-- option=180226: Yigit Seraweels 20,000 
------------------------

cost = 0;
if (option == 16386) then
  cost = 3000;
  player:addItem(15970);
  player:specialMessage(20,15970);
elseif (option == 32770) then
  cost = 5000;
  player:addItem(15775);
  player:specialMessage(20,15775);
elseif (option == 49154) then
  cost = 8000;
  player:addItem(15521);
  player:specialMessage(20,15521);
elseif (option == 65538) then
  cost = 10000;
  player:addItem(15884);
  player:specialMessage(20,15884);
elseif (option == 81922) then
  cost = 10000;
  player:addItem(15490);
  player:specialMessage(20,15490);  
elseif (option == 98306) then
  cost = 15000;
  player:addItem(18408);
  player:specialMessage(20,18408);
elseif (option == 114690) then
  cost = 15000;
  player:addItem(18485);
  player:specialMessage(20,18485);
elseif (option == 131074) then
  cost = 15000;
  player:addItem(18365);
  player:specialMessage(20,18365);
elseif (option == 147458) then
  cost = 20000;
  player:addItem(14933);
  player:specialMessage(20,14933);
elseif (option == 163842) then
  cost = 20000;
  player:addItem(16069);
  player:specialMessage(20,16069);
elseif (option == 180226) then
  cost = 20000;
  player:addItem(15606);
  player:specialMessage(20,15606);
end;

leujaoam_assault_points = leujaoam_assault_points - cost;
player:setVar("LEUJAOAM_ASSAULT_POINTS",leujaoam_assault_points);

end;

end;