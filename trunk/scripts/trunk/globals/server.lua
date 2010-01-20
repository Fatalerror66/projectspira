require("/scripts/globals/common");
require("/scripts/globals/settings");

--Note from Tenjou; now you can customize it a little more in the settings!

function onCharCreate(player)

-- SET START GIL
player:addGil(START_GIL);


	-- ADD RACE SPECIFIC STARTGEAR 
	switch(player:getRace()) : caseof {

		-- HUME MALE
 		 [1]	= function (x) 
			player:addAndEquip(0x3157);
			player:addAndEquip(0x3253);
			player:addAndEquip(0x31D2);
			player:addAndEquip(0x32CD);
  		end,

		-- HUME FEMALE
  		[2]	= function (x) 
			player:addAndEquip(0x3158);
			player:addAndEquip(0x3254);
			player:addAndEquip(0x31D8);
			player:addAndEquip(0x32D2);
  		end,

		-- ELVAAN MALE
  		[3]	= function (x) 
			player:addAndEquip(0x3159);
			player:addAndEquip(0x3255);
			player:addAndEquip(0x31D3);
			player:addAndEquip(0x32CE);
  		end,

		-- ELVAAN FEMALE
  		[4]	= function (x) 
			player:addAndEquip(0x315A);
			player:addAndEquip(0x3259);
			player:addAndEquip(0x31D7);
			player:addAndEquip(0x32D3);
  		end,
	
		-- TARU MALE
  		[5]	= function (x) 
			player:addAndEquip(0x315B);
			player:addAndEquip(0x3256);
			player:addAndEquip(0x31D4);
			player:addAndEquip(0x32CF);
  		end,
	
		-- TARU FEMALE
  		[6]	= function (x) 
			player:addAndEquip(0x315B);
			player:addAndEquip(0x3256);
			player:addAndEquip(0x31D4);
			player:addAndEquip(0x32CF);
  		end,
	
		-- MITHRA
  		[7]	= function (x) 
			player:addAndEquip(0x315C);
			player:addAndEquip(0x3257);
			player:addAndEquip(0x31D5);
			player:addAndEquip(0x32D0);
  		end,
	
		-- GALKA
  		[8]	= function (x) 
			player:addAndEquip(0x315D);
			player:addAndEquip(0x3258);
			player:addAndEquip(0x31D6);
			player:addAndEquip(0x32D1);
  		end,
	
  		default = function (x) 
  		end,
	
	}
	
	-- ADD JOB SPECIFIC STARTGEAR 
	switch(player:getMainJob()) : caseof {
		-- WARRIOR JOB
		[0x01]= function (x)
			player:addItem(0x4096);
			pos = 6;
		end,
		-- MONK JOB
		[0x02]= function (x)
 			player:addItem(0x3380);
			pos = 6;
		end,
		-- WHITE MAGE
		[0x03]= function(x)
			player:addItem(0x42AC);
			player:addItem(0x1200);
			pos = 7;
		end,
 		-- BLACK MAGE
		[0x04] = function(x)
			player:addItem(0x42D0);
			player:addItem(0x129F);
			pos = 7;
		end,
 		-- RED MAGE
	 	[0x05]= function (x)
			player:addItem(0x4062);
			player:addItem(0x11FE);
			pos = 7;
 		end,
 		-- THIEF
		[0x06]= function (x)
			player:addItem(0x4063);
			pos = 6;
 		end,
 		default = function (x) end,
	}

	
	-- ADD NATION SPECIFIC STARTGEAR 
 	switch (player:getNation()) : caseof {
 		-- SANDY CITIZEN
		[0x00]= function (x)
			if ((player:getRace() == 0x03) or (player:getRace() == 0x04))
				then player:addAndEquip(0x34B7);
			end;
			player:addKeyItem(0x181);
		end,
	
 		-- BASTOK CITIZEN
		[0x01]= function (x)
			if (((player:getRace() == 0x01) or (player:getRace() == 0x02) or (player:getRace() == 0x08)))
				then player:addAndEquip(0x34B9);
			end;
			player:addKeyItem(0x182);
		end,
	
 		-- WINDY CITIZEN
	 	[0x02]= function(x)
			if (((player:getRace() == 0x05) or (player:getRace() == 0x06) or (player:getRace() == 0x07))) 
				then player:addAndEquip(0x34B8);
			end;
			player:addKeyItem(0x183);
 		end,
	
		default= function (x) end,
	}
	
	-- ADD ADVENTURER COUPON
	player:addItem(0x218);
	
	--SET LEVEL CAP
	--print("Setting level cap to " .. INITIAL_LEVEL_CAP);
	player:setLevelCap(INITIAL_LEVEL_CAP);
	
	--SET TITLE
	player:setTitle(206);

	-- SET Zilart mission 0 as active
	player:currentMission(3,0);
	
--Custom options.	
player:increaseStorage(0,START_INVENTORY);

if (JINX_MODE_2005 == 1) then
	switch (player:getRace()) : caseof {
	[1] = function (x) --Hume M
		player:addItem(0x3872);
		player:addItem(0x3c30); end,
	[2] = function (x) --Hume F
		player:addItem(0x3873);
		player:addItem(0x3c31); end,
	[3] = function (x) --Elvaan M
		player:addItem(0x3874);
		player:addItem(0x3c32); end,
	[4] = function (x) --Elvaan F
		player:addItem(0x3875);
		player:addItem(0x3c33); end,
	[5] = function (x) --Taru M
		player:addItem(0x3876);
		player:addItem(0x3c34); end,
	[6] = function (x) --Taru F
		player:addItem(0x3887);
		player:addItem(0x3c3f); end,
	[7] = function (x) --Mithra
		player:addItem(0x3877);
		player:addItem(0x3c35); end,
	[8] = function (x) --Galka
		player:addItem(0x3878);
		player:addItem(0x3c36); end,
	default = function (x) end, }
end
if (JINX_MODE_2008 == 1) then
	switch (player:getRace()) : caseof {
	[1] = function (x) --Hume M
		player:addItem(0x2c01);
		player:addItem(0x3fc1); end,
	[2] = function (x) --Hume F
		player:addItem(0x2c02);
		player:addItem(0x3fc2); end,
	[3] = function (x) --Elvaan M
		player:addItem(0x2c03);
		player:addItem(0x3fc3); end,
	[4] = function (x) --Elvaan F
		player:addItem(0x2c04);
		player:addItem(0x3fc4); end,
	[5] = function (x) --Taru M
		player:addItem(0x2c05);
		player:addItem(0x3fc5); end,
	[6] = function (x) --Taru F
		player:addItem(0x2c06);
		player:addItem(0x3fc6); end,
	[7] = function (x) --Mithra
		player:addItem(0x2c07);
		player:addItem(0x3fc7); end,
	[8] = function (x) --Galka
		player:addItem(0x2c08);
		player:addItem(0x3fc8); end,
	default = function (x) end, }
end
if (SUMMERFEST == 1) then
	race = player:getRace();
	if (race == 1 or race == 3 or race == 5 or race == 8) then --Male
		player:addItem(0x35fd);
	else
		player:addItem(0x35fe);
	end
	player:addItem(0x4555);
end
if (CHRISTMAS == 1) then
	player:addItem(0x49af);
	player:addItem(0x3b4a);
	player:addItem(0x38b7);
	player:addItem(0x3d88);
end
if (HALLOWEEN == 1) then
	player:addItem(0x3ecc);
	player:addItem(0x2c25);
	player:addItem(0x365d);
	player:addItem(0x3b49);
	player:addItem(0x46b6);
end

if (ALL_MAPS == 1) then
	for i=0x17f,0x1bf do
		player:addKeyItem(i);
	end
	for j=0x740,0x75c do
		player:addKeyItem(j);
	end
end

if (SUBJOB_QUEST_LEVEL == 0) then
	unlockSubJobs();
end

if (ADVANCED_JOB_LEVEL == 0) then
	for k=7,20 do
		unlockJob(k);
	end
end

end; 