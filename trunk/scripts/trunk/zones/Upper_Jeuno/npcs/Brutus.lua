-----------------------------------
--	Author: Tenjou
-- 	Brutus
-- 	Starts quests related to Chocobo license.
--	Starts various BST-related quests.
--	Starts quest for final Axe WS.
-- *08/10/2009 - Almendro
--     Added Chocobo on the Loose!
--	   Added Chocobo wounds
-- *08/11/2009 - Almendro
--	   Added Wings of Gold
--     Added Path of the beastmaster
-- *08/12/2009 - Almendro
--     Added Scattered into Shadow
-- *08/13/2009 - Almendro
--     Added Axe the Competition
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/Utils");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------
-- Initialization
  Weapontrainingguide = 0x157;
    ChocoboEggBitWarm = 0x90D;
          GuidingBell = 0xE8;
		  BarbaroiAxe = 0x4128;
		 BeastGaiters = 0x3711;
		 PickofTrials = 0x460D;
		   Aquaflora1 = 0xE5;
		   Aquaflora2 = 0xE6;
		   Aquaflora3 = 0xE7;
MaptotheAnnalsofTruth = 0x158;
	    AnnalsofTruth = 0x159;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
               level = player:getMainLvl();
			     job = player:getMainJob();
      chocobosWounds = player:getQuestStatus(3,4);      -- http://wiki.ffxiclopedia.org/wiki/Chocobo%27s_Wounds
   chocoboOnTheLoose = player:getQuestStatus(3,92);     -- http://wiki.ffxiclopedia.org/wiki/Chocobo_on_the_Loose!
           SaveMySon = player:getQuestStatus(3,5);      -- http://wiki.ffxiclopedia.org/wiki/Save_My_Son
PathoftheBeastmaster = player:getQuestStatus(3,19);     -- http://wiki.ffxiclopedia.org/wiki/Path_of_the_Beastmaster
         WingsofGold = player:getQuestStatus(3,60);     -- http://wiki.ffxiclopedia.org/wiki/Wings_of_Gold
 ScatteredintoShadow = player:getQuestStatus(3,61);     -- http://wiki.ffxiclopedia.org/wiki/Scattered_into_Shadow
   AxetheCompetition = player:getQuestStatus(3,59);     -- http://wiki.ffxiclopedia.org/wiki/Axe_the_Competition
------------------------------------------------------------
-- Chocobo on the Loose!
------------------------------------------------------------
if(chocoboOnTheLoose == 0) then
	-- Start of Chocobo on the Loose!
	player:startEvent(Event(0x276D));
elseif(player:getVar("chocoboOnTheLoose") == 1 and player:getVar("chocoboOnTheLoose_NextQuest") == 0)then
	-- After accepting Chocobo on the Loose! and talk again
	player:startEvent(Event(0x276E));
	player:setVar("chocoboOnTheLoose_NextQuest",1);
elseif(player:getVar("chocoboOnTheLoose") == 2)then
	-- Chocobo on the Loose!: after doing the latheine plateau part
	player:startEvent(Event(0x276F));	
elseif(player:getVar("chocoboOnTheLoose") == 3 and player:getVar("chocoboOnTheLoose_NextQuest") == 0)then
	-- Chocobo on the Loose!: after doing the latheine plateau part and talk again
	player:startEvent(Event(0x2773));
	player:setVar("chocoboOnTheLoose_NextQuest",1);
elseif(player:getVar("chocoboOnTheLoose") == 4)then
	-- Final cutscene,now you have to wait will 0:00 vanadiel day
	player:startEvent(Event(0x2774));
elseif(player:getVar("chocoboOnTheLoose") == 5 and os.time() >= player:getVar("chocoboOnTheLooseTimeToGetEgg"))then
	-- Time have passed and he gives you the egg
	player:startEvent(Event(0x277D));
elseif(player:getVar("chocoboOnTheLoose") == 5 and os.time() < player:getVar("chocoboOnTheLooseTimeToGetEgg") and player:getVar("chocoboOnTheLoose_NextQuest") == 0)then
	player:startEvent(Event(0x41));-- Maybe there is a better event when you talk again and haven't passed the time but I dont know which one it is.
	player:setVar("chocoboOnTheLoose_NextQuest",1);	
------------------------------------------------------------
-- Chocobo Wounds quest
------------------------------------------------------------	
elseif(level >= 20 and chocobosWounds ~= 2)then

	if(chocobosWounds == 0)then
		-- Offer quest "Chocobo's Wounds"
		player:startEvent(Event(0x47));
	else
		-- Talking after getting the "Chocobo's Wounds" quest
		player:startEvent(Event(0x66));
	end
------------------------------------------------------------
elseif(level >= 30 and SaveMySon == 2 and PathoftheBeastmaster == 0 ) then
	player:startEvent(Event(0x46)); -- unlock BST job event
elseif(level >= 40 and job == 9 and WingsofGold ~= 2) then
-- Wings of Gold start event
	if(WingsofGold == 0) then
		if(player:getVar("WingsOfGoldRefuse") == 0)then
		-- Player hasn't refused to get the quest
			player:startEvent(Event(0x8B));
		else
		-- Player has refused to get the quest
			player:startEvent(Event(0x89));
		end
	else
		if(player:hasKeyItem(GuidingBell) == 0) then
			player:startEvent(Event(0x88));
		else
			player:startEvent(Event(0x8A));
		end
	end
elseif(level >= 50 and job == 9 and ScatteredintoShadow ~=2 ) then
-- Scattered into Shadow
	if(ScatteredintoShadow == 0) then
		if(player:getVar("ScatteredintoShadowRefuse") == 0)then
		-- Player hasn't refused to get the quest
			player:startEvent(Event(0x8D));
		else
		-- Player has refused to get the quest
			player:startEvent(Event(0x8F));
		end		
	else 
		-- player has the quest
		if(player:getVar("ScatteredintoShadow") == 1) then
			if( player:hasKeyItem(Aquaflora1) == 0 and player:hasKeyItem(Aquaflora2) == 0 and player:hasKeyItem(Aquaflora3) == 0 ) then
			-- Has completed the Fei'Yin part
				player:setVar("ScatteredintoShadow",2);
				player:startEvent(Event(0x90));
			else
			-- Talk again without had completed the Fei'Yin part
				player:startEvent(Event(0x8E));
			end
		elseif(player:getVar("ScatteredintoShadow") == 2) then
			-- Talk again after completing the Fei'Yin part
			player:startEvent(Event(0x95));
		elseif(player:getVar("ScatteredintoShadow") == 3) then
			-- Quest done!
			player:startEvent(Event(0x87));
		end
	end
elseif(level >= 71 and player:getSkill(5) >= 240 and AxetheCompetition ~= 2 and player:hasKeyItem(Weapontrainingguide) == 0 and (job == 9 or job == 1 or job == 11 or job == 8)) then
-- Checks if:
--     * player can wear pick of trials which is an axe and can only wear axes the following jobs: BST, WAR, RNG and DRK
--     * lv 71 or higher
--     * Axe skill 240 or higher
--     * Has not completed the quest Axe the Competition
--     * Has no other WS quests active (keyitem check)
-- Axe the Competition
	if ( AxetheCompetition == 0 ) then
	-- Player hasnt go the quest
		player:startEvent(Event(0xC));
	else
	-- Player has the quest active
		if( player:getVar("AxetheCompetition") == 1 ) then 
		-- Display a menu to refuse the quest or get another pick if you lost it
			player:startEvent(Event(0xF));
		elseif( player:getVar("AxetheCompetition") == 2 ) then
		-- if you talking again
			player:startEvent(Event(0x10));
		elseif( player:getVar("AxetheCompetition") == 4 ) then 
		-- After killing the NM in Temple of Uggalepih (Quest complete)
			player:startEvent(Event(0x11));
		end
	end
end
end;
	

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
PickofTrials1 = trade:hasItemQty(PickofTrials,1);
          gil = trade:getGil();
        count = trade:getItemCount();
if (count == 1 and PickofTrials1 and gil ==0 and player:getVar("AxetheCompetition") == 1 and player:getVar("AxeWeaponSkillPoints") >= 300 ) then 
-- "Axe the Competition": Player has done the 300 points 	
	player:startEvent(Event(0xD));
	player:setVar("AxetheCompetition",2);
else
-- Player hasnt done the 300 points
	player:startEvent(Event(0xE));
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
------------- Chocobo on the Loose! -------------
-- Accept quest: Chocobo on the Loose!
if (csid == 0x276D) then
	player:addQuest(3,92);
	player:setVar("chocoboOnTheLoose",1);
	
-- Chocobo on the Loose!: after doing the latheine plateau part
elseif (csid == 0x276F) then
	player:setVar("chocoboOnTheLoose",3);
	
-- Final cutscene,now you have to wait will 0:00 vanadiel day
elseif (csid == 0x2774) then
	player:setVar("chocoboOnTheLoose",5);
    player:setVar("chocoboOnTheLooseTimeToGetEgg",os.time() + secondsRemainingTillMidnight());
-- Time have passed and he gives you the egg
elseif (csid == 0x277D) then
	if(player:getFreeSlotCount(0)>=1) then -- Checks if there is at least a freeslot in your inventory
		player:addItem(ChocoboEggBitWarm); -- Chocobo_Egg_(Bit_Warm). This might be temporal because FFXIclopedia doesn't mention which type of egg this quest gives you
		player:specialMessage(ITEM_OBTAINED,ChocoboEggBitWarm);
		player:addFame(0,SAN_FAME*20); --Arbitrary amounts
		player:addFame(1,BAS_FAME*20);
		player:addFame(2,WIN_FAME*20);
		player:setVar("chocoboOnTheLoose",0);              -- Deleting variable from server
		player:setVar("chocoboOnTheLooseTimeToGetEgg",0);  -- Deleting variable from server
		player:setVar("chocoboOnTheLoose_NextQuest",0);    -- Deleting variable from server
		player:completeQuest(3,92);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,ChocoboEggBitWarm);
	end
------------ Chocobo's Wounds ---------------
-- Accept quest "Chocobo's Wounds"
elseif (csid == 0x47 and option == 1) then
	player:addQuest(3,4);
------------ BST job unlock ---------------
elseif (csid == 0x46) then
	player:unlockJob(9); -- unlock BST
	player:addQuest(3,19);
	player:completeQuest(3,19); -- http://wiki.ffxiclopedia.org/wiki/Path_of_the_Beastmaster
	player:specialMessage(844); -- Now you can become a BST	
------------ Wings of Gold ---------------
-- Accept quest "Wings of Gold"
elseif (csid == 0x8B) then
	if(option == 1) then
		player:addQuest(3,60);
		player:setVar("WingsOfGoldRefuse",0);
	else
		player:setVar("WingsOfGoldRefuse",1);
	end
-- After refusing the quest
elseif (csid == 0x89) then
	if(option == 1) then
		player:addQuest(3,60);
		player:setVar("WingsOfGoldRefuse",0);
	else
		player:setVar("WingsOfGoldRefuse",1);
	end
-- Quest completed
elseif (csid == 0x8A ) then
	if(player:getFreeSlotCount(0)>=1) then -- Checks if there is at least a freeslot in your inventory
		player:addItem(BarbaroiAxe);
		player:specialMessage(ITEM_OBTAINED,BarbaroiAxe);	
		player:removeKeyItem(GuidingBell);
		player:addFame(0,SAN_FAME*60); --Arbitrary amounts
		player:addFame(1,BAS_FAME*60);
		player:addFame(2,WIN_FAME*60);
		player:completeQuest(3,60);	
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,BarbaroiAxe);
	end
------------ Scattered into Shadow ------------
-- Accept quest "Scattered into Shadow"
elseif (csid == 0x8D) then
	if(option == 1) then
		player:addQuest(3,61);
		player:addKeyItem(Aquaflora1);
		player:addKeyItem(Aquaflora2);
		player:addKeyItem(Aquaflora3);
		player:setVar("ScatteredintoShadowRefuse",0);
		player:setVar("ScatteredintoShadow",1);
	else
		player:setVar("ScatteredintoShadowRefuse",1);
	end
-- After refusing the quest
elseif (csid == 0x8F) then
	if(option == 1) then
		player:addQuest(3,61);
		player:addKeyItem(Aquaflora1);
		player:addKeyItem(Aquaflora2);
		player:addKeyItem(Aquaflora3);
		player:setVar("ScatteredintoShadowRefuse",0);
		player:setVar("ScatteredintoShadow",1);
	else
		player:setVar("ScatteredintoShadowRefuse",1);
	end
-- Quest complete
elseif (csid == 0x87) then	
	if(player:getFreeSlotCount(0)>=1) then -- Checks if there is at least a freeslot in your inventory
		player:addItem(BeastGaiters);
		player:specialMessage(ITEM_OBTAINED,BeastGaiters);
		player:addFame(0,SAN_FAME*120); --Arbitrary amounts
		player:addFame(1,BAS_FAME*120);
		player:addFame(2,WIN_FAME*120);
		player:setVar("ScatteredintoShadow",0); -- Deleting char_vars variable from server
		player:completeQuest(3,61);
	else
		player:specialMessage(ITEM_CANNOT_BE_OBTAINED,BeastGaiters);
	end
------------- Axe the Competition --------------
-- Acepting
elseif (csid == 0xC and option == 1 ) then
	player:addQuest(3,59);
	player:addItem(PickofTrials);
	player:specialMessage(ITEM_OBTAINED,PickofTrials);
	player:addItem(Weapontrainingguide);
	player:specialMessage(KEYITEM_OBTAINED,Weapontrainingguide);	
	player:setVar("AxeWeaponSkillPoints",0);
	player:setVar("AxetheCompetition",1);
elseif(csid == 0xD)then
	player:addKeyItem(MaptotheAnnalsofTruth);
	player:specialMessage(KEYITEM_OBTAINED,MaptotheAnnalsofTruth);
-- Talk again
elseif (csid == 0xF) then
	if(option == 2) then
	-- Abandon the quest
		-- player:abandonQuest(3,59);
		player:removeItem(PickofTrials);
		player:setVar("AxeWeaponSkillPoints",0); -- Deletes var from the server
		player:setVar("AxetheCompetition",0);    -- Deletes var from the server
	elseif(option ==1 ) then
	-- Give me another Pick of Trials
		player:addItem(PickofTrials);
		player:specialMessage(ITEM_OBTAINED,PickofTrials);
		player:setVar("AxeWeaponSkillPoints",0); -- Restarts the counting
	end
-- Quest complete
elseif( csid == 0x11 ) then
	player:removeKeyItem(AnnalsofTruth);
	player:removeKeyItem(MaptotheAnnalsofTruth);
	player:addFame(0,SAN_FAME*120); --Arbitrary amounts
	player:addFame(1,BAS_FAME*120);
	player:addFame(2,WIN_FAME*120);
	player:learnWs(0x48); -- learn WS Decimation
	player:completeQuest(3,59);
	player:setVar("AxetheCompetition",0);
	player:specialMessage(1847); -- You have learned the weapon skill "Decimation"!
end
end;