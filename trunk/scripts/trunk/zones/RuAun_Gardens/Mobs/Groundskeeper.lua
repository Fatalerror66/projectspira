require("/scripts/globals/settings");
package.loaded["/scripts/zones/RuAun_Gardens/TextIDs"] = nil;
require("/scripts/zones/RuAun_Gardens/TextIDs");

function OnMobSpawn(mob)
end;

function OnMobDeath(mob,killer)
  mob:OnMobDeath(mob,killer,1);
  despot = getGlobalVar("ToD-Despot");
  time = os.time();
  random = math.random((0),(3));
  loc = Zone(0x82);

  if (despot <= time) then
    if (random == 3) then
      loc:spawnMob("Despot",mob:getXPos(),mob:getYPos(),mob:getZPos(),mob:getRot(),killer:getId());
    end
  end
  
  local fov = killer:getVar("fov_regimeid");
  
    if (fov==143) then --have FoV active (8 sprinklers; 3 dolls)
	--check to see if they have all groundskeepers killed
	local numneeded = killer:getVar("fov_numneeded2"); 
	local numkilled = killer:getVar("fov_numkilled2"); 
	if (numkilled<numneeded) then --increment number killed!
		numkilled = numkilled + 1;
		killer:setVar("fov_numkilled2",numkilled);
		--display message, CAN USE setMsg(558) IF IT IS BUILT INTO CORE!
		--killer:setMsg(558,numkilled,numneeded);
		--print("Training regime target defeated! ",numkilled,"/",numneeded);
		--check to see if that was the last one needed
		if (numkilled==numneeded) then
			--print("Last target of that type defeated!");
			--check to see if the other requirements are met
			local numneeded2 = killer:getVar("fov_numneeded1");
			local numkilled2 = killer:getVar("fov_numkilled1");
			if (numneeded2==numkilled2) then
				--completed Regime!
				--killer:setMsg(559);
				--print("You have successfully completed the training regime. ");
				--give tabs
				tabs = killer:getVar("tabs");
				tabs = tabs+150;
				killer:setVar("tabs",tabs);
				--add gil
				--needs message
				killer:addGil(1500);
				killer:specialMessage(GIL_OBTAINED,1500);
				--add exp
				--function needed.
				killer:specialMessage(REGIME_CANCELED);
				--reset FoV marker.
				killer:setVar("fov_regimeid",0);
			end
		end
	end
  end
  
   if (fov==144) then --have FoV active (11 dolls)
	--check to see if they have all groundskeepers killed
	local numneeded = killer:getVar("fov_numneeded2"); 
	local numkilled = killer:getVar("fov_numkilled2"); 
	if (numkilled<numneeded) then --increment number killed!
		numkilled = numkilled + 1;
		killer:setVar("fov_numkilled2",numkilled);
		--display message, CAN USE setMsg(558) IF IT IS BUILT INTO CORE!
		--killer:setMsg(558,numkilled,numneeded);
		--print("Training regime target defeated! ",numkilled,"/",numneeded);
		--check to see if that was the last one needed
		if (numkilled==numneeded) then
			--print("Last target of that type defeated!");
				--completed Regime!
				--killer:setMsg(559);
				--print("You have successfully completed the training regime. ");
				--give tabs
				tabs = killer:getVar("tabs");
				tabs = tabs+155;
				killer:setVar("tabs",tabs);
				--add gil
				--needs message
				killer:addGil(1550);
				killer:specialMessage(GIL_OBTAINED,1550);
				--add exp
				--function needed.
				killer:specialMessage(REGIME_CANCELED);
				--reset FoV marker.
				killer:setVar("fov_regimeid",0);
			end
		end
	end
  end
  
end;