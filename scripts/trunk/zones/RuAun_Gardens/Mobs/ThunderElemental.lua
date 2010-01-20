require("/scripts/globals/settings");
package.loaded["/scripts/zones/RuAun_Gardens/TextIDs"] = nil;
require("/scripts/zones/RuAun_Gardens/TextIDs");

function OnMobSpawn(mob)
end;

function OnMobDeath(mob,killer)
  --Check if FoV ID 145 is active
  local fov = killer:getVar("fov_regimeid");
  --print("Working....");
  
  if (fov==145) then --have FoV active
	--check to see if they have all fire elementals killed
	local numneeded = killer:getVar("fov_numneeded3"); 
	local numkilled = killer:getVar("fov_numkilled3"); 
	if (numkilled<numneeded) then --increment number killed!
		numkilled = numkilled + 1;
		killer:setVar("fov_numkilled3",numkilled);
		--display message, CAN USE setMsg(558) IF IT IS BUILT INTO CORE!
		--killer:setMsg(558,numkilled,numneeded);
		--print("Training regime target defeated! ",numkilled,"/",numneeded);
		--check to see if that was the last one needed
		if (numkilled==numneeded) then
			--print("Last target of that type defeated!");
			--check to see if the other requirements are met
			local numneeded2 = killer:getVar("fov_numneeded1");
			local numkilled2 = killer:getVar("fov_numkilled1");
			local numneeded3 = killer:getVar("fov_numneeded2");
			local numkilled3 = killer:getVar("fov_numkilled2");
			if (numneeded2==numkilled2 and numneeded3==numkilled3) then
				--completed Regime!
				--killer:setMsg(559);
				--print("You have successfully completed the training regime. ");
				--give tabs
				tabs = killer:getVar("tabs");
				tabs = tabs+160;
				killer:setVar("tabs",tabs);
				--add gil
				--needs message
				killer:addGil(1600);
				killer:specialMessage(GIL_OBTAINED,1600);
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