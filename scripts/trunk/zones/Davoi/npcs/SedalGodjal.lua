-----------------------------------
--	Author: Aurelias, ReaperX
--  Sedal-Godjal 
--  Crimson Orb Quest, Gives out the orb quest provided the player has checked the wall first. 
--	Windurst mission 8-1
-----------------------------------

require("scripts/globals/rankpoints");
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
require("scripts/zones/Davoi/TextIDs");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");

--[[ Events 

0014
0015
0016
0017
0018
0019
001A
001B
0076 CS for Windurst mission 8-1 
0077 repeats information
0078 CS after trading curse wand
0079 after seeing 78
007A CS for Windurst mission 8-2
007B after seeing 7A (?)

--]]

-----------------------------------
--onTrigger Action--
-----------------------------------
function onTrigger(player,npc)

	mission_status = player:getVar("mission_status") 
	wall = player:getVar("wall_of_banishing")
	
	if (player:getMissionStatus(2,20) == 1) and (player:getVar("mission_status") == 3) then	
		event = Event(0x76);
		event:setParams(0,CurseWand,StarSeeker);
		player:startEvent(event);
	elseif (player:getMissionStatus(2,20) == 1) and (player:getVar("mission_status") == 4) then	
		event = Event(0x77);
		event:setParams(0,CurseWand);
		player:startEvent(event);
	elseif (player:getMissionStatus(2,20) == 1) and (player:getVar("mission_status") == 5) then	
		player:startEvent(Event(0x79));
	elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 2) and (player:hasKeyItem(AurasteryRing) == 0) then
		event = Event(0x7A);
		event:setParams(0,AurasteryRing);
		player:startEvent(event);
  elseif (player:getMissionStatus(2,21) == 1) and (mission_status == 2) and (player:hasKeyItem(AurasteryRing) == 1) then
		event = Event(0x7B);
		event:setParams(0,AurasteryRing);
		player:startEvent(event);
	elseif(wall == 0) then --Normal Text, Player hasnt checked the Wall of Banishing
	  player:startEvent(Event(0x18));
	elseif(wall == 1) then --Player has checked the wall, can now accept the quest
		player:startEvent(Event(0x16));
	elseif(wall == 2) then --Normal Text that shows after player has accepted quest
		player:startEvent(Event(0x15));
	elseif(wall == 3) then --Player has the Cursed Orb, NPC now turns it into Crimson Orb
		sedal = Event(0x19);
		sedal:setParams(0,0,0,136);
		player:startEvent(sedal);
		player:addKeyItem(0x88); -- Adding Crimson Orb
		player:removeKeyItem(0x87); -- Removing Cursed Orb
		player:setVar("wall_of_banishing",4) --Chaning value to get the obtained message
	elseif(wall == 5) then
		player:startEvent(Event(0x1B)); --Normal Text
	end
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
if (trade:getItemCount() == 1) and (trade:hasItemQty(CurseWand,1)) and (player:getMissionStatus(2,20) == 1) and (player:getVar("mission_status") == 4) then
	trade:isComplete();
	player:startEvent(Event(0x78));
end
end;  

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
	wall = player:getVar("wall_of_banishing")
	if(option == 1 and wall == 1) then	
		player:addKeyItem(0x83); -- Adding White Orb
		player:specialMessage(KEYITEM_OBTAINED,0x83);
		player:setVar("wall_of_banishing",2) -- Pool part of quest started
	elseif(wall == 4) then
		player:specialMessage(23,0x88);
		player:setVar("wall_of_banishing",5) --Changing value so player doesnt get Crimson Orb CS again.
		player:setVar("groaningpond",0) 
		player:setVar("howlingpond",0)
		player:setVar("wailingpond",0)
		player:setVar("screamingpond",0) -- all no longer needed
	elseif (csid == 0x76) then
		player:setVar("mission_status",4);
		player:removeKeyItem(StarSeeker);
		player:addKeyItem(MagicDrainedStarSeeker);
	elseif (csid == 0x78) then
		player:setVar("mission_status",5);
	elseif (csid == 0x79) and (DEBUG_MODE) then
		player:setPos(170, -1.2, 160, 87, 0xEE); -- to Moreno-Toeno (Aurastery)
	elseif (csid == 0x7A) then
		player:addKeyItem(AurasteryRing);
		player:specialMessage(KEYITEM_OBTAINED,AurasteryRing);
	elseif (csid == 0x7B) and (DEBUG_MODE) then
		toRukususu(player)
	end
end;