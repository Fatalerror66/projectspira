require("/scripts/globals/settings");
package.loaded["/scripts/zones/RuAun_Gardens/TextIDs"] = nil;
require("/scripts/zones/RuAun_Gardens/TextIDs");

function OnMobSpawn(mob)
end;

function OnMobDeath(mob,killer)
	--FIELDS OF VALOR
	--PAGE 1 : 8 Flamingos ; 3 Sprinklers ; ID142
	--PAGE 2 : 8 Sprinklers ; 3 Dolls ; ID143

  --Check if FoV ID 142 is active
  local fov = killer:getVar("fov_regimeid");
  
  if (fov==142) then --have FoV active
	--check to see if they have all sprinklers killed
	local numneeded = killer:getVar("fov_numneeded2"); 
	local numkilled = killer:getVar("fov_numkilled2"); 
	if (numkilled<numneeded) then --increment number killed!
		numkilled = numkilled + 1;
		killer:setVar("fov_numkilled2",numkilled);
		--display message, CAN USE setMsg(558) IF IT IS BUILT INTO CORE!
		--killer:setMsg(558,numkilled,numneeded);
		--print("Training regime target defeated! ",numkilled,"/",numneeded);
		--print("/", numneeded);
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
				tabs = tabs+145;
				killer:setVar("tabs",tabs);
				--add gil
				--needs message
				killer:addGil(1450);
				killer:specialMessage(GIL_OBTAINED,1450);
				--add exp
				--function needed.
				killer:specialMessage(REGIME_CANCELED);
				--reset FoV marker.
				killer:setVar("fov_regimeid",0);
			end
		end
	end
  end
  
  if (fov==143) then --have FoV active
	--check to see if they have all sprinklers killed
	local numneeded = killer:getVar("fov_numneeded1"); 
	local numkilled = killer:getVar("fov_numkilled1"); 
	if (numkilled<numneeded) then --increment number killed!
		numkilled = numkilled + 1;
		killer:setVar("fov_numkilled1",numkilled);
		--display message, CAN USE setMsg(558) IF IT IS BUILT INTO CORE!
		--killer:setMsg(558,numkilled,numneeded);
		--print("Training regime target defeated! ",numkilled,"/",numneeded);
		--print("/", numneeded);
		--check to see if that was the last one needed
		if (numkilled==numneeded) then
			--print("Last target of that type defeated!");
			--check to see if the other requirements are met
			local numneeded2 = killer:getVar("fov_numneeded2");
			local numkilled2 = killer:getVar("fov_numkilled2");
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
  
end;