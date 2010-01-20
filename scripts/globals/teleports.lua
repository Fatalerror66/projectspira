-- A collection of frequently needed teleport shortcuts.
-- by ReaperX

function toFeiYin(player)
	player:setPos(280, 20, 543, 192, 0x6F);
end;

function toQuHauSpring(player)
	player:setPos(0,0,0,0,0x7A);
end;

function toThroneRoom(player)
	player:setPos(72, -4, 0, 128, 0xA5);
end;

function toRuLudeEmbassyArea(player)
	player:setPos(0, 7, -23, 63, 0xF3);
end;

function toOrastery(player)
	player:setPos(-108, -3, 105, 90, 0xF0);  -- to Port Windurst Orastery
end;

function toOptistery(player)
	player:setPos(-27, -5, 101, 172, 0xEE);  -- to Tosuka - Porika (Optistery)
end;

function toAurastery(player)
	player:setPos(170, -1.2, 160, 87, 0xEE); -- to Moreno-Toeno (Aurastery)
end;

function toManustery(player)
	player:setPos(-14, -3, 14, 221, 0xF1);   -- to Apururu (Manustery)
end;

function toRhinostery(player)
	player:setPos(-5, -4, -182, 252, 0xEE);
end;

function toAnimastery(player)
	player:setPos(62, 20, -59, 223, 0xA9); -- to Toraimarai Canal
end;

function toStarSibyl(player)
	player:setPos(2, -45, -28, 180, 0xF2);   -- to Star Sibyl chamber, Heaven's Tower
end;

function toHeavensTower(player)
	player:setPos(0, 0, -14, 192, 0xF2); -- to entrance (first?) floor of Heaven's Tower.
end;

function toLeepeHoppe(player)
	player:setPos(17, -10, -200, 139, 0xEE);
end;

function toFullMoonFountain(player)
	player:setpos(-260, 4, -325, 192, 0xAA);
end;

function toRukususu(player)
	player:setPos(-193,0,190,128,0xCC); -- to Rukususu @ Fei'Yin
end;

function toShantotto(player)
	player:setPos(121, -3, 113, 212, 0xEF);  -- to Shantotto
end;

function toLilyTower(player)
	player:setPos(362, -13, 100, 0, 0x74); -- to J-7 in East Saru, entrance "5" to Inner Horutoto Ruins.
end;

function toMargueriteTower(player)
	player:setPos(259, -18, -432, 61, 0x74); -- to J-11 in East Saru, entrance "4" to Outer Horutoto Ruins.
end;

function toRoseTower(player)
	player:setPos(-259, 0, 100, 192, 0xC0); -- to H-7 Inner Horutoto Ruins, behind 3 Mages' Gate, room with elemental gates.
end;

function toDahliaTower(player)
	player:setPos(-300, 0, -660, 255, 0xC2); -- this is the SW tower in West Saru at F-11 that's filled with Cardians.
end;

function toAmaryllisTower(player)
	player:setPos(-421, 0, 620, 128, 0xC2); -- to Outer Horutoto Ruins, NW tower,G-8
end;

function toCatBurglar(player)
	player:setPos(60,-5,239,0,0xF1); -- to Nanaa Mihgo
end;

function toCatBurglarsHideout(player)
	player:setPos(-5, 0, 21, 128, 0xC0); -- to G-8 in Inner Horutoto Ruins, Beetle's Burrow, in front of Mahagony Door.
end;	

function toHouseOfTheHero(player)
	player:setPos(-26, -12, 253, 194, 0xEF); -- to the House of the Hero, G-4 Windurst Walls.
end;

function toKupipi(player)
	player:setPos(0, 0, 28, 206, 0xF2);
end;

function toZubaba(player)
	player:setPos(13, -26.25, 15, 222, 0xf2) -- to Zubaba in Heaven's Tower.
end;
	
function toWindurstMissionOverseer(player)
	which = player:getVar("firstmissionguard");
	if (which == 1) then
		player:setPos(0, -16, 122, 198, 0xEF); -- Zokima-Rokima in Windurst Walls
	end;
end;

function toAltep(player)
	player:setPos(-60,4,230,0xc0,0x72);
end;

function toYhoat(player)
	player:setPos(-280,0,-140,0,0x7c);
end;

function toVahzl(player)
	player:setPos(151,-21,-38,0,0x70);
end;

function toDem(player)
	player:setPos(220,19,305,0xc0,0x6c);
end;

function toHolla(player)
	player:setPos(420,19,25,0xc0,0x66);
end;

function toMea(player)
	target:setPos(95,35,340,0x80,0x75);
end;

function toRomaaMigho(player)
	player:setPos(29, -12, -174, 68, 0xFA); -- to H-11 in Kazham (Migho's Residence)
end;