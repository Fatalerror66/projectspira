-----------------------------------
-- Author: Arcanedemonm, ReaperX, Almendro
-- Cid
-- CoP Mission 3.1 "Call of the Wyrmking", "Cid's Secret"
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Bastok_Metalworks/TextIDs"] = nil;
require("scripts/zones/Bastok_Metalworks/TextIDs");

KEYITEM_OBTAINED = 259; -- this is already defined in TextIDs.lua but for some reason it doesn't work.
LOW_MISSIONS = 1167; -- text offset for Cid's low level bastok missions.
-----------------------------------
-- Initialization
 UnfinishedLetter = 0x72;
        RamMantle = 0x3502;
     FadedCrystal = 613
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
---------------------- Cid Events -------------------------
--[[ I put the ones that only contain Cid but are not initiated by him in parentheses.

01F7 -- opening CS for Bastok Mission 1.2: "A Geological Survey "
01F8 -- final CS for Bastok Mission 1.2: "A Geological Survey "
01F9 -- opening CS for Bastok Mission 2.1: "The Crystal Line"
01FA -- 2nd CS for Bastok Mission 2.1: "The Crystal Line"
01F4 -- default event: "I'm sorry kid, I'm a little busy right now. Come back later."
01F6 -- same as 01F4 ?
02D0 -- same as 01F4 ?
01FB -- opening CS for quest: "Cid's Secret"
01FC -- quest: "Cid's Secret"
01FD--  final CS for quest: "Cid's Secret"
025B -- (rank 6!)
02F3 -- (final CS for DRK AF1)
02F8 -- CS for DRK AF1
03F2 -- (final CS for Bsatok Mission 3.2 "To the Forsaken Mines")
02FB -- first CS for Bastok Mission 7.1 "The Final Image" after accepting mission from gate guard
02FC -- final CS for Bastok Mission 7.1 "The Final Image"
030C -- (opening CS with Iron Eater for Bastok Mission 9.2. "Where Two Paths Converge")
030E -- (final CS for Bastok Mission 9.2. "Where Two Paths Converge", rank 10)
031B -- opening CS for "Shoot First, Ask Questions Later" (Detonator quest)
031C -- Detonator quest: for aborting quest or getting a second Gun of Trials
031D -- Detonator quest: Gun of Trials doesn't have enough WS points
031E -- Detonator quest: Cid gives you Map to the Annals of Truth
031F -- Detonator quest: final CS
035D -- post-Call of The Wyrmking dialog : "Bahamut...Tavnazia... My ears still doubt the conversation I just heard. Could it all be true?"
034E -- denies real knowledge of the multinational expedition
034F -- final CS for 3.3 "The Road Forks"
035E -- repeats information about the Star of Tavnazia from 034F
0350 -- talks about magicite
035F -- asks player to go to Pso'Xja
0353 -- "So what are you going to do" menu (CoP 5.3 "Three Paths")
035A -- talks about airship and prishe
034D -- main CS for CoP 3.1 "Call of the Wyrmking"
0351 -- 
0352 -- 
0354 -- 
0355 -- 
0356 -- 
0357 -- 
0358 -- 
0359 -- 
0364 -- 
0365 -- 
0373 -- 
0374 -- 
037A -- 
037B -- 
037C -- 
037D -- 
037E -- 
037F -- 
0381 -- 
0382 -- 
--]]
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
CidsSecret = player:getQuestStatus(1,26);
CidsSecret_tempVar = player:getVar("CidsSecret_tempVar");
bflvl = player:getFameLevel(1);

bastok_mission_status =  player:getVar("mission_status");
wyrm_king_status = player:getVar("CallOfTheWyrmking"); 		-- tracks fine progress within this mission; 1 means has seen Port Bastok CS
-- cop_status1 = player:getMissionStatus(6,14);           -- "Emerald Waters"
-- cop_status2 = player:getMissionStatus(6,21);           -- "Exit Stage Left"
-- cop_status3 = player:getMissionStatus(6,22);           -- "Tending Aged Wounds"
-- I'd expect cop_status1 == cop_status2 = 2 after setting the missions to complete in Hinaree.lua and YoranOran.lua but their value is 0 after
-- completing the Sandy and Windy parts >< so I'm using a workaround for now.

event = Event(0x01F4); -- default event  

if ( player:getMissionStatus(6,11) == 1 and wyrm_king_status == 1 ) then
	event = Event(0x034D);   
elseif (player:getMissionStatus(6,12) == 1) then				-- 3.2 "A Vessel Without a Captain"
	event = Event(0x035D);																-- possible bug: will Cid only says this while you are on mission 3.2, or all the way till you talk to him again at the end of mission 3.3??
elseif (((player:getVar("EmeraldWaters") == 1) and (player:getVar("ComedyofErrors") < 10))
 or ((player:getVar("EmeraldWaters") == 0) and (player:getVar("ComedyofErrors") == 10))) then
	event = Event(0x034E);																-- speculative.. I assume that this is triggered while you haven't completed your investigations in Sandy or Windy fully.
elseif (player:getVar("EmeraldWaters") == 1) or (player:getVar("ComedyofErrors") == 10) then
	event = Event(0x034F); 
	player:completeMission(6,13);													-- "The Road Forks" complete
	player:currentMission(6,22);													-- now on 3.4 "Tending Aged Wounds"
elseif (player:getMissionStatus(6,22) == 1) then
	event = Event(0x035E);
elseif (player:getMissionStatus(1,1) == 1) then					-- for "A Geological Survey"
	if (bastok_mission_status == 1) then
		event = Event(0x01F7);
	elseif (player:hasKeyItem(BlueAcidityTester) == 1) then	
		player:showText(npc,LOW_MISSIONS); -- "What is it for? Well, in order for you to understand, "
		event = nil;
		if (DEBUG_MODE) then
			player:setPos(-133, 3, 130, 185, 0xBF);   -- to Wadi
		end
	elseif (player:hasKeyItem(RedAcidityTester) == 1) then	
		event = Event(0x01F8);
	end
elseif (player:getMissionStatus(1,1) == 2) and (player:getMissionStatus(1,2) == 0) then
	player:showText(npc,LOW_MISSIONS+16);
	event = nil;
	if (DEBUG_MODE) then
    player:setPos(130, 8.5, -1.6, 228, 0xEC);   -- to Argus
  end;
elseif (player:getMissionStatus(1,3) == 1) then					-- for "The Crystal Line"
	if (bastok_mission_status == 1) then
		event = Event(0x01F9);
		player:setVar("mission_status",2);
	end
	  if (bastok_mission_status == 2) then 								-- repeats information
      player:showText(npc,LOW_MISSIONS+23);
      event = nil;
      if (DEBUG_MODE) then
        player:setPos(220,19,305,0xc0,0x6c);
      end;
	  end;
	  if (bastok_mission_status == 3) then 								-- repeats information
      player:showText(npc,LOW_MISSIONS+32);
      event = nil;
	  end;
elseif (player:getMissionStatus(1,18) == 1) then				-- for "The Final Image"
	if (player:hasKeyItem(ReinforcedCermet) == 1) then
		event = Event(0x02FC);
	elseif (bastok_mission_status == 1) then
		event = Event(0x02FB);
		player:setVar("mission_status",2);
	elseif (bastok_mission_status == 2) then
		player:showText(npc,2245); -- "I'll be waiting for you here."
    event = nil;
    if (DEBUG_MODE) then
      player:setPos(-239,0,633,188,0x79);
    end;
	end

-----------------------------------
-- Cid's Secret
-----------------------------------
elseif(bflvl >= 4 and CidsSecret == 0)then
	event = Event(0x1FB);
	player:addQuest(1,26);
	player:setVar("CidsSecret_tempVar",1);
elseif( CidsSecret == 1 and player:hasKeyItem(UnfinishedLetter) == 1)then
	event = Event(0x1FD);
elseif(CidsSecret == 1 and CidsSecret_tempVar == 2)then
	event = Event(0x1FC);
end
-----------------------------------

if (event ~= nil) then
 player:startEvent(event);
end;
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
bastok_mission_status =  player:getVar("mission_status");
if(trade:getItemCount() == 1 and trade:hasItemQty(FadedCrystal,1) and player:getMissionStatus(1,3) == 1 and bastok_mission_status == 2) then
	trade:isComplete();
	event = Event(0x1FA);
	if (player:getMissionStatus(6,2) == 0) then -- slight change in dialog depending on whether player has finished "Below The Arks"
	  event:setParams(1);
	end;
	player:startEvent(event);  
end
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0x34D) then
	player:completeMission(6,11);  -- CoP 3.1 : "call of the Wyrmking"
	player:currentMission(6,12);
	player:setVar("CallOfTheWyrmking",0); -- Deletes server's variable
elseif (csid == 0x1F7) then
	player:addKeyItem(BlueAcidityTester);
	player:specialMessage(KEYITEM_OBTAINED,BlueAcidityTester);
	player:setVar("mission_status",2);
elseif (csid == 0x1F8) then
	player:completeMission(1,1);
	player:setVar("mission_status",0);
	player:removeKeyItem(4);
	--print("finishing mission");
elseif (csid == 0x2FC) then
	add_rank_points_for_mission(player);
	player:completeMission(1,18);
	player:setVar("mission_status",0);
	player:removeKeyItem(ReinforcedCermet);
elseif (csid == 0x01FA) then
	player:setVar("mission_status",3);
	player:addKeyItem(CLReport);
	player:specialMessage(KEYITEM_OBTAINED,CLReport);
elseif(csid == 0x1FD) then
	player:completeQuest(1,26);
	player:removeKeyItem(UnfinishedLetter);
	player:addItem(RamMantle);
	player:specialMessage(ITEM_OBTAINED,RamMantle);
	player:addFame(1,BAS_FAME*280);
	player:setVar("CidsSecret_tempVar",0); -- Deletes server's variable
end
end;