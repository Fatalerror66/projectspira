-----------------------------------
--	Author: ReaperX
-- 	Famad (Lebros Cavern Assault NPC)
-- 	Get assault missions and item rewards
-----------------------------------
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


--------- some debug code ------------------------

--player:setVar("MERCENARY_RANK",11); -- set your mercenary rank
--player:setVar("ASSAULT_NUMBER",0) -- erase assault mission
--player:setVar("LEBROS_ASSAULT_POINTS",200000) -- give yourself assault points here

---------- end debug code ----------------------

----------- retrieve assault related variables  ---------

rank = player:getVar("MERCENARY_RANK")
lebros_assault_points = player:getVar("LEBROS_ASSAULT_POINTS")      -- points for this area
has_key_item = player:hasKeyItem(0x313);                            -- has Imperial Army I.D. Tag?
current_assault_mission = player:getVar("ASSAULT_NUMBER");          -- this is the number of the assault mission that the player
																																		-- has signed up for. None = 0, {}  = 1, etc.
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

-- Famad has three events:
-- 0x0119 "Persons who have not completed mercenary registration are ineligible to sign up for Assault missions" (rank 0)
-- 0x0113  "This is the reception counter for assault missions in Lebros Cavern." (rank > 0)
-- 0x010D (unknown function)

if (current_assault_mission > 0) then 
  has_assault_mission_already = 1;
else
  has_assault_mission_already = 0;
end;

if (rank == 0) then
  event = Event(0x0119);
else 
  event = Event(0x0113);
  event:setParams(rank,has_key_item, lebros_assault_points,has_assault_mission_already, 2); 
  -- last param: 0 = wrong job to equip, 1 = too low to equip, 2 can equip - since it's not known at this call time what the player is 
  -- going to select, this can't be set correctly ???
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

if (option >= 337) and (option <=481) then  -- player signed up one of the missions:

-- option = 337: Excavation Duty                       
-- option = 353: Lebros Supplies    
-- option = 369: Troll Fugitives    
-- option = 385: Evade and Escape 
-- option = 401: Siegemaster Assassination  
-- option = 417: Apkallu Breeding           
-- option = 433: Wamoura Farm Raid          
-- option = 449: Egg Conservation           
-- option = 465: Operation: Black Pearl     
-- option = 481: Better Than One            
                
player:setVar("ASSAULT_NUMBER", (option-321)/16); -- number of current mission signed up for, has to be used later at entry.
player:addKeyItem(0x2FC); -- give player lebros assault oders
player:specialMessage(23,0x2FC); -- obtained key item message
player:removeKeyItem(0x313); -- remove imperial army I.D. tag (can someone confirm that the key item is removed at this time??)
--print("Player got key item");
end;

if (option >= 16386) then  -- player chose to buy an item

--- rewards -----------------
-- option=16386: Insomnia Earring 	 3,000 	 
-- option=32770: Hale Ring 	 5,000 	 
-- option=49154: Chivalrous Chain 	 8,000 	 
-- option=65538: Precise Belt 	 10,000 
-- option=81922: Intensifying Cape 	10,000 	 
-- option=98306: Imperial Pole 	15,000 	 
-- option=114690: Doombringer 	15,000 	 
-- option=131074: Sayosamonji 	15,000           
-- option=147458: Pahluwan Dastanas 	20,000 	 
-- option=163842: Yigit Crackows 	20,000 	 
-- option=180226: Amir Korazin 	20,000                                      
------------------------

cost = 0;
if (option == 16386) then
  cost = 3000;
  player:addItem(15972);
  player:specialMessage(20,15972);
elseif (option == 32770) then
  cost = 5000;
  player:addItem(15777);
  player:specialMessage(20,15777);
elseif (option == 49154) then
  cost = 8000;
  player:addItem(15523);
  player:specialMessage(20,15523);
elseif (option == 65538) then
  cost = 10000;
  player:addItem(15886);
  player:specialMessage(20,15886);
elseif (option == 81922) then
  cost = 10000;
  player:addItem(15492);
  player:specialMessage(20,15492);  
elseif (option == 98306) then
  cost = 15000;
  player:addItem(18583);
  player:specialMessage(20,18583);
elseif (option == 114690) then
  cost = 15000;
  player:addItem(18388);
  player:specialMessage(20,18388);
elseif (option == 131074) then
  cost = 15000;
  player:addItem(18417);
  player:specialMessage(20,18417);
elseif (option == 147458) then
  cost = 20000;
  player:addItem(14940);
  player:specialMessage(20,14940);
elseif (option == 163842) then
  cost = 20000;
  player:addItem(15690);
  player:specialMessage(20,15690);
elseif (option == 180226) then
  cost = 20000;
  player:addItem(14525);
  player:specialMessage(20,14525);
end;

lebros_assault_points = lebros_assault_points - cost;
player:setVar("LEBROS_ASSAULT_POINTS",lebros_assault_points);

end;

end;