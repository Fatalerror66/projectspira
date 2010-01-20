-----------------------------------
--	Author: ReaperX
-- 	Sorrowful Sage (Nyzul Assault NPC)
-- 	Sign up for Nyzul Assaults
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)


--------- some debug code ------------------------

--player:setVar("MERCENARY_RANK",11); -- set your mercenary rank
--player:setVar("ASSAULT_NUMBER",0) -- erase assault mission
--player:setVar("NYZUL_TOKENS",200000) -- give yourself nyzul tokens
--player:setVar("NYZUL_FLOOR",100) -- completed nyzul floor - a multiple of 5

---------- end debug code ----------------------

----------- retrieve assault related variables  ---------

rank = player:getVar("MERCENARY_RANK")
nyzul_tokens = player:getVar("NYZUL_TOKENS")     									  -- points for this area
has_key_item = player:hasKeyItem(0x313);                            -- has Imperial Army I.D. Tag?
current_assault_mission = player:getVar("ASSAULT_NUMBER");          -- this is the number of the assault mission that the player
																																		-- has signed up for. None = 0, {}  = 1, etc.
-- there is intentionally only one common variable for all areas since one can only have one active assault at a time.

nyzul_floor = player:getVar("NYZUL_FLOOR");

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

-- Sorrowful Sage has three events:
-- 0x011C "Persons who have not completed mercenary registration are ineligible to sign up for Assault missions" (rank 0)
-- 0x0116  "This is the reception counter for assault missions." (rank > 0)
-- 0x010D (unknown function)

if (current_assault_mission > 0) then 
  has_assault_mission_already = 1;
else
  has_assault_mission_already = 0;
end;

if (rank == 0) then
  event = Event(0x011C);
else 
  event = Event(0x0116);
  event:setParams(rank,has_key_item, nyzul_tokens,has_assault_mission_already, nyzul_floor); 
end

player:startEvent(event);
  
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);

if (option == 817) then  -- player signed up for nyzul assault
                
player:setVar("ASSAULT_NUMBER", 1); -- number of current mission signed up for, always 1 for Nyzul.
player:addKeyItem(0x36E); -- give player Nyzul Isle Assault orders  
player:specialMessage(23,0x36E); -- obtained key item message
player:removeKeyItem(0x313); -- remove imperial army I.D. tag (can someone confirm that the key item is removed at this time??)
--print("Player got key item");
end;

end;