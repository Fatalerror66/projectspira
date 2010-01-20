-----------------------------------
--	Author: Tenjou, ReaperX
-- 	Moreno-Toeno
-- 	Starts and ends quest "Teacher's Pet."
--  Windurst Missions 2-2 and 8-1
--  Windurst mission 2-2 works but since mission failure can't be implemented right now,
--  the mission has been implemented so that when you've failed it, you stay on the mission
--  and just have to try again until you s
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/rankpoints");
package.loaded["scripts/globals/conquest"] = nil;
require("scripts/globals/conquest");
package.loaded["scripts/globals/teleports"] = nil;
require("scripts/globals/teleports");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
require("scripts/zones/Windurst_Waters/TextIDs");

--[[ events 
0x0B6 opening CS for 2-2 (first completion)
0x0B5 opening CS for 2-2 (repeat-Tahrongi Canyon version) (I assume this one is given until you've passed the Tahrongi version once)
0x2AF opening CS for 2-2 (repeat-Buburimu Peninsula version)
0x0B7 tells you how much time is remaining 
0x0CA you spent too much time and failed the mission.
0x0CB repeats fail message: come back when you're stronger.
0x0B8 return the magic doll to me
0x0C6 return magic doll + you've failed miserably
0x0C7 return magic doll + you've failed
0x0C8 return magic doll + you've passed
0x0C9 return magic doll + you've passed well
0x0CC tells you how much time is remaining (for repeat attempt)
0x0CD return magic doll + failed horribly
0x0D0 repeats how horribly you failed
0x0D1 return magic doll + you passed
0x0CE return magic doll + you passed really well
0x0D2 repeats how well you did

--]]

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	mission_status = player:getVar("mission_status");
	local pet = player:getVar("teachersPet");
	if (player:getMissionStatus(2,4) == 1) or (player:getNation() == 2 and player:getVar("win_repeat_mission") == 4) then	
		testingtime = player:getVar("TestingTime");
		if (mission_status == 1) then
			if (testingtime ==0) then
				player:startEvent(Event(0xB6));
			elseif (testingtime ==1) then
				player:startEvent(Event(0xB5));
			else
				player:startEvent(Event(0x2AF));
			end;
		elseif (mission_status == 2) then
			start_time = player:getVar("testing_time_start_time");
			seconds_passed = os.time()-start_time;
			--print("seconds passed: ",seconds_passed);
			if (seconds_passed > 3456 ) then -- one Vana'diel Day is 3456 seconds
				player:startEvent(Event(0xCA));
			elseif (seconds_passed >= 3312) then -- are we in the last game hour of the Vana'diel Day?
				killcount = player:getVar("creature_count");
				if (testingtime == 2) then
					if (killcount >= 35) then
						event = Event(0xCE);
					elseif (killcount >=30) then
						event = Event(0xD1);
					else
						event = Event(0xD0);
					end;
				else
					if (killcount >= 35) then
						event = Event(0xC9);
					elseif (killcount >=30) then
						event = Event(0xC8);
					elseif (killcount >=19) then
						event = Event(0xC7);
					else
						event = Event(0xC6);
					end;
				end;
				event:setParams(0,getVanaHour(),1,killcount);
				player:startEvent(event);
			else
				start_day = player:getVar("testing_time_start_day");
				start_hour = player:getVar("testing_time_start_hour");
				if (getVanaDay() == start_day) then
					hours_passed = getVanaHour() - start_hour;
				else
					hours_passed = (24 - start_hour) + getVanaHour();
				end;
				if (testingtime == 2) then
					event = Event(0xCC) 
					event:setParams(0,0,0,0,0,getVanaHour(),24-hours_passed,0);
				else
					event = Event(0xB7);
					event:setParams(0,getVanaHour(),24-hours_passed);
				end;
				player:startEvent(event)
			end;
		elseif (mission_status == 3) then
			player:startEvent(Event(0xCB));
		end;
	elseif (player:getMissionStatus(2,20) == 1) and (mission_status == 1) then
		event = Event(0x2F0);
		event:setParams(0,AurasteryRing);
		player:startEvent(event);
	elseif (player:getMissionStatus(2,20) == 1) and (mission_status == 2) then
		player:startEvent(Event(0x2F1));
	elseif (player:getMissionStatus(2,20) == 1) and (player:getVar("mission_status") == 5) then	
		player:startEvent(Event(0x2F6));
	elseif (player:getMissionStatus(2,20) == 2) and (player:getMissionStatus(2,21) == 0) then	
		player:startEvent(Event(0x2F7));
	elseif (pet == 0) then
		local event0x1b6 = Event(0x1b6)
		event0x1b6:setParams(0,0x34f,0x1110);
		player:startEvent(event0x1b6);
	elseif (pet == 1) then
		local event0x1b7 = Event(0x1b7)
		event0x1b7:setParams(0,0x34f,0x1110);
		player:startEvent(event0x1b7);
	elseif (pet == 2) then
		player:startEvent(Event(0x1b9));
	end
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
local pet = player:getVar("teachersPet");
count = trade:getItemCount();
--print("count: " .. count);
item1 = trade:hasItemQty(0x34f,1);
item2 = trade:hasItemQty(0x1110,1);
if (pet ~= 0 and count == 2 and item1 == true and item2 == true) then
	--Quest complete.
	player:removeItem(0x34f,1);
	player:removeItem(0x1110,1);
	local event0x1b8 = Event(0x1b8);
	event0x1b8:setParams(250,0x34f,0x1110);
	player:startEvent(event0x1b8);
	player:addGil(GIL_RATE*250);
	player:specialMessage(GIL_OBTAINED,GIL_RATE*250);
	player:setVar("teachersPet",2);
	player:addFame(2,WIN_FAME*20);
	--print("Windurst fame adjusted for",player:getName(),"by 20 (Total:",player:getFame(2),").");
	player:completeQuest(2,28);
end 
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("csid = ",csid);
--print("Option:",option);
if (csid == 0x1B6 and option ~= 1) then
	--Accept quest "Teacher's Pet"
	player:setVar("teachersPet",1);
	player:addQuest(2,28);
elseif ((csid == 0xB6) or (csid == 0xB5) or (csid == 0x2AF)) and option ~= 1 then
	player:addKeyItem(CreatureCounter);
	player:specialMessage(KEYITEM_OBTAINED,CreatureCounter);
	player:setVar("mission_status",2);
	player:setVar("creature_count",0);
	player:setVar("testing_time_start_day",getVanaDay());
	player:setVar("testing_time_start_hour",getVanaHour());
	player:setVar("testing_time_start_time",os.time());
	if DEBUG_MODE then
		if (csid == 0x2AF) then
			toOutpost(player,KOLSHUSHU);
		else
			toMea(player);
		end;
	end;
elseif (csid == 0xC8) or (csid == 0xC9) then -- first time win
	player:setVar("mission_status",0)
	add_rank_points_for_mission(player)
	player:completeMission(2,4);
	player:removeKeyItem(CreatureCounter);
	player:setVar("creature_count",0);
	player:setVar("testing_time_start_day",0);
	player:setVar("testing_time_start_hour",0);
	player:setVar("testing_time_start_time",0);
	player:setVar("TestingTime",2); -- this indicates that Buburimu is next.
elseif (csid == 0xD1) or (csid == 0xCE) then -- succesfull repeat attempt (Tahrongi or Buburimu).
	player:setVar("mission_status",0)
	player:setVar("repeat_mission",0);
	add_rank_points_for_mission(player)
	player:completeMission(2,4);
	player:removeKeyItem(CreatureCounter);
	player:setVar("creature_count",0);
	player:setVar("testing_time_start_day",0);
	player:setVar("testing_time_start_hour",0);
	player:setVar("testing_time_start_time",0);
	if (player:getVar("TestingTime") == 1) then
		player:setVar("TestingTime",2); -- this indicates that Buburimu is next.
	end;
elseif (csid == 0xC6) or (csid == 0xC7) or (csid == 0xCA) or (csid == 0xD0) then -- failed testing time
	player:removeKeyItem(CreatureCounter);
	player:specialMessage(KEYITEM_OBTAINED + 1,CreatureCounter);
	player:setVar("mission_status",3); -- indicates we've failed the mission and need to try again.
	player:setVar("creature_count",0);
	player:setVar("testing_time_start_day",0);
	player:setVar("testing_time_start_hour",0);
	player:setVar("testing_time_start_time",0);
	-- player:failMission(2,4); this doesn't exist yet.
elseif (csid == 0xCB) then
	player:setVar("mission_status",1); -- player has heard that he failed the mission, now reset to 1.
elseif (csid == 0x2F0) then
	player:setVar("mission_status",2)
	player:addKeyItem(StarSeeker);
	player:specialMessage(KEYITEM_OBTAINED,StarSeeker);
	player:setTitle(FugitiveMinisterBountyHunter);
elseif (csid == 0x2F6) then
	player:setVar("mission_status",0)
	add_rank_points_for_mission(player)
	player:completeMission(2,20);
	player:removeKeyItem(StarSeeker);
elseif (csid == 0x2F7) and (DEBUG_MODE) then
	player:setPos(0, -16, 122, 184, 0xEF); -- back to Windurst walls mission NPC
end
end;