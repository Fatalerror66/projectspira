-----------------------------------
--	Author: JesseJames
-- 	Balasiel
-- 	Basic Text Scripted, Quest text needed

--	Edited: Mana 7/2/09
--	Some cleanup
--	Added debugging text (names for each section to display in server console)
--	Added Squire's Test
--	Added Title Change
--	Added Quest logging
--	Added A Squire's Test II
--	Added a Knight's Test
--	Added Advanced job unlock (Paladin)

-- Tenjou (8/19/09)
-- Just changed it so you can customize PLD unlock quest level in settings.lua
-----------------------------------
-- additional global requirements
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");

            Spatha = 16565;
 SquireCertificate = 0x8E;
       BookOfTasks = 0x8F;
        KiteShield = 12306;
        
     StalactiteDew = 0x8D;
       KnightsSoul = 0x92;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	
	
	--print("onTrigger");
	
		
	--CHECKS and VARIABLE assignments
	--Fame
	fame = player:getFameLevel(0)
	--Level
	level = player:getMainLvl()
	--Key Items
	
	--Quest log
	squirestest = player:getQuestStatus(0,10);
	squirestestii = player:getQuestStatus(0,19);
	knightstest = player:getQuestStatus(0,29);
	--EVENTS
	-------------
	-- 0x29B - Let your heart be your guide, but always keep a clear mind. Good luck.
	-- 0x29C - Take up a sword, my friend. Ill talk to you when you do, and no sooner.
	-- 0x268 - A Squire's Test - Begin (Accept menu)
	-- 0x269 - A Squire's Test - Completion cut-scene
	-- 0x271 - A Squire's Test II - Begin
	-- 0x272 - A Squire's Test II - Completion cut-scene
	-- 0x273 - A Knight's Test - Begin (Accept menu)
	-- 0x274 - A Knight's Test - Completion cut-scene
	-- 0x276 - 
	-- 0x277 - 
	-- 0x27B - 
	-- 0x3F - 
	-------------
	--Standard event without propper level/fame
	if fame < 1 then
		quest = Event(0x29c);
		quest:setParams();
	end
	if fame >= 1 then
	--Squire's Test
		if (squirestest == 0 and level >= 7) then
			quest = Event(0x268);
			quest:setParams();
		end
	--Squire's Test II
		if (squirestest == 2 and squirestestii == 0 and level >= 15) then
			player:addQuest(0,19)
			quest = Event(0x271);
			quest:setParams();
		end
	--Knight's Test
		if (squirestestii == 2 and knightstest == 0 and level >= ADVANCED_JOB_LEVEL) then
			quest = Event(0x273);
			quest:setParams();
		end
		if (squirestestii == 1 and player:hasKeyItem(StalactiteDew)) then
			player:startEvent(Event(0x272));
		end
		if (knightstest == 1 and player:hasKeyItem(KnightsSoul)) then
			player:startEvent(Event(0x274));
		end
		-- Event started
		if (squirestest == 1 or squirestestii == 1 or knightstest == 1) then
			quest = Event(0x29b);
		end
	end -- fame > 1
	--Actual Event execution
	player:startEvent(quest)
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	--print("onTrade") 
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1488)
	end
	--Quest log
	squirestest = player:getQuestStatus(0,10);
	item1 = trade:hasItemQty(940,1);
	if (squirestest == 1 and item1 == true) then
		trade:isComplete();
		player:startEvent(Event(0x269));
	else
	--print("oops,either wrong items traded or a script malfunction")
	end
	
end; 
 
-----------------------------------
--onEventSelection Action--
-----------------------------------
function onEventSelection(player,csid,option)
		--print("onEventSelection")
		--print("CSID:",csid);
		--print("RESULT:",option); 
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
		--print("onEventFinish")
		--print("CSID:",csid);
		--print("RESULT:",option); 
	if (csid == 0x268 and option == 0) then
		player:addQuest(0,10)
	end
	if (csid == 0x273 and option == 0) then
		player:addQuest(0,29)
		player:addKeyItem(BookOfTasks)
		player:specialMessage(KEYITEM_OBTAINED, BookOfTasks)
	end
	if csid == 0x269 then
		player:completeQuest(0,10)
		player:addItem(Spatha)
		player:specialMessage(ITEM_OBTAINED, Spatha)
		player:setTitle(69)
		player:addFame(0,SAN_FAME*20); 
	end
	if csid == 0x272 then
		player:completeQuest(0,19)
		player:addKeyItem(SquireCertificate)
		player:specialMessage(KEYITEM_OBTAINED, SquireCertificate)
		player:setTitle(72)
		player:addFame(0,SAN_FAME*50); 
	end
	if csid == 0x274 then
		player:completeQuest(0,29)
		player:addItem(KiteShield)
		player:specialMessage(ITEM_OBTAINED, KiteShield)
		player:unlockJob(7)
		player:setTitle(209)
		player:specialMessage(1334) -- you can now become a Paladin!
		player:addFame(0,SAN_FAME*100); 
	end
end;