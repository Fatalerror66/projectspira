-----------------------------------
--	Author: ReaperX
--  Spatial Displacement
--  Teleports Player between segments of Riverne Site #B01
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------

base = 0x101d0aa; 

require("scripts/globals/settings");

function onTrigger(player,npc)

id = npc:getId();

if (id == base) then --  L-9 porter
	player:startEvent(Event(0x2));
elseif (id == base+1) then --  L-8 porter
	player:startEvent(Event(0x3));
elseif (id == base+2) then --  K-8 porter
	player:startEvent(Event(0x4));	
elseif (id == base+3) then --  J-7 porter (SE corner)
	player:startEvent(Event(0x5));
elseif (id == base+4) then -- I-8 porter
	player:startEvent(Event(0x6));
elseif (id == base+6) then --  G-9 porter (to Boroka)
	player:startEvent(Event(0x8));
elseif (id == base+7) then --  M-9 porter (west)
	player:startEvent(Event(0x9));
elseif (id == base+8) then --  M-9 porter (back to Misareaux Coast)
	player:startEvent(Event(0xA));
elseif (id == base+9) then --  M-8 porter
	player:startEvent(Event(0xB));
elseif (id == base+10) then --  L-7 porter (east)
	player:startEvent(Event(0xC));
elseif (id == base+11) then --  L-7 porter (nw corner)
	player:startEvent(Event(0xD));
elseif (id == base+12) then --  J-6 porter
	player:startEvent(Event(0xE));
elseif (id == base+13) then --  K-6 porter
	player:startEvent(Event(0xF));
elseif (id == base+14) then --  K-7 porter (SE)
	player:startEvent(Event(0x10));	
elseif (id == base+15) then --  K-7 porter (NW)
	player:startEvent(Event(0x11));
elseif (id == base+16) then --  J-7 porter (ne corner)
	player:startEvent(Event(0x12));
elseif (id == base+17) then --  J-7 porter (center)
	player:startEvent(Event(0x13));
elseif (id == base+18) then --  J-7 porter (nw corner)
	player:startEvent(Event(0x14));
elseif (id == base+19) then --  I-7 porter (north)
	player:startEvent(Event(0x15));
elseif (id == base+21) then --  I-7 porter (NW)
	player:startEvent(Event(0x17));
elseif (id == base+22) then --  I-7 porter (SW)
	player:startEvent(Event(0x18));
elseif (id == base+23) then -- I-7 porter (south)
	player:startEvent(Event(0x19));
elseif (id == base+24) then --  G-7 porter (ne corner)
	player:startEvent(Event(0x1A));
elseif (id == base+25) then -- F-6 porter (east)
	player:startEvent(Event(0x1B));
elseif (id == base+26) then --  G-7 porter (east)
	player:startEvent(Event(0x1C));
elseif (id == base+27) then -- F-8 porter (Boroka Island)
	player:startEvent(Event(0x1D));
elseif (id == base+28) then -- F-6 porter (west)
	player:startEvent(Event(0x1E));
elseif (id == base+29) then -- E-7 porter (east) 
	player:startEvent(Event(0x1f)); 
elseif (id == base+30) then -- E-8 porter (north)
	player:startEvent(Event(0x20));		
elseif (id == base+31) then -- E-8 porter (middle, to Monarch Linn) --_STOP
	player:startEvent(Event(0x21));		
elseif (id == base+34) then -- E-7 porter (west)
	player:startEvent(Event(0x23));
 elseif (id == base+35) then -- D-6 porter (exit from Bahamut Island)
	player:startEvent(Event(0x23));
elseif (id == base+36) then -- E-7 porter (SW)
	player:startEvent(Event(0x24));
elseif (id == base+37) then -- D-8 porter (north)
	player:startEvent(Event(0x25));
elseif (id == base+39) then -- C-9 porter (NE)
	player:startEvent(Event(0x27));	
elseif (id == base+40) then -- C-9 porter (SE)
	player:startEvent(Event(0x28));	
elseif (id == base+41) then -- D-10 porter (Monument)
	player:startEvent(Event(0x29));		
end;
end; 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == 0x21) and (option == 0) then
 --print("Monarch Linn port not implemented.");
elseif (csid == 0xA) and (option == 1) then
 player:setPos(-539,-30,360,0,0x19); -- back to Misareaux Coast
elseif (csid == 0x11) and (option == 0) then -- Go! Go! Gobmuffin quest checks will have to be added here. Mobs are not currently spawning (db issue I think)
	loc = Zone(0x1D);
 	loc:spawnMob("ChemicalCookCh",227, 88, 842,33,nil); -- pop positions are not authentic.
 	loc:spawnMob("BookBrowserBok",224, 88, 837,33,nil);
 	loc:spawnMob("SpellSpitterSp",274, 89, 830,250,nil);
end;
end;


--[[ old, coordinate-based code in case SE goes crazy and changes the order of NPC IDs above .

X = player:getXPos();
Z = player:getZPos();
if (X < 668) and (X > 660) and (Z > 337) and (Z < 344) then --  M-9 porter (west)
	player:startEvent(Event(0x9));
elseif (X < 736) and (X > 723) and (Z > 394) and (Z < 418) then --  M-9 porter (back to Misareaux Coast)
	player:startEvent(Event(0xA));
elseif (X < 738) and (X > 723) and (Z > -713) and (Z < -697) then --  L-9 porter
	player:startEvent(Event(0x2));
elseif (X < 701) and (X > 686) and (Z > -523) and (Z < -501) then --  L-8 porter
	player:startEvent(Event(0x3));
elseif (X < 670) and (X > 655) and (Z > 540) and (Z < 550) then --  M-8 porter
	player:startEvent(Event(0xB));
elseif (X < 638) and (X > 617) and (Z > 674) and (Z < 699) then --  L-7 porter (east)
	player:startEvent(Event(0xC));
elseif (X < 499) and (X > 479) and (Z > 737) and (Z < 765) then --  L-7 porter (nw corner)
	player:startEvent(Event(0xD));
elseif (X < 440) and (X > 416) and (Z > 780) and (Z < 808) then --  K-6 porter
	player:startEvent(Event(0xF));
elseif (X < 260) and (X > 235) and (Z > 714) and (Z < 743) then --  J-7 porter (ne corner)
	player:startEvent(Event(0x12));
elseif (X < 205) and (X > 180) and (Z > 720) and (Z < 745) then --  J-7 porter (nw corner)
	player:startEvent(Event(0x14));
elseif (X < 65) and (X > 45) and (Z > 740) and (Z < 755) then --  I-7 porter (north)
	player:startEvent(Event(0x15));
elseif (X < 25) and (X > 5) and (Z > 699) and (Z < 715) then --  I-7 porter (NW)
	player:startEvent(Event(0x17));
elseif (X < 60) and (X > 40) and (Z > 645) and (Z < 662) then --  I-7 porter (SW)
	player:startEvent(Event(0x18));
elseif (X < 440) and (X > 420) and (Z > -395) and (Z < -378) then --  J-7 porter (SE corner)
	player:startEvent(Event(0x5));
elseif (X < 265) and (X > 240) and (Z > 660) and (Z < 680) then --  J-7 porter (center)
	player:startEvent(Event(0x13));
elseif (X < 405) and (X > 380) and (Z > 675) and (Z < 700) then --  K-7 porter (NW)
	player:startEvent(Event(0x11));
elseif (X < 300) and (X > 275) and (Z > 820) and (Z < 840) then --  J-6 porter
	player:startEvent(Event(0xE));
elseif (X < 425) and (X > 400) and (Z > 660) and (Z < 672) then --  K-7 porter (SE)
	player:startEvent(Event(0x10));	
elseif (X < 550) and (X > 535) and (Z > -438) and (Z < -420) then --  K-8 porter
	player:startEvent(Event(0x4));	
	
elseif (X < -120) and (X > -140) and (Z > -600) and (Z < -580) then --  G-9 porter (to Boroka)
	player:startEvent(Event(0x8));
elseif (X < -340) and (X > -365) and (Z > 460) and (Z < 480) then -- F-8 porter (Boroka Island)
	player:startEvent(Event(0x1D));
	
elseif (X < 278) and (X > 255) and (Z > -438) and (Z < -420) then -- I-8 porter
	player:startEvent(Event(0x6));
elseif (X < 62) and (X > 40) and (Z > 620) and (Z < 638) then -- I-7 porter (south)
	player:startEvent(Event(0x19));

elseif (X < -600) and (X > -620) and (Z > 679) and (Z < 696) then -- E-7 porter (west)
	player:startEvent(Event(0x23));
elseif (X < -590) and (X > -620) and (Z > 620) and (Z < 645) then -- E-7 porter (SW)
	player:startEvent(Event(0x24));
elseif (X < -700) and (X > -720) and (Z > 550) and (Z < 580) then -- D-8 porter (north)
	player:startEvent(Event(0x25));
elseif (X < -820) and (X > -847) and (Z > 358) and (Z < 380) then -- C-9 porter (NE)
	player:startEvent(Event(0x27));	
elseif (X < -820) and (X > -845) and (Z > 300) and (Z < 325) then -- C-9 porter (SE)
	player:startEvent(Event(0x28));	
elseif (X < -780) and (X > -805) and (Z > 145) and (Z < 180) then -- D-10 porter (Monument)
	player:startEvent(Event(0x29));		

elseif (X < -500) and (X > -525) and (Z > 565) and (Z < 582) then -- E-8 porter (north)
	player:startEvent(Event(0x20));		
elseif (X < -495) and (X > -506) and (Z > 660) and (Z < 668) then -- E-7 porter (east)
	player:startEvent(Event(0x1f));		

elseif (X < -525) and (X > -540) and (Z > 495) and (Z < 520) then -- E-8 porter (middle, to Monarch Linn)
	player:startEvent(Event(0x21));		

else
	--print("you found a bug in the coordinate coverage of the teleporter areas at (X,Z)=",X,Z)
end;
end; 

--]]