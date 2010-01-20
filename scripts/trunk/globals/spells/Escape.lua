--------------------------------------
--	Author: Tenjou
-- 	Escape
-- 	Transports party members within area of effect out of a dungeon.
--
--	Thanks to Eirwen for getting most of the possible escapes.
--	See his work here:  http://wiki.ffxiclopedia.org/wiki/Escape:_Guide_to_Positions_and_Shortcuts
--
--	Also thanks to Arcanedemon and the rest of the team for conveniently setting up @zone to take me to just the right place most of the time!
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
--Definitions and failsafe.
escapeX = 0;
escapeY = 0;
escapeZ = 0;
escapeR = 0;
escapeA = 0xf5; 

--Check zone and determine the proper escape.
zone = caster:getZone();
--print("ZONE:",zone);
if (zone == 0x8c or zone == 0x8d or zone == 0x8e) then --Ghelsba Outpost, Fort Ghelsba or Yughott Grotto
	escapeX = -738.178;
	escapeY = -64.623;
	escapeZ = 619.325;
	escapeR = 31.875;
	escapeA = 0x64; 
elseif (zone == 0xa7) then --Bostaunieux Oubliette
	escapeX = -712.746;
	escapeY = -38.954;
	escapeZ = 18.408;
	escapeR = 0;
	escapeA = 0x64; 
elseif (zone == 0xbe) then --King Ranperre's Tomb
	escapeX = 660.078;
	escapeY = -19.464;
	escapeZ = -588.047;
	escapeR = 0xc0;
	escapeA = 0x65; 
elseif (zone == 0xa1 or zone == 0xa2) then --Castle Zvahl
	escapeX = -433.249;
	escapeY = -46.000;
	escapeZ = 20.010;
	escapeR = 0;
	escapeA = 0x70; 
elseif (zone == 0x95 or zone == 0x96) then --Davoi and Monastic Cavern
	escapeX = -239.556;
	escapeY = -7.765;
	escapeZ = -591.281;
	escapeR = 0xc0;
	escapeA = 0x68;
elseif (zone == 0xc3) then --Eldieme Necropolis
	escapeX = -226.393;
	escapeY = -20.500;
	escapeZ = -66.378;
	escapeR = 99.167;
	escapeA = 0x69;
elseif (zone == 0xa6) then --Ranguemont Pass
	escapeX = 818.507;
	escapeY = -64.640;
	escapeZ = 659.680;
	escapeR = 99.167;
	escapeA = 0x65;
elseif (zone == 0x09) then --Pso'Xja
	escapeX = 60.008;
	escapeY = 6.950;
	escapeZ = -357.679;
	escapeR = 0xc0;
	escapeA = 0x6f;
elseif (zone == 0xcc) then --Fei'Yin
	escapeX = 280.025;
	escapeY = 20.062;
	escapeZ = 568.587;
	escapeR = 0x40;
	escapeA = 0x6f;
elseif (zone == 0xc5) then --Crawlers' Nest
	escapeX = -381.747;
	escapeY = -29.076;
	escapeZ = -788.092;
	escapeR = 223.125;
	escapeA = 0x6e;
elseif (zone == 0x93 or zone == 0x94) then --Beadeaux and Qulun Dome
	escapeX = 578.786;
	escapeY = 25.000;
	escapeZ = -376.731;
	escapeR = 0x80;
	escapeA = 0x6d;
elseif (zone == 0xb8 or zone == 0x9d or zone == 0x9e) then --Delkfutt's Tower
	escapeX = -286.271;
	escapeY = -20.000;
	escapeZ = 320.084;
	escapeR = 0;
	escapeA = 0x7e;
elseif (zone == 0xb1 or zone == 0xb2) then --Ve'Lugannon Palace and Shrine of Ru'Avitau
	escapeX = 0;
	escapeY = -45.013;
	escapeZ = -112.182;
	escapeR = 0x40;
	escapeA = 0x82;
elseif (zone == 0x99 or zone == 0x9a) then --Boyahda Tree and Dragons' Aery
	escapeX = 539.901;
	escapeY = 5.611;
	escapeZ = -580.218;
	escapeR = 0x80;
	escapeA = 0x79;
elseif (zone == 0xc8) then --Garlaige Citadel
	escapeX = -103.991;
	escapeY = -24.696;
	escapeZ = -425.221;
	escapeR = 0xc0;
	escapeA = 0x78;
elseif (zone == 0x97 or zone == 0x98) then --Castle Oztroja and Altar Room
	escapeX = 752.632;
	escapeY = -32.200;
	escapeZ = -40.035;
	escapeR = 0x80;
	escapeA = 0x77;
elseif (zone == 0xd5) then --Labyrinth of Onzozo
	escapeX = 443.994;
	escapeY = 18.193;
	escapeZ = 198.161;
	escapeR = 0x40;
	escapeA = 0x76;
elseif (zone == 0xc6) then --Maze of Shakhrami
	escapeX = 481.394;
	escapeY = 46.041;
	escapeZ = 515.493;
	escapeR = 0x80;
	escapeA = 0x75;
elseif (zone == 0x91) then --Giddeus
	escapeX = -374.008;
	escapeY = -21.658;
	escapeZ = 63.289;
	escapeR = 0xc0;
	escapeA = 0x73;
elseif (zone == 0xc0 or zone == 0xc2 or zone == 0xa9) then --Horutoto Ruins sand Toraimarai Canal
	escapeX = 396.225;
	escapeY = -6.050;
	escapeZ = 100.000;
	escapeR = 0x80;
	escapeA = 0x74;
elseif (zone == 0x9f or zone == 0xa0) then --Temple of Uggalepih and Den of Rancor
	escapeX = 300.000;
	escapeY = -4.000;
	escapeZ = -622.998;
	escapeR = 0xc0;
	escapeA = 0x7c;
elseif (zone == 0xcd) then --Ifrit's Cauldron
	escapeX = 102.056;
	escapeY = 0.289;
	escapeZ = 344.135;
	escapeR = 0x60;
	escapeA = 0x7c;
elseif (zone == 0xb0) then --Sea Serpent Grotto
	escapeX = -636.328;
	escapeY = 16.383;
	escapeZ = -420.062;
	escapeR = 0x10;
	escapeA = 0x7b;
elseif (zone == 0xbf) then --Dangruf Wadi
	escapeX = -601.433;
	escapeY = 39.956;
	escapeZ = -520.031;
	escapeR = 0;
	escapeA = 0x6b;
elseif (zone == 0x8f) then --Palborough Mines
	escapeX = 496.000;
	escapeY = -34.330;
	escapeZ = 1172.910;
	escapeR = 0x70;
	escapeA = 0x6a;
elseif (zone == 0xad) then --Korroloka Tunnel
	escapeX = -270.707;
	escapeY = 16.028;
	escapeZ = -20.268;
	escapeR = 0;
	escapeA = 0xac;
elseif (zone == 0xb or zone == 0xc) then --Movalpolos
	escapeX = 455.859;
	escapeY = -4.287;
	escapeZ = 733.027;
	escapeR = 0x65;
	escapeA = 0x6a;
elseif (zone == 0xd0) then --Quicksand Caves
	escapeX = 420.000;
	escapeY = 10.199;
	escapeZ = 191.739;
	escapeR = 0x40;
	escapeA = 0x72;
elseif (zone == 0xae) then --Kuftal Tunnel
	escapeX = -19.901;
	escapeY = 15.987;
	escapeZ = 440.058;
	escapeR = 0x50;
	escapeA = 0x7d;
elseif (zone == 0xd4) then --Gustav Tunnel
	escapeX = -772.018;
	escapeY = -7.348;
	escapeZ = 19.101;
	escapeR = 0x80;
	escapeA = 0x67;
elseif (zone == 0xc4) then --Gusgen Mines
	escapeX = 703.532;
	escapeY = 19.050;
	escapeZ = 216.502;
	escapeR = 0x70;
	escapeA = 0x6c;
elseif (zone == 0xc1) then --Ordelle's Caves
	escapeX = -272.118;
	escapeY = 23.680;
	escapeZ = 98.859;
	escapeR = 0;
	escapeA = 0x66;
elseif (zone == 0x1c) then --Sacrarium
	escapeX = 53.226;
	escapeY = -24.100;
	escapeZ = 740.000;
	escapeR = 0x80;
	escapeA = 0x19;
elseif (zone == 0x1d or zone == 0x1e) then --Riverne
	escapeX = -259.523;
	escapeY = -30.115;
	escapeZ = 277.335;
	escapeR = 0x40;
	escapeA = 0x19;
elseif (zone == 0x1b) then --Phomiuna Aqueducts
	escapeX = 567.624;
	escapeY = -15.844;
	escapeZ = 280.775;
	escapeR = 0x80;
	escapeA = 0x19;
elseif (zone == 0x10) then --Promyvion - Holla
	escapeX = -220.000;
	escapeY = -6.460;
	escapeZ = 280.000;
	escapeR = 0x80;
	escapeA = 0xe;
elseif (zone == 0x12) then --Promyvion - Dem
	escapeX = -220.000;
	escapeY = -46.460;
	escapeZ = -280.000;
	escapeR = 0x80;
	escapeA = 0xe;
elseif (zone == 0x14) then --Promyvion - Mea
	escapeX = 280.000;
	escapeY = -86.460;
	escapeZ = -22.000;
	escapeR = 0x40;
	escapeA = 0xe;
elseif (zone == 0x16) then --Promyvion - Vahzl
	escapeX = -380.000;
	escapeY = 48.045;
	escapeZ = 335.000;
	escapeR = 0xc0;
	escapeA = 0x9;
elseif (zone == 0x22 or zone == 0x23) then --Grand Palace of Hu'Xzoi and Garden of Ru'Hmet
	escapeX = 0.000;
	escapeY = -10.000;
	escapeZ = -464.781;
	escapeR = 0x40;
	escapeA = 0x21;
elseif (zone == 0x41) then --Mamook
	escapeX = -475.452;
	escapeY = -3.427;
	escapeZ = -539.960;
	escapeR = 0;
	escapeA = 0x33;
elseif (zone == 0x42) then --Mamool Ja Training Grounds
	escapeX = -180.000;
	escapeY = -5.026;
	escapeZ = -830.000;
	escapeR = 0xc0;
	escapeA = 0x34;
elseif (zone == 0x44) then --Aydeewa Subterrane
	escapeX = 59.976;
	escapeY = -11.434;
	escapeZ = 404.470;
	escapeR = 0xc0;
	escapeA = 0x33;
elseif (zone == 0x3f) then --Lebros Cavern
	escapeX = 705.000;
	escapeY = -18.951;
	escapeZ = 380.000;
	escapeR = 0x40;
	escapeA = 0x3d;
elseif (zone == 0x3e) then --Halvung
	escapeX = 897.992;
	escapeY = -7.665;
	escapeZ = 182.576;
	escapeR = 0x80;
	escapeA = 0x3d;
elseif (zone == 0x45) then --Leujaoam Sanctum
	escapeX = 490.000;
	escapeY = -21.026;
	escapeZ = -500.000;
	escapeR = 0;
	escapeA = 0x4f;
elseif (zone == 0x38) then --Periqia
	escapeX = -350.000;
	escapeY = -1.026;
	escapeZ = -20.000;
	escapeR = 0;
	escapeA = 0x4f;
elseif (zone == 0x36) then --Arrapago Reef
	escapeX = 140.007;
	escapeY = -12.000;
	escapeZ = -40.736;
	escapeR = 0x40;
	escapeA = 0x4f;
elseif (zone == 0x48) then --Alzadaal Undersea Ruins
	escapeX = 79.994;
	escapeY = -20.000;
	escapeZ = 619.974;
	escapeR = 0x80;
	escapeA = 0x34;
elseif (zone == 0xa4) then --Garlaige Citadel [S]
	escapeX = -104.000;
	escapeY = -24.310;
	escapeZ = -410.000;
	escapeR = 0xc0;
	escapeA = 0x62;
elseif (zone == 0xaf) then --Eldieme Necropolis [S]
	escapeX = -400.000;
	escapeY = -15.701;
	escapeZ = -150.000;
	escapeR = 0xc0;
	escapeA = 0x54;
elseif (zone == 0xab) then --Crawlers' Nest [S]
	escapeX = -376.179;
	escapeY = -28.434;
	escapeZ = -776.159;
	escapeR = 0xe0;
	escapeA = 0x5b;
elseif (zone == 0x55) then --La Vaule [S]
	escapeX = -199.971;
	escapeY = -7.103;
	escapeZ = -497.938;
	escapeR = 0xc0;
	escapeA = 0x52;
elseif (zone == 0x5c) then --Beadeaux [S]
	escapeX = 578.786;
	escapeY = 25.000;
	escapeZ = -376.731;
	escapeR = 0x80;
	escapeA = 0x5a;
elseif (zone == 0x63) then --Castle Oztroja [S]
	escapeX = 730.000;
	escapeY = -32.150;
	escapeZ = -40.000;
	escapeR = 0x80;
	escapeA = 0x61;
elseif (zone == 0x8a or zone == 0x9b) then --Castle Zvahl [S]
	escapeX = -414.000;
	escapeY = -44.000;
	escapeZ = 20.000;
	escapeR = 0;
	escapeA = 0x89;
elseif (zone == 0x83) then --Secret Surprise
	escapeX = 260;
	escapeY = 12;
	escapeZ = 230;
	escapeR = 0x40;
	escapeA = 0x83;
	caster:setHP(1);
	caster:setMP(0);
	noescape = 1;
else
	noescape = 1; --Temporary Solution.
end

--Do it!!
if (noescape ~= 1) then
	target:setPos(escapeX,escapeY,escapeZ,escapeR,escapeA);
else
	--print("LOL DENIED");
end

return 0;
end;