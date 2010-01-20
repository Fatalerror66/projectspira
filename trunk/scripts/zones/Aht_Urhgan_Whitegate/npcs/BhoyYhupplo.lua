-----------------------------------
--	Author: ReaperX
-- 	Bhoy Yhupplo (Ilrusi Atoll Assault NPC)
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
--player:setVar("ILRUSI_ASSAULT_POINTS",200000) -- give yourself assault points here

---------- end debug code ----------------------

----------- retrieve assault related variables  ---------

rank = player:getVar("MERCENARY_RANK")
ilrusi_assault_points = player:getVar("ILRUSI_ASSAULT_POINTS")      -- points for this area
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

-- Bhoy Yhupplo has three events:
-- 0x011B "Persons who have not completed mercenary registration are ineligible to sign up for Assault missions" (rank 0)
-- 0x0115  "This is the reception counter for assault missions." (rank > 0)
-- 0x010D (unknown function)

if (current_assault_mission > 0) then 
  has_assault_mission_already = 1;
else
  has_assault_mission_already = 0;
end;

if (rank == 0) then
  event = Event(0x011B);
else 
  event = Event(0x0115);
  event:setParams(rank,has_key_item, ilrusi_assault_points,has_assault_mission_already, 2); 
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

if (option >= 657) and (option <=801) then  -- player signed up one of the missions:

-- option = 657: Imperial Agent Rescue            
-- option = 673: Preemptive Strike    
-- option = 689: Sagelord Elimination 
-- option = 705: Breaking Morale             
-- option = 721: The Double Agent             
-- option = 737: Imperial Treasure Retrieval  
-- option = 753: Blitzkrieg           
-- option = 769: Marids in the Mist   
-- option = 785: Azure Ailments       
-- option = 801: The Susanoo Shuffle  
                
player:setVar("ASSAULT_NUMBER", (option-641)/16); -- number of current mission signed up for, has to be used later at entry.
player:addKeyItem(0x2FE); -- give player ilrusi assault oders
player:specialMessage(23,0x2FE); -- obtained key item message
player:removeKeyItem(0x313); -- remove imperial army I.D. tag (can someone confirm that the key item is removed at this time??)
--print("Player got key item");
end;

if (option >= 16386) then  -- player chose to buy an item

--- rewards -----------------
-- option=16386:  Velocity Earring 	 3,000 	 
-- option=32770:  Garrulous Ring 	 5,000 	 
-- option=49154:  Grandiose Chain 	 8,000 	 
-- option=65538:  Hurling Belt 	 10,000 
-- option=81922:  Invigorating Cape 	10,000 	 
-- option=98306:  Imperial Kaman 	15,000 	 
-- option=114690: Storm Zaghnal 	15,000 	 
-- option=131074: Storm Fife 	15,000   
-- option=147458: Yigit Turban 	20,000 	
-- option=163842: Amir Dirs 	20,000 	 
-- option=180226: Pahluwan Khazagand 	20,000                                                                                          
------------------------

cost = 0;
if (option == 16386) then
  cost = 3000;
  player:addItem(15974);
  player:specialMessage(20,15974);
elseif (option == 32770) then
  cost = 5000;
  player:addItem(15779);
  player:specialMessage(20,15779);
elseif (option == 49154) then
  cost = 8000;
  player:addItem(15525);
  player:specialMessage(20,15525);
elseif (option == 65538) then
  cost = 10000;
  player:addItem(15888);
  player:specialMessage(20,15888);
elseif (option == 81922) then
  cost = 10000;
  player:addItem(15494);
  player:specialMessage(20,15494);  
elseif (option == 98306) then
  cost = 15000;
  player:addItem(18685);
  player:specialMessage(20,18685);
elseif (option == 114690) then
  cost = 15000;
  player:addItem(18065);
  player:specialMessage(20,18065);
elseif (option == 131074) then
  cost = 15000;
  player:addItem(17851);
  player:specialMessage(20,17851);
elseif (option == 147458) then
  cost = 20000;
  player:addItem(16064);
  player:specialMessage(20,16064);
elseif (option == 163842) then
  cost = 20000;
  player:addItem(15604);
  player:specialMessage(20,15604);
elseif (option == 180226) then
  cost = 20000;
  player:addItem(14530);
  player:specialMessage(20,14530);
end;

ilrusi_assault_points = ilrusi_assault_points - cost;
player:setVar("ILRUSI_ASSAULT_POINTS",ilrusi_assault_points);

end;
end;