require("/scripts/globals/settings");
package.loaded["/scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
require("/scripts/zones/West_Sarutabaruta/TextIDs");

function OnMobSpawn(mob)
end;

function OnMobDeath(mob,killer)
  --Check if FoV ID 26 is active
  local fov = killer:getVar("fov_regimeid");
  --print("Testing.....");
  
  if (fov==26) then --have FoV active
	--check to see if they have all mandies killed
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
				--completed Regime!
				--killer:setMsg(559);
				--print("You have successfully completed the training regime. ");
				--give tabs
				tabs = killer:getVar("tabs");
				tabs = tabs+27;
				killer:setVar("tabs",tabs);
				--add gil
				--needs message
				killer:addGil(270);
				killer:specialMessage(GIL_OBTAINED,270);
				--add exp
				--killer:addEXP(270);
				--need killer:setMsg(); function!!!
				killer:specialMessage(REGIME_CANCELED);
				--reset FoV marker.
				killer:setVar("fov_regimeid",0);
			
		end
	end
  end
end;