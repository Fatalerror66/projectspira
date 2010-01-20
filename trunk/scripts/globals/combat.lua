require("scripts/globals/settings");
require("scripts/globals/spell_definitions");

-----------------------------------
--	Author: Tenjou
-- 	SPELL RESISTANCE
-- 	Consolidating this section into one script so that any one change will affect all applicable spells.
--
--	For a more detailed discussion on resists and magic accuracy, please see this page:
--	http://robonosto.blogspot.com/2008/12/on-magic-resist-rates.html
--
--	Kanican clarified some of the details of the above link:
--	http://kanican.livejournal.com/tag/scholar!
--
--	Also a special thanks to the BlueGartr LS forums for helping me with this.
-----------------------------------

function spellResist(player,target,spell,diff,staff)
--Gather related stats.
skill = spell:getType();
resist = 1.0;
magicskill = player:getSkill(skill) + player:getMod(115+skill);
macc = 50 + player:getMod(MOD_MACC);

zone = Zone(player:getZone());
weather = zone:getWeather();
element = spell:getElement();

-- Klimaform (ReaperX)

if (player:getStatusEffect(EFFECT_KLIMAFORM) ~= nil) then
  if ((weather == Gloom or weather == Darkness or player:getStatusEffect(EFFECT_VOIDSTORM) ~= nil) and (element == 8)) then
  	macc = macc + KLIMAFORM_MACC;
  	--print("Dark Spell Magic Accuracy Enhanced by Klimaform");
  elseif ((weather == Auroras or weather == StellarGlare or player:getStatusEffect(EFFECT_AURORASTORM) ~= nil) and (element == 7)) then
  	macc = macc + KLIMAFORM_MACC;
  	--print("Light Spell Magic Accuracy Enhanced by Klimaform");
  elseif ((weather == Thunder or weather == Thunderstorms or player:getStatusEffect(EFFECT_THUNDERSTORM) ~= nil ) and (element == 6)) then
  	macc = macc + KLIMAFORM_MACC;
  	--print("Lightning Spell Magic Accuracy Enhanced by Klimaform");
  elseif ((weather == Snow or weather == Blizzard or player:getStatusEffect(EFFECT_HAILSTORM) ~= nil) and (element == 5)) then
  	macc = macc + KLIMAFORM_MACC;
  	--print("Ice Spell Magic Accuracy Enhanced by Klimaform");
  elseif ((weather == Wind or weather == Gales or player:getStatusEffect(EFFECT_WINDSTORM) ~= nil) and (element == 4)) then
  	macc = macc + KLIMAFORM_MACC;
  	--print("Wind Spell Magic Accuracy Enhanced by Klimaform");
  elseif ((weather == Rain or weather == Squall or player:getStatusEffect(EFFECT_RAINSTORM) ~= nil) and (element == 3)) then
  	macc = macc + KLIMAFORM_MACC;
  	--print("Water Spell Magic Accuracy Enhanced by Klimaform");
  elseif ((weather == DustStorm or weather == SandStorm or player:getStatusEffect(EFFECT_SANDSTORM) ~= nil) and (element == 2)) then
  	macc = macc + KLIMAFORM_MACC;
  	--print("Earth Spell Magic Accuracy Enhanced by Klimaform");
  elseif ((weather == HotSpell or weather == HeatWave or player:getStatusEffect(EFFECT_FIRESTORM) ~= nil) and (element == 1)) then
  	macc = macc + KLIMAFORM_MACC;
  	--print("Fire Spell Magic Accuracy Enhanced by Klimaform");
  end;
end;

--Elemental Seal doubles the accuracy.
if (player:getStatusEffect(EFFECT_ELEMENTAL_SEAL) ~= nil) then
	macc = macc * 2;
--Dark Seal doubles the accuracy of dark magic spells. (needs confirmation)
elseif (player:getStatusEffect(EFFECT_DARK_SEAL) ~= nil and skill == DARK_MAGIC_SKILL) then
	macc = macc * 2;
end

--Baseline p.
p = (macc / 100); -- Reasonable assumption based on 50% base magic accuracy.

--Diabolos's Earring increases M.Acc. in dark weather.
if (weather == Gloom or weather == Darkness) then
	ear1 = player:getEquip(12);
	ear2 = player:getEquip(13);
	if (ear1 == DiabolosEarring or ear2 == DiabolosEarring) then
		p = (p+0.02);
		--print("Magic accuracy enhanced by Diabolos's Earring.");
	end
end

--Adjust for magic skill.
vanaday = getVanaDayElement();
ring1 = player:getEquip(14);
ring2 = player:getEquip(15);
--Diabolos's Ring increases Dark Magic skill on Darksday.
if (ring1 == DiabolosRing or ring2 == DiabolosRing) then
	if (vanaday == Darksday and skill == DARK_MAGIC_SKILL) then
		magicskill = (magicskill+15);
		--print("Dark Magic skill increased by Diabolos's Ring.");
	end
end
p = (p + (magicskill/100));

--Adjust for staff bonus.
if (staff == 0.85) then 
	p = (p-0.3); 
	--print("Magic accuracy weakened by HQ staff.");
elseif (staff == 0.90) then 
	p = (p-0.2);
	--print("Magic accuracy weakened by staff.");
elseif (staff == 1.10) then
	p = (p+0.2);
	--print("Magic accuracy enhanced by staff.");
elseif (staff == 1.15) then
	p = (p+0.3); 
	--print("Magic accuracy enhanced by HQ staff.");
end

--Adjust for dINT, or the applicable d.  Possible higher tiers.
if (diff <= 10) then
	p = (p + (diff/200));
else
	p = (p + ((diff-10)/100));
end

--Reduce for magic evasion.  Will assume a C-level skill for this.  HNMs probably have a B-level skill or above, though.
moblvl = target:getMainLvl();
if (moblvl <= 83) then
	meva = getSkillLvl(7,moblvl);
else
	meva = getSkillLvl(4,moblvl);
end
meva = meva + target:getMod(MOD_MEVA);
p = (p - (meva/100));

--Reduce for elemental resist.  From kegsay: this is actually additional magic evasion.
elementalres = 0;
element = spell:getElement();
switch (element): caseof {
[1] = function (x) elementalres = target:getMod(MOD_FIRERES); end, --Fire
[2] = function (x) elementalres = target:getMod(MOD_EARTHRES); end, --Earth
[3] = function (x) elementalres = target:getMod(MOD_WATERRES); end, --Water
[4] = function (x) elementalres = target:getMod(MOD_WINDRES); end, --Wind
[5] = function (x) elementalres = target:getMod(MOD_ICERES); end, --Ice
[6] = function (x) elementalres = target:getMod(MOD_THUNDERRES); end, --Thunder
[7] = function (x) elementalres = target:getMod(MOD_LIGHTRES); end, --Light
[8] = function (x) elementalres = target:getMod(MOD_DARKRES); end, --Dark
default = function (x) end, }
p = p + (1 - (elementalres/100));

--Adjust for alpha.  Kegsay: this seems to be semi-linear branching from your level.
level = player:getMainLvl();
moblvl = target:getMainLvl();
alpha = 1.0;
if (level >= moblvl) then
	alpha = alpha + (5*(level-moblvl));
else
	alpha = alpha - (10*(moblvl-lvl));
end
p = (p*alpha);

--Adjust p to be within bounds.
if (p > 0.95) then
	p = 0.95;
elseif (p < 0.05) then
	p = 0.05;
end
--print("P: " .. p);

--Resistance thresholds based on p.  A higher p leads to lower resist rates, and a lower p leads to higher resist rates.
half = (1-p);
quart = ((1-p)^2);
eighth = ((1-p)^3);
sixteenth = ((1-p)^4); --Reasonable assumption based on the above pattern.
--print("HALF:",half);
--print("QUART:",quart);
--print("EIGHTH:",eighth);
--print("SIXTEENTH:",sixteenth);

--Psuedo-randomized seed to calculate resist chance for this spell.
if (spell:getCurrTargNum() == 1) then
	math.randomseed(os.time());
end
resvar = math.random();resvar = math.random();resvar = math.random();
--print("RES:",resvar);

--Determine final resist based on which thresholds have been crossed.
if (resvar <= sixteenth) then
	resist = 0.0625;
	--print("Spell resisted to 1/16!!!  Threshold = " .. sixteenth .. ".");
elseif (resvar <= eighth) then
	resist = 0.125;
	print ("Spell resisted to 1/8!  Threshold = " .. eighth .. ".");
elseif (resvar <= quart) then
	resist = 0.25;
	--print("Spell resisted to 1/4.  Threshold = " .. quart .. ".");
elseif (resvar <= half) then
	resist = 0.5;
	--print("Spell resisted to 1/2.  Threshold = " .. half .. ".");
elseif (resvar <= p) then
	resist = 1.0;
end

return resist;
 end;
 

-----------------------------------
--	Author: ReaperX
-- 	returns the weather/storm bonus for spells.
--  obi is the elemental obi the caster is currently wearing, if any. 
--
--  is_helix has to be set to true if the spell is a helix spell. This
--  info could be taken from spell, but that is not supported right now.
--
--  Minor unresolved problem: 
--  http://wiki.ffxiclopedia.org/wiki/Calculating_Magic_Damage says that 
--  weather+storm caps at 20%, but it is also said that single weather 
--  + storm effect equals double weather, which is a 25% bonus. 
--
--  I implemented the 20% value.
-----------------------------------
 
     strong1 = { HotSpell, DustStorm,          Rain,     Wind,     Snow,       Thunder,      Auroras,        Gloom }
     strong2 = { HeatWave, SandStorm,        Squall,    Gales, Blizzard, Thunderstorms, StellarGlare,     Darkness } 
       weak1 = {     Rain,      Wind,       Thunder,     Snow, HotSpell,     DustStorm,        Gloom,      Auroras }
       weak2 = {   Squall,     Gales, Thunderstorms, Blizzard, HeatWave,     SandStorm,     Darkness, StellarGlare }

strong_storm = { EFFECT_FIRESTORM, EFFECT_SANDSTORM, EFFECT_RAINSTORM, EFFECT_WINDSTORM, 
								 EFFECT_HAILSTORM, EFFECT_THUNDERSTORM, EFFECT_AURORASTORM, EFFECT_VOIDSTORM }
  weak_storm = { EFFECT_RAINSTORM, EFFECT_WINDSTORM, EFFECT_THUNDERSTORM, EFFECT_HAILSTORM,
                 EFFECT_FIRESTORM, EFFECT_SANDSTORM, EFFECT_VOIDSTORM, EFFECT_AURORASTORM }
  
opposing_element = { 3, 4, 6, 5, 1, 2, 8, 7 }
      
function spellWeatherBonus(caster, spell, is_helix) 

obi = caster:getEquip(11);
zone = Zone(caster:getZone());
weathercheck = zone:getWeather();
weatherbonus = math.random();weatherbonus = math.random();weatherbonus = math.random();
stormbonus = math.random();stormbonus = math.random();stormbonus = math.random();

ele = spell:getElement();

--print("strong weather types for this spell: ",strong1[ele],strong2[ele]);
--print("weak weather types for this spell: ",weak1[ele],weak2[ele]);

-- For helices or when you are wearing a matching obi, weather bonuses are guaranteed.

if ( obi == elemental_obi(ele) or is_helix ) and ((weathercheck == strong1[ele]) or (weathercheck == strong2[ele]) ) then
	weatherbonus = 1.00; 
	if (is_helix) then
	  --print("weather bonus guaranteed for helix.");
	else
		--print("Obi matches weather, guarantees weather bonus.");
  end;
end

if ( obi == elemental_obi(ele) or is_helix ) and (caster:getStatusEffect(strong_storm[ele]) ~= nil) then
	stormbonus = 1.00; 
	if (is_helix) then
	  --print("storm effect bonus guaranteed for helix.");
	else
		--print("Obi matches storm effect, guarantees storm bonus.");
  end;
end


-- For helices or when you are wearing the obi matching the opposing element, weather penalties are guaranteed.

opp_ele = opposing_element[ele];

if ( obi == elemental_obi(opp_ele) or is_helix ) and ((weathercheck == weak1[ele]) or (weathercheck == weak2[ele])) then
	weatherbonus = 1.00; 
	if (is_helix) then
	  --print("weather penalty guaranteed for helix.");
	else
		--print("Obi matches weather, guarantees weather penalty.");
  end;
end

if ( obi == elemental_obi(opp_ele) or is_helix ) and  (caster:getStatusEffect(weak_storm[ele]) ~= nil) then
	stormbonus = 1.00; 
	if (is_helix) then
	  --print("storm effect penalty guaranteed for helix.");
	else
		--print("Obi matches storm effect, guarantees storm penalty.");
  end;
end

weather = 1.00;
if (weatherbonus >= 0.66) then
	if (weathercheck == strong1[ele]) then
		weather = 1.10;
		--print("Element enhanced by matching single weather.");
	elseif (weathercheck == strong2[ele]) then
		weather = 1.25;
		--print("Element enhanced by matching double weather.");
	elseif (weathercheck == weak1[ele]) then
		weather = 0.90;
		--print("Element weakened by opposing single weather.");
	elseif (weathercheck == weak2[ele]) then
		weather = 0.75;
		--print("Element weakened by opposing double weather.");
	else
		weather = 1.00;
	end
end;

if (stormbonus >= 0.66) then
  if (caster:getStatusEffect(strong_storm[ele]) ~= nil) and (weather < 1.25) then
  	weather = weather + 0.1;
	  --print("Element enhanced by matching storm effect.");
  elseif (caster:getStatusEffect(weak_storm[ele]) ~= nil) and (weather > 0.75) then
    weather = weather - 0.1;
    --print("Element weakened by opposing storm effect.");
  end;
end
return weather;
end;
 
function elemental_obi(element)  -- returns the ID of the obi corresponding to the element.
switch (element): caseof {
[1] = function (x) output = KarinObi;  end, --Fire
[2] = function (x) output = DorinObi;  end, --Earth
[3] = function (x) output = SuirinObi; end, --Water
[4] = function (x) output = FurinObi;  end, --Wind
[5] = function (x) output = HyorinObi; end, --Ice
[6] = function (x) output = RairinObi; end, --Thunder
[7] = function (x) output = KorinObi;  end, --Light
[8] = function (x) output = AnrinObi ; end, --Dark
default = function (x) end, }
return output;
end;

-- strong and weak days, indexed by element .

strong_day = { Firesday, Earthday, Watersday, Windsday, Iceday, Lightningsday, Lightsday, Darksday }
  weak_day = { Watersday, Windsday, Lightningsday, Iceday, Firesday, Earthday, Darksday, Lightsday }

function spellDayBonus(caster, spell, is_helix) 

-- elemental obis give the full benefit AND penalty of the day. If you cast Fire on Watersday with Suirin (Water) obi 
-- equipped, you will get the day penalty 100% of the time.

--Adjust bonus for the day.
obi = caster:getEquip(11);
daybonus = math.random();daybonus = math.random();daybonus = math.random();
day = 1.0;
vanaday = getVanaDayElement();
--print("DAY:",vanaday);
ele     = spell:getElement();
opp_ele = opposing_element[ele];
current_day_obi = elemental_obi(vanaday+1);

if (is_helix) then
	--print("Day bonus guaranteed for helix spell.");
	daybonus = 1;
end

if (obi == current_day_obi) then
	--print("Elemental Obi matches current day.");
	daybonus = 1;
end;

--print("probability:",daybonus);

if (daybonus >= 0.66 and vanaday == weak_day[ele]) then --Weak day
	day = 0.9;
	--print("Element weakened by day.");
elseif (vanaday == strong_day[ele]) then --Strong day
	if (daybonus >= 0.66) then
		day = 1.1;
		--print("Element enhanced by day.");
	end
	if (spell:getType() == ELEMENTAL_MAGIC_SKILL) then
	  tonban = caster:getEquip(8);
	  if (tonban == SorcerersTonbanNQ or tonban == SorcerersTonbanHQ) then
		  day = (day+0.05);
		  --print("Elemental magic enhanced by Sorcerer's Tonban.");
	  end
	end;
end
return day;
end;

-----------------------------------
--	Author: ReaperX
-- 	Day and Weather bonus multiplier
--  A wrapper that calls day and weather bonus functions and applies
--  the 35% cap.
-----------------------------------

function spellDayWeatherBonus(caster, spell, is_helix) 

day = spellDayBonus(caster, spell, is_helix) 
weather = spellWeatherBonus(caster, spell, is_helix);
print ("day bonus: ",day);
--print("weather bonus:",weather);
day_weather = (day+weather-1);
if (day_weather >= 1.35) then 
	day_weather = 1.35;
end;
return day_weather;
end;

-----------------------------------
--	Author: ReaperX
-- 	Returns the staff bonus for the caster and spell. 
-----------------------------------

-- NQ/HQ staves that strengthen/weaken the index element

strong_NQ = { FireStaff, EarthStaff, WaterStaff, WindStaff, IceStaff, ThunderStaff, LightStaff, DarkStaff }
strong_HQ = { VulcanStaff, TerraStaff, NeptuneStaff, AusterStaff, AquiloStaff, JupiterStaff, ApolloStaff, PlutoStaff }

weak_NQ = { WaterStaff, WindStaff, ThunderStaff, IceStaff, FireStaff, EarthStaff, DarkStaff, LightStaff }
weak_HQ = { NeptuneStaff, AusterStaff, JupiterStaff, AquiloStaff, VulcanStaff, TerraStaff, PlutoStaff, ApolloStaff }

function StaffBonus(caster, spell)
staff = caster:getEquip(1);
ele   = spell:getElement();

if (staff == strong_NQ[ele] ) then 
	staff = 1.1;
	--print("Element enhanced by staff.");
elseif (staff == strong_HQ[ele]) then
	staff = 1.15;
	--print("Element enhanced by HQ staff.");
elseif (staff == weak_NQ[ele]) then
	staff = 0.9;
	--print("Element weakened by staff.");
elseif (staff == weak_HQ[ele]) then
	staff = 0.85;
	--print("Element weakened by HQ staff.");
else
	staff = 1.0;
end
return staff;
end;

-----------------------------------
-- Author: ReaperX
-- Calculate Magic Damage
-- Nothing new, just consolidated existing code into a function.
-- 
-- "skill type" is ELEMENTAL_MAGIC_SKILL, DIVINE_MAGIC_SKILL, NINJUTSU_SKILL, etc.
-- "is_helix" is true for helix spells, false otherwise.
-- "D" is explained in http://wiki.ffxiclopedia.org/wiki/Calculating_Magic_Damage.
-- 
-- We could move calculation of D into this function too but for now 
-- it has to be supplied as an input. 
--
-- dSTAT is the difference in relevant stats between caster and target; it's 
-- dINT for elemental and dMND for divine nukes.
-----------------------------------

function MagicDamage(caster, target, spell, D, dSTAT, is_helix) 

	--Adjust bonus for staff.
	staff = StaffBonus(caster, spell);

	--Resistance
	resist = spellResist(caster,target,spell,dSTAT,staff);
	--print("RESIST:",resist);
	
	day = spellDayWeatherBonus(caster, spell, is_helix);

	--print("Total day/weather bonus:",day);

	--Without parties, magic burst adjustments cannot be implemented.
	mb = 1.0;

	--Will need to adjust damage for MAB and enemy MDB.
	ratio = getMabMdbRatio(caster,target);

	--Will need to adjust damage for natural mob resistance, such as in Ahrimans or Demons.
	natural = getNaturalResist(target:getFamily())*target:getElementalResist(spell:getElement())/100;

	--Multiple target damage reduction.
	num = 1.0;
	numcheck = spell:getTargNum();
	--print("There are " .. numcheck .. " targets.");
	if (numcheck > 1 and numcheck < 10) then
		num = (0.9 - (0.05*numcheck));
	--print("Damage reduced by a factor of " .. num ..".");
	elseif (numcheck >= 10) then
		num = 0.4;
	--print("Damage reduced by a factor of " .. num .."!");
	end

	final = D*num*resist*staff*day*mb*ratio*natural*SPELL_POWER;
	if (final < 0) then final = 0; end;
	return final;
end


-----------------------------------
--	Author: ReaperX
-- 	Elemental Debuff Potency functions
-----------------------------------

function getElementalDebuffDOT(INT)
if (INT<= 39) then
	DOT = 1;
elseif (INT <= 69) then
	DOT = 2;
elseif (INT <= 99) then
	DOT = 3;
elseif (INT <= 149) then
	DOT = 4;
else 
	DOT = 5;
end;
return DOT;
end;

function getElementalDebuffStatDownFromDOT(dot)
if (dot == 1) then
	stat_down = 5;
elseif (dot == 2) then
	stat_down = 7;
elseif (dot == 3) then
	stat_down = 9;
elseif (dot == 4) then
	stat_down = 11;
else
	stat_down = 13;
end;
return stat_down;
end;

-----------------------------------
--	Author: ReaperX
-- 	Enspell base damage
--  Does not factor in the effects of sword enhancement equipment, weather or day, 
--  shell or magice dmg % reduction effects on the target.
-----------------------------------

function getEnspellDmg(caster)
  Enhancing = caster:getSkill(ENHANCING_MAGIC_SKILL);
  if (Enhancing < 150) then 
    basedmg = math.sqrt(Enhancing-1);
  else
  	basedmg = Enhancing/20 + 5;
  end;
  return basedmg;
end;

-----------------------------------
-- Author: ReaperX
-- Helix duration function
-- In the SCH discussion thread #3 on BG, there were some opinions that
-- helix duration is a function of magic accuracy, but there was no test
-- data or formula. Kanican has stated that duration is random:
-- 
-- "Helix duration varies from 45 to 90 seconds. Weather, Day, Obis, Equip, 
--  MACC, Elemental Seal, all have NO EFFECT on the duration - it is purely random. 
--  I could go days talking about how this was found but seeing as I am rushing 
--  this post, please just take my word for it."
--  http://kanican.livejournal.com/41053.html
--
-- I assume that by "purely random" he means equally distributed probability, so
-- that's what I'm going with for the time being.

function getHelixDuration(caster, target, spell)
  return math.random(45, 90);
end;

--------------------------------------
-- Author: ReaperX
-- Carol effect formula
-- The only testing data I could find is at http://wiki.ffxiclopedia.org/wiki/Carol .
-- The data points quoted there cannot be modeled with a floored linear formula that has
-- 40 resistance at singing skill = 225. This suggested a nonlinear or tiered linear
-- formula, but one would need more data points to find it. In the meantime, I'm using
-- the following capped linear approximation: resistance = min ( 40, floor (skill /5 ) - 4 ).

function getCarolEffect(caster)
	singing = caster:getSkill(SINGING_SKILL);
	instrument = caster:getEquip(3);
	effect = math.floor(singing / 5) -4;
	--print("Singing Skill: ",singing);
	if (effect > 40) then
		effect = 40;
 elseif (effect < 0) then
 	  effect = 0;
	end;
	if (instrument == CrumhornNQ) then
		effect = effect + 5;
	elseif (instrument == CrumhornHQ) or (instrument == CrumhornHQ2) or (instrument == Gjallarhorn) then
		effect = effect + 10;
  end;
  return effect;
end;


-----------------------------------
--	Author: Tenjou
-- 	SKILL LEVEL CALCULATOR
-- 	Returns a skill level based on level and rating.
--
--	See the translation of aushacho's work by Themanii:
--	http://home.comcast.net/~themanii/skill.html
--
--	The arguments are skill rank (numerical), and level.  1 is A+, 2 is A-, and so on.
-----------------------------------
function getSkillLvl(rank,level)
skill = 0; --Failsafe
if (level <= 50) then --Levels 1-50
	if (rank == 1 or rank == 2) then --A-Rated Skill
		skill = (((level-1)*3)+6);
	elseif (rank == 3 or rank == 4 or rank == 5) then --B-Rated Skill
		skill = (((level-1)*2.9)+5);
	elseif (rank == 6 or rank == 7 or rank == 8) then --C-Rated Skill
		skill = (((level-1)*2.8)+5);
	elseif (rank == 9) then --D-Rated Skill
		skill = (((level-1)*2.7)+4);
	elseif (rank == 10) then --E-Rated Skill
		skill = (((level-1)*2.5)+4);
	elseif (rank == 11) then --F-Rated Skill
		skill = (((level-1)*2.3)+4);
	end
elseif (level > 50 and level <= 60) then --Levels 51-60
	if (rank == 1 or rank == 2) then --A-Rated Skill
		skill = (((level-50)*5)+153);
	elseif (rank == 3 or rank == 4 or rank == 5) then --B-Rated Skill
		skill = (((level-50)*4.9)+147);
	elseif (rank == 6 or rank == 7 or rank == 8) then --C-Rated Skill
		skill = (((level-50)*4.8)+142);
	elseif (rank == 9) then --D-Rated Skill
		skill = (((level-50)*4.7)+136);
	elseif (rank == 10) then --E-Rated Skill
		skill = (((level-50)*4.5)+126);
	elseif (rank == 11) then --F-Rated Skill
		skill = (((level-50)*4.3)+116);
	end
elseif (level > 60 and level <= 70) then --Levels 61-70
	if (rank == 1) then --A+ Rated Skill
		skill = (((level-60)*4.85)+203);
	elseif (rank == 2) then --A- Rated Skill
		skill = (((level-60)*4.10)+203);
	elseif (rank == 3) then --B+ Rated Skill
		skill = (((level-60)*3.70)+196);
	elseif (rank == 4) then --B Rated Skill
		skill = (((level-60)*3.23)+196);
	elseif (rank == 5) then --B- Rated Skill
		skill = (((level-60)*2.70)+196);
	elseif (rank == 6) then --C+ Rated Skill
		skill = (((level-60)*2.50)+190);
	elseif (rank == 7) then --C Rated Skill
		skill = (((level-60)*2.25)+190);
	elseif (rank == 8) then --C- Rated Skill
		skill = (((level-60)*2.00)+190);
	elseif (rank == 9) then --D Rated Skill
		skill = (((level-60)*1.85)+183);
	elseif (rank == 10) then --E Rated Skill
		skill = (((level-60)*1.95)+171);
	elseif (rank == 11) then --F Rated Skill
		skill = (((level-60)*2.05)+159);
	end
else --Level 71 and above
	if (rank == 1) then --A+ Rated Skill
		skill = (((level-70)*5)+251);
	elseif (rank == 2) then --A- Rated Skill
		skill = (((level-70)*5)+244);
	elseif (rank == 3) then --B+ Rated Skill
		skill = (((level-70)*3.70)+233);
	elseif (rank == 4) then --B Rated Skill
		skill = (((level-70)*3.23)+228);
	elseif (rank == 5) then --B- Rated Skill
		skill = (((level-70)*2.70)+223);
	elseif (rank == 6) then --C+ Rated Skill
		skill = (((level-70)*3)+215);
	elseif (rank == 7) then --C Rated Skill
		skill = (((level-70)*2.25)+212);
	elseif (rank == 8) then --C- Rated Skill
		skill = (((level-70)*2.00)+210);
	elseif (rank == 9) then --D Rated Skill
		skill = (((level-70)*1.85)+201);
	elseif (rank == 10) then --E Rated Skill
		skill = (((level-70)*1.95)+190);
	elseif (rank == 11) then --F Rated Skill
		skill = (((level-70)*2)+179);
	end	
end
return skill;
 end;
 
 
 

-----------------------------------
--	Author: Tenjou
-- 	MAB/MDB RATIO CALCULATOR
-- 	A quick check for MAB and MDB.  Now fixed for the new system.
-----------------------------------
function getMabMdbRatio(caster,target)

--Check MAB for the attacker.
mab = 1 + caster:getMod(MOD_MATT)/100;

--Check MDB for the defender.
mdb = 1 + target:getMod(MOD_MDEF)/100;

ratio = (mab/mdb);
return ratio;
 end;
 
 
 
-----------------------------------
--	Author: Tenjou
-- 	ALPHA CALCULATOR
-- 	A quick check for level correction in spells.
-----------------------------------
function getAlpha(level)
alpha = 1.00; --Failsafe
if (level <= 5) then
	alpha = 1.00;
elseif (level <= 11) then
	alpha = 0.99;
elseif (level <= 17) then
	alpha = 0.98;
elseif (level <= 23) then
	alpha = 0.97;
elseif (level <= 29) then
	alpha = 0.96;
elseif (level <= 35) then
	alpha = 0.95;
elseif (level <= 41) then
	alpha = 0.94;
elseif (level <= 47) then
	alpha = 0.93;
elseif (level <= 53) then
	alpha = 0.92;
elseif (level <= 59) then
	alpha = 0.91;
elseif (level <= 61) then
	alpha = 0.90;
elseif (level <= 63) then
	alpha = 0.89;
elseif (level <= 65) then
	alpha = 0.88;
elseif (level <= 67) then
	alpha = 0.87;
elseif (level <= 69) then
	alpha = 0.86;
elseif (level <= 71) then
	alpha = 0.85;
elseif (level <= 73) then
	alpha = 0.84;
elseif (level <= 75) then
	alpha = 0.83;
end
return alpha;
 end; 
 
-----------------------------------
--	Author: Tenjou
-- 	fSTR FINDER
-- 	For Blue Magic, and other melee-related things.
-----------------------------------
function getfSTR(dSTR)
if (dSTR >= 12) then
	fSTR2 = ((dSTR+4)/2);
elseif (dSTR >= 6) then
	fSTR2 = ((dSTR+6)/2);
elseif (dSTR >= 1) then
	fSTR2 = ((dSTR+7)/2);
elseif (dSTR >= -2) then
	fSTR2 = ((dSTR+8)/2);
elseif (dSTR >= -7) then
	fSTR2 = ((dSTR+9)/2);
elseif (dSTR >= -15) then
	fSTR2 = ((dSTR+10)/2);
elseif (dSTR >= -21) then
	fSTR2 = ((dSTR+12)/2);
else
	fSTR2 = ((dSTR+13)/2);
end
--No Weapon Ranks right now ahuhuhu
fSTR = (fSTR2/2);
return fSTR;
 end;
 
-----------------------------------
--	Author: Tenjou
-- 	Cure Potency Check
-- 	List of gear which enhances Cure Potency.
-----------------------------------
function curePotency(caster)
c = 0;
main = caster:getEquip(1);
sub = caster:getEquip(2);
range = caster:getEquip(3);
ammo = caster:getEquip(4);
head = caster:getEquip(5);
body = caster:getEquip(6);
hand = caster:getEquip(7);
leg = caster:getEquip(8);
foot = caster:getEquip(9);
neck = caster:getEquip(10);
waist = caster:getEquip(11);
ear1 = caster:getEquip(12);
ear2 = caster:getEquip(13);
ring1 = caster:getEquip(14);
ring2 = caster:getEquip(15);
back = caster:getEquip(16);

if (main == 0x443a or sub == 0x443a) then
	c = (c+0.01);
	--print("Cure enhanced by Dia Wand.");
end
if (main == 0x442e or sub == 0x442e) then
	c = (c+0.05);
	--print("Cure enhanced by Asklepios.");
end
if (main == 0x4999 or sub == 0x4999) then
	c = (c+0.10);
	--print("Cure enhanced by Templar Mace.");
end
if (main == LightStaff or main == ApolloStaff or main == 0x42d4 or main == 0x429b) then
	c = (c+0.10);
	--print("Cure enhanced by Staff.");
end
if (body == 0x313d) then
	c = (c+0.10);
	--print("Cure enhanced by Noble's Tunic.");
elseif (body == 0x35ce) then
	c = (c+0.12);
	--print("Cure enhanced by Aristocrat's Coat.");
end
if (ear1 == 0x39d7 or ear2 == 0x39d7) then
	c = (c+0.05);
	--print("Cure enhanced by Hospitaler Earring.");
end
if (ear1 == 0x3e82 or ear2 == 0x3e82) then
	c = (c+0.05);
	--print("Cure enhanced by Roundel Earring.");
end
if (ring1 == 0x33e8 or ring2 == 0x33e8) then
	hp = caster:getHP();
	maxhp = caster:getMaxHP();
	ratio = (hp/maxhp);
	tp = 0; --caster:getTP();
	if (ratio <= 0.75 and tp <= 100) then
		c = (c+0.10);
		--print("Cure enhanced by Medicine Ring.");
	end
end
--print("Total enhancement: " .. (c+1));
return c;
 end;

-----------------------------------
--	Author: Tenjou
-- 	CURE RESISTANCE
-- 	To harm undead.
-----------------------------------
function cureResist(family)
resist = 0.0;
undead = {61,69,93,97,223,151,164,167,73,186};
--print("FAMILY:",family);
for i = 0,table.getn(undead) do
	if (family == undead[i]) then
		resist = -1;
	end
end
return resist;
 end;
 
 
-----------------------------------
--	Author: Tenjou
-- 	NATURAL/ELEMENTAL RESISTANCE
-- 	Final adjustment to spell damage.
-----------------------------------
function getNaturalResist(family)
natural = 1.0;

switch (family): caseof {
[4] = function (x) natural = 0.75; end, --Ahriman
[52] = function (x) natural = 0.75; end, --Cardian
[61] = function (x) natural = 0.75; end, --Corse
[89] = function (x) natural = 0.875; end, --Evil Weapon
[90] = function (x) natural = 1.25; end, --Flan
[98] = function (x) natural = 0.875; end, --Ghrah
[122] = function (x) natural = 0.75; end, --Kindred
[124] = function (x) natural = 0.875; end, --Lamia
[127] = function (x) natural = 0.5; end, --Magic Pot
default = function (x) end, }

return natural;
end;
-----------------------------------
--	Author: Almendro
-- 	Decide if a mob gives experience points or not.
-----------------------------------
function givesEXP(mob,player)
   moblvl = mob:getMainLvl();
playerlvl = player:getMainLvl();
  lvlDiff = moblvl - playerlvl;
if(playerlvl <= 5 and lvlDiff >= -6)then
	return true;
elseif(playerlvl >= 6  and playerlvl <= 10 and lvlDiff >= -8 )then
	return true;
elseif(playerlvl >= 11 and playerlvl <= 20 and lvlDiff >= -9 )then
	return true;
elseif(playerlvl >= 21 and playerlvl <= 30 and lvlDiff >= -10)then
	return true;
elseif(playerlvl >= 31 and playerlvl <= 35 and lvlDiff >= -11)then
	return true;
elseif(playerlvl >= 36 and playerlvl <= 40 and lvlDiff >= -12)then
	return true;
elseif(playerlvl >= 41 and playerlvl <= 45 and lvlDiff >= -13)then
	return true;
elseif(playerlvl >= 46 and playerlvl <= 50 and lvlDiff >= -14)then
	return true;
elseif(playerlvl >= 51 and playerlvl <= 55 and lvlDiff >= -15)then
	return true;
elseif(playerlvl >= 56 and playerlvl <= 60 and lvlDiff >= -16)then
	return true;
elseif(playerlvl >= 61 and playerlvl <= 65 and lvlDiff >= -17)then
	return true;
elseif(playerlvl >= 66 and playerlvl <= 70 and lvlDiff >= -18)then
	return true;
elseif(playerlvl >= 71 and playerlvl <= 75 and lvlDiff >= -19)then
	return true;
else
-- No exp
	return false;
end
end;

-----------------------------------
--	Author: Tenjou
-- 	INSTRUMENT CHECK
--	For use with Bard songs.  Checks if the ranged weapon's item ID matches an instrument's item ID.
-----------------------------------
function isInstrument(rangedweapon)
	check = false;
	
	if (rangedweapon >= 17832 and rangedweapon <= 17852) then
		check = true;
	elseif (rangedweapon >= 17344 and rangedweapon <= 17379) then
		check = true;
	elseif (rangedweapon >= 18338 and rangedweapon <= 18342) then
		check = true;
	end
	
	return check;
end

-----------------------------------
--	Author: Tenjou?
-- 	DYNAMIS CHECK
--	Use to check if a player is currently in a Dynamis zone
-----------------------------------
function isInDynamis(player)
	check = false;
	zone = player:getZone();
	
	if (zone >= 0x27 and zone <= 0x2a) then
		check = true;
	elseif (zone >= 0x86 and zone <= 0x87) then
		check = true;
	elseif (zone >= 0xb9 and zone <= 0xbc) then
		check = true;
	end
	
	return check;
end

-----------------------------------
--	Author: Tenjou
-- 	HEAL
-- 	Consolidating this section into one script so that any one change will affect all cure spells.
-----------------------------------
function heal(caster,target,final)

	--Divine Seal doubles the amount.
	if (caster:getStatusEffect(EFFECT_DIVINE_SEAL) ~= nil) then
		final = final*2;
	end
	
	target:addHP(final);
	
	return final;
	
end

-----------------------------------
--	Author: Tenjou
-- 	MAGICAL DAMAGE
-- 	Consolidating this section into one script so that any one change will affect all spells.
-----------------------------------
function takeMagicalDamage(caster,target,final)

	if (caster:getStatusEffect(EFFECT_ELEMENTAL_SEAL) ~= nil and caster:getEquip(1) == 18994) then --Laevateinn enhances spell damage 10% with Elemental Seal.
		final = final * 1.1;
	end
	
	target:removeHP(final);
	target:updateEnmity(caster,final*(240/math.floor((6+(target:getMainLvl()*31/50)))),final*(80/math.floor((6+(target:getMainLvl()*31/50)))));
	
	return final;
	
end

----------------------------------------
--  Author: Kegsay
--  Blue Magic Family Strength/Weaknesses
--  INPUT ARGS: family type of blue magic spell, family type of opponent
--  OUTPUT ARGS: the multiplier
--  Notes: both inputs should be the ID value of the family/system
--  1 Amorph			6 Beastmen		11 Lizard		16 Undead
--  2 Aquan				7 Bird			12 Luminian		17 Vermin
--  3 Arcana 			8 Demon			13 Luminion
--  4 Archaic Machine	9 Dragon		14 Plantoid
--  5 Beast				10 Empty		15 Unclassified
-----------------------------------------
function calculateFamilyBonus(caster,spelltype,monstertype)
	multiplier = 0;
	--print("BLUE Family spell/mob: ",spelltype,monstertype);
	--work out multiplier bonus (+-0.25)
	
		--Amorphs >>>> Birds >>>> Aquans >>>> Amorphs
		--Dealing with Amorphs (1)
		if (spelltype==1) then 
			if (monstertype==7) then 
				multiplier=0.25; 
			end 
			if (monstertype==2) then 
				multiplier = -0.25; 
			end 
		end
		--Dealing with Birds (7)
		if (spelltype==7) then 
			if (monstertype==2) then 
				multiplier=0.25; 
			end 
			if (monstertype==1) then 
				multiplier = -0.25; 
			end 
		end
		--Dealing with Aquans (2)
		if (spelltype==2) then 
			if (monstertype==1) then 
				multiplier=0.25; 
			end 
			if (monstertype==7) then 
				multiplier = -0.25; 
			end 
		end
		
		--Lizards >>> Vermin >>>> Plantoids >>> Beasts >>> Lizards
		--Dealing with Lizards (11)
		if (spelltype==11) then 
			if (monstertype==17) then 
				multiplier=0.25; 
			end 
			if (monstertype==5) then 
				multiplier = -0.25; 
			end 
		end
		--Dealing with Beasts (5)
		if (spelltype==5) then 
			if (monstertype==11) then 
				multiplier=0.25; 
			end 
			if (monstertype==14) then 
				multiplier = -0.25; 
			end 
		end
		--Dealing with Vermin (17)
		if (spelltype==17) then 
			if (monstertype==14) then 
				multiplier=0.25; 
			end 
			if (monstertype==11) then 
				multiplier = -0.25; 
			end 
		end
		--Dealing with Plantoids (14)
		if (spelltype==14) then 
			if (monstertype==5) then 
				multiplier=0.25; 
			end 
			if (monstertype==17) then 
				multiplier = -0.25; 
			end 
		end
		
		--Undead <---> Arcana
		--Dealing with Undead (16)
		if (spelltype==16 and monstertype==3) then 
				multiplier=0.25; 
		end
		--Dealing with Arcana (3)
		if (spelltype==3 and monstertype==16) then 
				multiplier=0.25; 
		end
		
		--Demon <---> Dragon
		--Dealing with Demon (8)
		if (spelltype==8 and monstertype==9) then 
				multiplier=0.25; 
		end
		--Dealing with Dragon (9)
		if (spelltype==9 and monstertype==8) then 
				multiplier=0.25; 
		end
		
		--Luminian <---> Luminion
		--Dealing with Luminian (12)
		if (spelltype==12 and monstertype==13) then 
				multiplier=0.25; 
		end
		--Dealing with Luminion (13)
		if (spelltype==13 and monstertype==12) then 
				multiplier=0.25; 
		end
	
	--give Magus Keffiyeh bonus (no penalty) (0.02)
	head = caster:getEquip(5);
	if (head==MagusKeffiyehNQ or head==MagusKeffiyehHQ) then --keffiyeh equipped
		if (multiplier==0.25) then
			multiplier = 0.27;
		end
	end
	
	--give merits bonus (0.004)
	if(multiplier>0.24) then
		--print("Bonus Family!!");
	elseif(multiplier<0) then
		--print("Penalty Family....");
	end
	
	
	return multiplier;
end


----------------------------------------
--  Author: Kegsay
--  Blue Magic Physical Damage Calculator
--  INPUT ARGS: Blue magic skill, Monster def, Player accuracy, Monster evasion, dSTR, total (level corrected) WSC, D cap, numberofhits, leveldiff, 
--																	chainaffinity_on, canCrit, multiplier, playerlevel, CannonballDef, Sneak Attack
--  OUTPUT: Damage dealt
--  Notes:
--  dSTR = Player STR - Monster VIT
--  WSC = The unique attribute % bonus (e.g. STR20%), The total value for this should already be worked out AND level corrected.
--  D Cap = The unique Damage cap on spells with blue magic skill
--  leveldiff = The level difference in the form of (PLAYER LEVEL - MONSTER LEVEL)
--  chainaffinity_on = Simple boolean true/false, if it is true, WSC will be doubled.
--  canCrit = This should be between 0-1, 0 means it cannot crit, 1 means it will always crit. Any value inbetween is the chance. Use this for CA and Critical TP modifiers!
--  multiplier = the multiplier for the spell, used on the first hit only (subsequent hits have 1.0 multiplier), this is the TP0 colomn on the wiki
--  CannonballDef = Keep this at 0 if the spell is not Cannonball. If it is, change this to the players DEF value.
--  sneakattack = flick this to true if sneak attack is ON and WILL INCREASE DAMAGE (i.e. don't put this to true if player has SA on and is in front of mob
--
--  Whats not covered
--  This calculator WILL NOT ACCOUNT FOR TP BONUS FROM CHAIN AFFINITY. APPLY THAT IN THE SPELL!!
--  Final D value floor(D+fSTR+WSC) * Multiplier
--  Also, Azure Lore is not accounted for (since this ties in with multiplier)
--  Also, Family Bonuses are not accounted for (since this ties in with multiplier)
--  Spells with a CA mod of Acc/Damage/etc will need to boost those respective values BEFORE PASSING THEM OVER (if CA is on).
--  Status effects / buffs / etc, don't be silly!
-- 
--  
--  What's covered
--  This will work out the total base damage, PDIF (including crit!), number of hits, and return the damage dealt.
--
--  What should be calculated in individual blue magic files
--  *dstr = player_str - monster_str;
--  *wsc = player attributes (e.g. STR30%) which should then be passed through alpha correction
--  *dcap = obtained from wiki
--  *leveldiff = player_level - monster_level;
--  *chainaffinity_on = Check for this effect, if it's on then flip this to true! Remember to reset TP and remove effect afterwards!
--  *canCrit = The chance of a critical between 0-1 (0 being no chance, 1 being it definitely will critical). Use DEX and any Chain Affinity modifiers.
--  *multiplier = Check for Chain Affinity, if its on, work out the new multiplier before passing it.
----------------------------------------
function calculateBlueMagicDamage(blueskill,mobdef,acc,eva,dstr,wsc,dcap,numberofhits,leveldiff,chainaffinity_on,canCrit,multiplier,plevel,CannonballDef,sneakattack)
	--Calculate the overall "base" damage
	d = math.floor(blueskill*0.11);
	--print("blueskill: ",blueskill); --check to make sure this is an int not double
	d = (d * 2)+3;
	if (d>dcap) then
		d = dcap;
	end
	if (chainaffinity_on==true) then --double WSC
		d = d + wsc*2;
	elseif (chainaffinity_on==false) then --don't double WSC
		d = d + wsc;
	end
	fstr = getfSTR(dstr); --work out fSTR to append to base damage
	base = d + fstr;
	
	--=================START OF OBTAINING RATIOS ========================
	--Calculate cRatio
	if (CannonballDef==0) then
	ratio = (plevel+blueskill)/mobdef; --Ratio is NOT dependant on normal attack!!
	else
		ratio = CannonballDef/mobdef;
	end

	if (leveldiff<0) then --Monster is of a higher level than player, give penalty
	levelcor = 0.05 * leveldiff;
	ratio = ratio + levelcor;
	end
	criticalratio = ratio+1;
	if (criticalratio>3) then
	criticalratio = 3;
	end
	if (ratio>2) then
	ratio = 2;
	elseif (ratio<0) then
	ratio = 0;
	end
	--print("Ratio final: ",ratio);
	
	--Obtaining cRatio_MIN
	local double cratiomin = 0;
	if (ratio<1.25) then
	cratiomin = 1.2 * ratio - 0.5;
	end
	if (ratio>=1.25 and ratio<=1.5) then
	cratiomin = 1;
	end
	if (ratio>1.5 and ratio<=2) then
	cratiomin = 1.2 * ratio - 0.8;
	end
	--Obtaining cRatio_MAX
	local double cratiomax = 0;
	if (ratio<0.5) then
	cratiomax = 0.4 + 1.2 * ratio;
	end
	if (ratio<=0.833 and ratio>=0.5) then
	cratiomax = 1;
	end
	if (ratio<=2 and ratio>0.833) then
	cratiomax = 1.2 * ratio;
	end
	--print("pdif_max: ",cratiomax);
	--capping cRatioMin
	if (cratiomin<0) then
	cratiomin=0;
	end;
	--print("pdif_min: ",cratiomin);
	local double cratiomincrit = 0; --need these initialised outside the if
	local double cratiomaxcrit = 0;
	if (canCrit>0) then
	--Obtaining Critical cRatio_MIN
	if (criticalratio<1.25) then
	cratiomincrit = 1.2 * criticalratio - 0.5;
	end
	if (criticalratio>=1.25 and criticalratio<=1.5) then
	cratiomincrit = 1;
	end
	if (criticalratio>1.5 and criticalratio<=3) then
	cratiomincrit = 1.2 * criticalratio - 0.8;
	end
	
	--Obtaining Critical cRatio_MAX
	if (criticalratio<0.5) then
	cratiomaxcrit = 0.4 + 1.2 * criticalratio;
	end
	if (criticalratio<=0.833 and criticalratio>=0.5) then
	cratiomaxcrit = 1;
	end
	if (criticalratio<=3 and criticalratio>0.833) then
	cratiomaxcrit = 1.2 * criticalratio;
	end
	end
	
	--=================END OF OBTAINING RATIOS ========================
	
	--Applying pDIF
	local double pdif = math.random((cratiomin*1000),(cratiomax*1000)); 
	pdif = pdif/1000; --multiplier set.
	local double cpdif = 0;
	--print("pdif: ",pdif);
	if (canCrit>0) then
	--Applying Crit pDIF
	cpdif = math.random((cratiomincrit*1000),(cratiomaxcrit*1000)); 
	cpdif = cpdif/1000; --multiplier set.
	end
	
	--Working out hit rate
	local double hitdiff = 0;
	local double hitrate = 75;
	if (acc>eva) then
	hitdiff = (acc-eva)/2;
	end
	if (eva>acc) then
	hitdiff = ((-1)*(eva-acc))/2;
	end
	
	hitrate = hitrate+hitdiff;
	hitrate = hitrate/100;
	
	--Applying hitrate caps
	if (hitrate>0.95) then
	hitrate = 0.95;
	end
	if (hitrate<0.2) then
	hitrate = 0.2;
	end
	--print("hitrate: ",hitrate);
	
	-- ========== THE ACTUAL HITS ===============
	--Do it!
	hitsdone = 0;
	damagedealt = 0;
	if (canCrit==1 and hitsdone==0 and sneakattack==true) then --First hit, it can crit, so use critPDIF, can only be done with Sneak attack so 100% hit rate.
		damagedealt = damagedealt + base * cpdif * multiplier;
		--print("Critical! Damage so far: ",damagedealt);
		hitsdone = hitsdone + 1;
	elseif (canCrit>0 and hitsdone==0 and sneakattack==false) then --First hit, can crit (due to Chain affinity for example), normal hit rate.
		local double hitchance = math.random();
		local double critchance = math.random();
		if (hitchance<=hitrate) then
			--work out crit chance and apply it.
			if (critchance<=canCrit) then --critical hit!
				damagedealt = damagedealt + base * cpdif * multiplier;
			else
				damagedealt = damagedealt + base * pdif * multiplier;
			end
			--print("Critical first hit, total damage:",damagedealt);
		end
		hitsdone = hitsdone + 1;
	elseif (canCrit==0 and hitsdone==0) then --First hit, cannot crit, using normal PDIF, using multiplier (multihit spells have 1.0 multiplier!
		local double firstchance = math.random();
		if (firstchance<=hitrate) then
			damagedealt = damagedealt + base * pdif * multiplier;
			--print("First hit, total damage:",damagedealt);
		end
		hitsdone = hitsdone + 1;
	end
	
	while (hitsdone < numberofhits) do --accomodate for multi-hits (these can never ever critical)
		local double chance = math.random();
		if (chance<=hitrate) then --it hit
			local double multipdif = math.random((cratiomin*1000),(cratiomax*1000)); --generate random PDIFs for extra hits
			multipdif = multipdif/1000; --multiplier set.
			--print("Extra hit! PDIF: ",multipdif);
			damagedealt = damagedealt + base * multipdif; --note the missing multiplier, since its 1.0
			--print("Damage so far: ",damagedealt);
		end
		hitsdone = hitsdone + 1;
	end
	
	return damagedealt;
end
	
--------------
-- Author: Kegsay
-- Legacy method, do not remove unless you have changed ALL BLUE MAGIC SPELLS to have this done in the spell scripts.
---------------
function getblueskill(caster)
	skill = caster:getSkill(43);
	return skill;
end


----------------
-- Author: Kegsay
-- Damage Type Bonus/Penalty Calculator
-- 1=Blunt(H2H) | 2=Blunt(Impact) | 3=Pierce | 4=Slash
----------------
function damageTypeBonus(target,dtype)
	--see if you get a damage type bonus...
	family = target:getFamily();
	bonus = 1;
		-------------------------------
		--FamID			Name		Type		Bonus amount
		--42			Bee			Pierce			1.25
		--41			Bats		Pierce			1.25
		--99			Rocs		Pierce			1.25
		--47			Birds		Pierce			1.25
		--61			Corses		Pierce			0.75
		--60			Colibri		Pierce			1.25
		--91			Flies		Pierce			1.25
		--40			Bat			Pierce			1.25
		--118/230		Imps		Pierce			1.125
		--123			Ladybug		Pierce			1.5
		--167			Skeleton	Pierce			0.5
		--130			Mandragora	Pierce			1.25
		--148			Puk			Pierce			1.25
		--97			Ghosts		Pierce/Slash	0.75
		--168/241/242	Slimes		Pierce/Slash	0.5
		--99			Rocs		Slashing		0.75
		--167			Skeleton	Slashing		0.875
		--69			Doomed		Slashing		1.125
		--110/223		Hounds		Slashing		1.125
		--99			Rocs		Impact			0.75
		--61			Corses		Impact			1.25
		--69			Doomed		Impact			0.875
		--127			Magic Pot	Impact			1.5
		--167			Skeleton	Impact			1.25
		--97			Ghosts		Blunt(both)		0.5
		--108			Hecteyes	Blunt(both)		0.75
		--125			Leeches		Blunt(both)		0.75
		--168/241/242	Slime		Blunt(both)		0.25
		--127			Magic Pot	H2H				1.25
		--167			Skeleton	H2H				1.125
		--61			Corses		H2H				1.125
		--69			Doomed		H2H				0.875
		--79-86			Elemental	ALL				0.25
		--135			Mimics		ALL				0.5		
		-------------------------------
		if (dtype==1) then -- Blunt H2H
			if (family==97 or family==135) then
				bonus=0.5;
				--print("Damage penalty!");
			elseif (family==108 or family==125) then
				bonus=0.75;
				--print("Damage penalty!");
			elseif (family==168 or family==241 or family==242 or family>=79 and family<=86) then
				bonus=0.25;
				--print("Damage penalty!");
			elseif (family==69) then
				bonus=0.875;
				--print("Damage penalty!");
			elseif (family==167 or family==61) then
				bonus=1.125;
				--print("Damage bonus!!");
			elseif (family==127) then
				bonus=1.25;
				--print("Damage bonus!!");
			end
		elseif (dtype==2) then -- Blunt Impact
			if (family==168 or family==241 or family==242 or family>=79 and family<=86) then
				bonus = 0.25;
				--print("Damage penalty!");
			elseif (family==135 or family==97) then
				bonus=0.5;
				--print("Damage penalty!");
			elseif (family==99 or family==108 or family==125) then
				bonus=0.75;
				--print("Damage penalty!");
			elseif (family==69) then
				bonus=0.875;
				--print("Damage penalty!");
			elseif (family==167 or family==61) then
				bonus=1.25;
				--print("Damage bonus!!");
			elseif (family==127) then
				bonus=1.5;
				--print("Damage bonus!!");
			end	
		elseif (dtype==3) then -- Pierce
			if (family>=79 and family<=86) then
				bonus=0.25;
				--print("Damage penalty!");
			elseif (family==135 or family==168 or family==241 or family==242 or family==167) then
				bonus=0.5;
				--print("Damage penalty!");
			elseif (family==61 or family==97) then
				bonus=0.75;
				--print("Damage penalty!");
			elseif (family==118 or family==230) then
				bonus=1.125;
				--print("Damage bonus!!");
			elseif (family==42 or family==41 or family==99 or family==47 or family==60 or family==91 or family==40 or family==130 or family==148) then
				bonus=1.25;
				--print("Damage bonus!!");
			elseif (family==123) then
				bonus=1.5;
				--print("Damage bonus!!");
			end
		elseif (dtype==4) then -- Slash
			if (family>=79 and family<=86) then
				bonus=0.25;
				--print("Damage penalty!");
			elseif (family==135 or family==168 or family==241 or family==242) then
				bonus=0.5;
				--print("Damage penalty!");
			elseif (family==99 or family==97) then
				bonus=0.75;
				--print("Damage penalty!");
			elseif (family==69) then
				bonus=1.125;
				--print("Damage bonus!!");
			elseif (family==167) then
				bonus=0.875;
				--print("Damage penalty!");
			end
		end
		return bonus;
end

-----------------
-- Author: Kegsay
-- Take Blue Magic Physical Damage
-- Passing through Blunt/Piercing/Slashing
----------------
function takePhysicalBlueDamage(caster,target,final,spell,dtype)
	bonus = damageTypeBonus(target,dtype);
	if (final==0) then --display resist message
		spell:setMsg(114);
	end
	final = final * bonus;
	target:removeHP(final);
	target:updateEnmity(caster,final*(240/math.floor((6+(target:getMainLvl()*31/50)))),final*(80/math.floor((6+(target:getMainLvl()*31/50)))));
	return final;
end
