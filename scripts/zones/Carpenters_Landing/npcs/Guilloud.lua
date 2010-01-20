-- Guilloud - for CoP Mission (3-3A2 "Descendents of a Line Lost")
-- By: ReaperX
-- To do: death check for of Overgrown Ivy

----------------------------------- 
-- onTrigger Action 
----------------------------------- 
function onTrigger(player,npc) 

-- events ---------
-- 0x00 : after killing Overgrown Ivy
-- 0x01 : repeats intructions given in 0x00
-- 0x25 : CS for CoP 7.4 (Tonberry fight)

cop_status = player:getMissionStatus(6,16);          																-- on "Descendents of a Line Lost"?
if (cop_status == 1) then     
  descendents_of_a_line_lost_status = player:getVar("Descendents of a Line Lost");  -- killed  Overgrown Ivy?
  if (descendents_of_a_line_lost_status == 0) then
    loc = Zone(2);
	  --loc:spawnMob("OvergrownIvy",-117.-5,-463,0,player:getId());                   -- I made up that location; commented out for now since it crashes server
	  --print("Spawning OvergrownIvy") 
	  player:setVar("Descendents of a Line Lost",1);                                  -- need check for death here once that's possible 
  else
    player:startEvent(Event(0x0));
  end
end

cop_status = player:getMissionStatus(6,17);          																-- on "Louverance"?
if (cop_status == 1) then
  player:startEvent(Event(0x01)) 
end;
end; 

 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0) then
  player:completeMission(6,16);     -- CoP 3.3A2 complete
  player:currentMission(6,17);      -- now on CoP 3.3A3 "Louverance"
  player:setVar("descendents_of_a_line_lost_status",0); -- cleanup
end;
end;