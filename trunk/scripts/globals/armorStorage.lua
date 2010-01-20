--------------------------------------
---Orignal Author: Mana
---Last Modified: Friday,December 26,2008
---Last Modified by: Mana
---Armor storage NPC script for defining functions
--------------------------------------

require("/scripts/globals/common");

function
checkTradedSet(item1,item2,item3,item4,item5) -- Checks to see if an armor set was traded to the NPC
armorT = { item1,item2,item3,item4,item5 }
table.sort(armorT) -- prepares item table for easier trade comparison


-- Define 24~30 MENU items
KI780 = { 0x3088,0x3108,0x3188,0x3208,0x3288 }
KI781 = { 0x3a0a,0x3b3d,0x3bd3,0x37f7,0x385a }
KI782 = { 0x3091,0x3111,0x3191,0x3211,0x3291 }
KI783 = { 0x30ba,0x313a,0x31ba,0x323a,0x32ba }
KI784 = { 0x37f9,0x385f,0x3a0c,0x3b3f,0x3bd5 }
KI785 = { 0x30aa,0x312a,0x31aa,0x322a,0x32aa }
KI786 = { 0x3858,0x3a08,0x3b3b,0x3bd1,0x37f5 }
KI787 = { 0x309a,0x311a,0x319a,0x321a,0x329a }
KI788 = { 0x3096,0x3116,0x3196,0x3216,0x3296 }
KI789 = { 0x30b6,0x3136,0x31b6,0x3236,0x32b6 }
KI78a = { 0x37f6,0x3859,0x3a09,0x3b3c,0x3bd2 }
KI78b = { 0x37f3,0x3856,0x3a06,0x3b39,0x3bcf }
-- 31~40
KI78c = { 0x0,0x316e,0x31d9,0x3247,0x32d7 }
KI78d = { 0x0,0x316f,0x31da,0x3248,0x32d8 }
KI78e = { 0x0,0x3170,0x31db,0x3249,0x32d9 }
KI78f = { 0x0,0x3171,0x31dc,0x324a,0x32da }
KI790 = { 0x0,0x3172,0x31dd,0x324b,0x32db }
KI791 = { 0x0,0x3173,0x31de,0x324c,0x32dc }
KI792 = { 0x0,0x3174,0x31df,0x324d,0x32dd }
KI793 = { 0x30a2,0x3122,0x31a2,0x3224,0x32a2 }
KI794 = { 0x0,0x3142,0x31c2,0x3242,0x32c2 }
KI795 = { 0x3089,0x3109,0x3189,0x3209,0x3289 }
KI796 = { 0x30b2,0x3132,0x31b2,0x3232,0x32b2 }
KI797 = { 0x35d7,0x362f,0x36b1,0x3726,0x37a3 }
KI798 = { 0x309b,0x311b,0x319b,0x321b,0x329b }
KI799 = { 0x30bb,0x313b,0x31bb,0x323b,0x32bb }
KI79a = { 0x0,0x366b,0x3724,0x37a9,0x3830 }
KI79b = { 0x308f,0x310f,0x318f,0x320f,0x328f }
KI79c = { 0x3080,0x3100,0x3180,0x3200,0x3280 }
KI79d = { 0x0,0x3146,0x31c7,0x3246,0x32c6 }
-- 41~50
KI79e = { 0x36e3,0x386C,0x3b65,0x3bed,0x3c2a }
KI79f = { 0x3225,0x358f,0x3590,0x3591,0x3593 }
KI7a0 = { 0x308a,0x310a,0x318a,0x320a,0x328a }
KI7a1 = { 0x30ab,0x312b,0x31ab,0x322b,0x32ae }
KI7a2 = { 0x309c,0x311c,0x319c,0x321c,0x329c }
KI7a3 = { 0x35d9,0x3631,0x36b3,0x3728,0x37a5 }
KI7a4 = { 0x30b3,0x3133,0x31b3,0x3233,0x32b3 }
KI7a5 = { 0x30ac,0x312c,0x31ac,0x322c,0x32ac }
KI7aa = { 0x3081,0x3101,0x3181,0x3201,0x3281 }
KI7a6 = { 0x3086,0x3106,0x3186,0x3206,0x3286 }
KI7a7 = { 0x30be,0x313e,0x31be,0x323e,0x32be }
KI7a8 = { 0x0,0x3143,0x31c3,0x3243,0x32c3 }
KI7a9 = { 0x35f6,0x3673,0x376d,0x37e6,0x39ea }
KI7ab = { 0x38a2,0x3a3b,0x3b8a,0x3cda,0x3d2f }
-- AF and High Level items
KI28e = { 0x30df,0x315e,0x3689,0x3709,0x3786 }
KI28f = { 0x30e0,0x315f,0x368a,0x370a,0x3787 }
KI290 = { 0x3160,0x361f,0x368b,0x370b,0x3788 }
KI291 = { 0x3161,0x3620,0x368c,0x370c,0x3789 }
KI292 = { 0x30e1,0x3162,0x368d,0x370d,0x378a }
KI293 = { 0x30e2,0x3163,0x368e,0x370e,0x378b }
KI294 = { 0x30e3,0x3164,0x368f,0x370f,0x378c }
KI295 = { 0x30e4,0x3165,0x3690,0x3710,0x378d }
KI296 = { 0x30e5,0x3166,0x3691,0x3711,0x378e }
KI297 = { 0x3167,0x3621,0x3692,0x3712,0x378f }
KI298 = { 0x30e6,0x3168,0x3693,0x3713,0x3790 }
KI299 = { 0x35d5,0x362c,0x3694,0x3714,0x3791 }
KI29a = { 0x35d6,0x362d,0x3695,0x3715,0x3792 }
KI29b = { 0x30e7,0x3169,0x3696,0x3716,0x3793 }
KI29c = { 0x30e8,0x316a,0x3697,0x3717,0x3794 }
KI7ac = { 0x38b9,0x3a50,0x3ba1,0x3cf0,0x3d44 }
KI7ad = { 0x38ba,0x3a51,0x3ba2,0x3cf1,0x3d45 }
KI7ae = { 0x38bb,0x3a52,0x3ba3,0x3cf2,0x3d46 }
KI7af = { 0x38f2,0x3a9a,0x3d2b,0x3d82,0x3f0a }
KI7b0 = { 0x38f3,0x3a9b,0x3d2c,0x3d83,0x3f0b }
KI7b1 = { 0x38f4,0x3a9c,0x3d84,0x3f0c,0x3fb7 }
KI7b2 = { 0x38c2,0x3a5c,0x3cf9,0x3d4f,0x3ec5 }
KI7b3 = { 0x38c2,0x3a5c,0x3cf9,0x3d4f,0x3ec5 }
KI7b4 = { 0x38bf,0x3a57,0x3cf6,0x3d4a,0x3ec0 }
-- Relic
KI35d = { 0x3ae0,0x3aef,0x3afe,0x3b0d,0x3b1c }
KI35e = { 0x3ae1,0x3af0,0x3aff,0x3b0e,0x3b1d }
KI35f = { 0x3ae2,0x3af1,0x3b00,0x3b0f,0x3b1e }
KI360 = { 0x3ae3,0x3af2,0x3b01,0x3b10,0x3b1f }
KI361 = { 0x3ae4,0x3af3,0x3b02,0x3b11,0x3b20 }
KI362 = { 0x3ae5,0x3af4,0x3b03,0x3b12,0x3b21 }
KI363 = { 0x3ae6,0x3af5,0x3b04,0x3b13,0x3b22 }
KI364 = { 0x3ae7,0x3af6,0x3b05,0x3b14,0x3b23 }
KI365 = { 0x3ae8,0x3af7,0x3b06,0x3b15,0x3b24 }
KI366 = { 0x3ae9,0x3af8,0x3b07,0x3b16,0x3b25 }
KI367 = { 0x3aea,0x3af9,0x3b08,0x3b17,0x3b26 }
KI368 = { 0x3aeb,0x3afa,0x3b09,0x3b18,0x3b27 }
KI369 = { 0x3aec,0x3afb,0x3b0a,0x3b19,0x3b28 }
KI36a = { 0x3aed,0x3afc,0x3b0b,0x3b1a,0x3b29 }
KI36b = { 0x3aee,0x3afd,0x3b0c,0x3b1b,0x3b2a }
KI41e = { 0x2c1c,0x2c76,0x2cc9,0x3ab1,0x3fda }
KI41f = { 0x2c1f,0x2c79,0x2ccc,0x3ab4,0x3fdd }
KI420 = { 0x2c22,0x2c7c,0x2ccf,0x3ab7,0x3fe0 }
KI421 = { 0x2c29,0x2c84,0x2cd6,0x3abe,0x3fe8 }
KI422 = { 0x2c2b,0x2c86,0x2cd8,0x3ac0,0x3fea }

if (table.concat(armorT)) == (table.concat(KI780)) then
keyItem = 0x780
storeCost = 300
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI781)) then
keyItem = 0x781
storeCost = 300
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI782)) then
keyItem = 0x782
storeCost = 300
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI783)) then
keyItem = 0x783
storeCost = 300
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI784)) then
keyItem = 0x784
storeCost = 300
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI785)) then
keyItem = 0x785
storeCost = 300
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI786)) then
keyItem = 0x786
storeCost = 300
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI787)) then
keyItem = 0x787
storeCost = 300
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI788)) then
keyItem = 0x788
storeCost = 300
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI789)) then
keyItem = 0x789
storeCost = 300
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI78a)) then
keyItem = 0x78a
storeCost = 300
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI78b)) then
keyItem = 0x78b
storeCost = 300
tradedSet = 1
end


if (table.concat(armorT)) == (table.concat(KI78c)) then
keyItem = 0x78c
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI78d)) then
keyItem = 0x78d
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI78e)) then
keyItem = 0x78e
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI78f)) then
keyItem = 0x78f
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI790)) then
keyItem = 0x790
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI791)) then
keyItem = 0x791
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI792)) then
keyItem = 0x792
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI793)) then
keyItem = 0x793
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI794)) then
keyItem = 0x794
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI795)) then
keyItem = 0x795
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI796)) then
keyItem = 0x796
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI797)) then
keyItem = 0x797
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI798)) then
keyItem = 0x798
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI799)) then
keyItem = 0x799
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI79a)) then
keyItem = 0x79a
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI79b)) then
keyItem = 0x79b
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI79c)) then
keyItem = 0x79c
storeCost = 600
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI79d)) then
keyItem = 0x79d
storeCost = 600
tradedSet = 1
end


if (table.concat(armorT)) == (table.concat(KI79e)) then
keyItem = 0x79e
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI79f)) then
keyItem = 0x79f
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7a0)) then
keyItem = 0x7a0
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7a1)) then
keyItem = 0x7a1
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7a2)) then
keyItem = 0x7a2
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7a3)) then
keyItem = 0x7a3
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7a4)) then
keyItem = 0x7a4
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7a5)) then
keyItem = 0x7a5
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7aa)) then
keyItem = 0x7aa
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7a6)) then
keyItem = 0x7a6
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7a7)) then
keyItem = 0x7a7
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7a8)) then
keyItem = 0x7a8
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7a9)) then
keyItem = 0x7a9
storeCost = 800
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7ab)) then
keyItem = 0x7ab
storeCost = 800
tradedSet = 1
end

-- AF
if (table.concat(armorT)) == (table.concat(KI28e)) then
keyItem = 0x28e
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI28f)) then
keyItem = 0x28f
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI290)) then
keyItem = 0x290
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI291)) then
keyItem = 0x291
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI292)) then
keyItem = 0x292
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI293)) then
keyItem = 0x293
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI294)) then
keyItem = 0x294
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI295)) then
keyItem = 0x295
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI296)) then
keyItem = 0x296
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI297)) then
keyItem = 0x297
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI298)) then
keyItem = 0x298
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI299)) then
keyItem = 0x299
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI29a)) then
keyItem = 0x29a
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI29b)) then
keyItem = 0x29b
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI29c)) then
keyItem = 0x29c
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7ac)) then
keyItem = 0x7ac
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7ad)) then
keyItem = 0x7ad
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7ae)) then
keyItem = 0x7ae
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7af)) then
keyItem = 0x7af
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7b0)) then
keyItem = 0x7b0
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7b1)) then
keyItem = 0x7b1
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7b2)) then
keyItem = 0x7b2
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7b3)) then
keyItem = 0x7b3
storeCost = 1000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI7b4)) then
keyItem = 0x7b4
storeCost = 1000
tradedSet = 1
end

-- Relic
if (table.concat(armorT)) == (table.concat(KI35d)) then
keyItem = 0x35d
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI35e)) then
keyItem = 0x35e
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI35f)) then
keyItem = 0x35f
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI360)) then
keyItem = 0x360
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI361)) then
keyItem = 0x361
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI362)) then
keyItem = 0x362
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI363)) then
keyItem = 0x363
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI364)) then
keyItem = 0x364
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI365)) then
keyItem = 0x365
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI366)) then
keyItem = 0x366
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI367)) then
keyItem = 0x367
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI368)) then
keyItem = 0x368
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI369)) then
keyItem = 0x369
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI36a)) then
keyItem = 0x36a
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI36b)) then
keyItem = 0x36b
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI41e)) then
keyItem = 0x41e
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI41f)) then
keyItem = 0x41f
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI420)) then
keyItem = 0x420
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI421)) then
keyItem = 0x421
storeCost = 2000
tradedSet = 1
end
if (table.concat(armorT)) == (table.concat(KI422)) then
keyItem = 0x422
storeCost = 2000
tradedSet = 1
end

result = {}

result[1] = keyItem
result[2] = storeCost
result[3] = tradedSet

   return (result)
end

function  -- Menu Filter for armor storage NPC
getStoredSets(player)
set = {}
 -- Define 24~30 MENU items
armorM1L1 = player:hasKeyItem(0x780)
armorM1L2 = player:hasKeyItem(0x781)
armorM1L3 = player:hasKeyItem(0x782)
armorM1L4 = player:hasKeyItem(0x783)
armorM1L5 = player:hasKeyItem(0x784)
armorM1L6 = player:hasKeyItem(0x785)
armorM1L7 = player:hasKeyItem(0x786)
armorM1L8 = player:hasKeyItem(0x787)
armorM1L9 = player:hasKeyItem(0x788)
armorM1L10 = player:hasKeyItem(0x789)
armorM1L11 = player:hasKeyItem(0x78a)
armorM1L12 = player:hasKeyItem(0x78b)
-- Define 31~40 MENU items
armorM2L1 = player:hasKeyItem(0x78c)
armorM2L2 = player:hasKeyItem(0x78d)
armorM2L3 = player:hasKeyItem(0x78e)
armorM2L4 = player:hasKeyItem(0x78f)
armorM2L5 = player:hasKeyItem(0x790)
armorM2L6 = player:hasKeyItem(0x791)
armorM2L7 = player:hasKeyItem(0x792)
armorM2L8 = player:hasKeyItem(0x793)
armorM2L9 = player:hasKeyItem(0x794)
armorM2L10 = player:hasKeyItem(0x795)
armorM2L11 = player:hasKeyItem(0x796)
armorM2L12 = player:hasKeyItem(0x797)
armorM2L13 = player:hasKeyItem(0x798)
armorM2L14 = player:hasKeyItem(0x799)
armorM2L15 = player:hasKeyItem(0x79a)
armorM2L16 = player:hasKeyItem(0x79b)
armorM2L17 = player:hasKeyItem(0x79c)
armorM2L18 = player:hasKeyItem(0x79d)
--Define 41~50 MENU items
armorM3L1 = player:hasKeyItem(0x79e)
armorM3L2 = player:hasKeyItem(0x79f)
armorM3L3 = player:hasKeyItem(0x7a0)
armorM3L4 = player:hasKeyItem(0x7a1)
armorM3L5 = player:hasKeyItem(0x7a2)
armorM3L6 = player:hasKeyItem(0x7a3)
armorM3L7 = player:hasKeyItem(0x7a4)
armorM3L8 = player:hasKeyItem(0x7a5)
armorM3L9 = player:hasKeyItem(0x7aa)
armorM3L10 = player:hasKeyItem(0x7a6)
armorM3L11 = player:hasKeyItem(0x7a7)
armorM3L12 = player:hasKeyItem(0x7a8)
armorM3L13 = player:hasKeyItem(0x7a9)
armorM3L14 = player:hasKeyItem(0x7ab)
-- Define Artiface and High level MENU items
armorM4L1 = player:hasKeyItem(0x28e)
armorM4L2 = player:hasKeyItem(0x28f)
armorM4L3 = player:hasKeyItem(0x290)
armorM4L4 = player:hasKeyItem(0x291)
armorM4L5 = player:hasKeyItem(0x292)
armorM4L6 = player:hasKeyItem(0x293)
armorM4L7 = player:hasKeyItem(0x294)
armorM4L8 = player:hasKeyItem(0x295)
armorM4L9 = player:hasKeyItem(0x296)
armorM4L10 = player:hasKeyItem(0x297)
armorM4L11 = player:hasKeyItem(0x298)
armorM4L12 = player:hasKeyItem(0x299)
armorM4L13 = player:hasKeyItem(0x29a)
armorM4L14 = player:hasKeyItem(0x29b)
armorM4L15 = player:hasKeyItem(0x29c)
armorM4L16 = player:hasKeyItem(0x7ac)
armorM4L17 = player:hasKeyItem(0x7ad)
armorM4L18 = player:hasKeyItem(0x7ae)
armorM4L19 = player:hasKeyItem(0x7af)
armorM4L20 = player:hasKeyItem(0x7b0)
armorM4L21 = player:hasKeyItem(0x7b1)
armorM4L22 = player:hasKeyItem(0x7b2)
armorM4L23 = player:hasKeyItem(0x7b3)
armorM4L24 = player:hasKeyItem(0x7b4)
-- Define Relic MENU items
armorM5L1 = player:hasKeyItem(0x35d)
armorM5L2 = player:hasKeyItem(0x35e)
armorM5L3 = player:hasKeyItem(0x35f)
armorM5L4 = player:hasKeyItem(0x360)
armorM5L5 = player:hasKeyItem(0x361)
armorM5L6 = player:hasKeyItem(0x362)
armorM5L7 = player:hasKeyItem(0x363)
armorM5L8 = player:hasKeyItem(0x364)
armorM5L9 = player:hasKeyItem(0x365)
armorM5L10 = player:hasKeyItem(0x366)
armorM5L11 = player:hasKeyItem(0x367)
armorM5L12 = player:hasKeyItem(0x368)
armorM5L13 = player:hasKeyItem(0x369)
armorM5L14 = player:hasKeyItem(0x36a)
armorM5L15 = player:hasKeyItem(0x36b)
armorM5L16 = player:hasKeyItem(0x41e)
armorM5L17 = player:hasKeyItem(0x41f)
armorM5L18 = player:hasKeyItem(0x420)
armorM5L19 = player:hasKeyItem(0x421)
armorM5L20 = player:hasKeyItem(0x422)

-- make 24~30 MENU
set1 = 0x0
if armorM1L1 == 1 then
set1 = (set1 + 0x1)
end
if armorM1L2 == 1 then
set1 = (set1 + 0x2)
end
if armorM1L3 == 1 then
set1 = (set1 + 0x4)
end
if armorM1L4 == 1 then
set1 = (set1 + 0x8)
end
if armorM1L5 == 1 then
set1 = (set1 + 0x10)
end
if armorM1L6 == 1 then
set1 = (set1 + 0x20)
end
if armorM1L7 == 1 then
set1 = (set1 + 0x40)
end
if armorM1L8 == 1 then
set1 = (set1 + 0x80)
end
if armorM1L9 == 1 then
set1 = (set1 + 0x100)
end
if armorM1L10 == 1 then
set1 = (set1 + 0x200)
end
if armorM1L11 == 1 then
set1 = (set1 + 0x400)
end
if armorM1L12 == 1 then
set1 = (set1 + 0x800)
end
-- make 31~40 MENU
set2 = 0x0
if armorM2L1 == 1 then
set2 = (set2 + 0x001)
end
if armorM2L2 == 1 then
set2 = (set2 + 0x002)
end
if armorM2L3 == 1 then
set2 = (set2 + 0x004)
end
if armorM2L4 == 1 then
set2 = (set2 + 0x008)
end
if armorM2L5 == 1 then
set2 = (set2 + 0x010)
end
if armorM2L6 == 1 then
set2 = (set2 + 0x020)
end
if armorM2L7 == 1 then
set2 = (set2 + 0x040)
end
if armorM2L8 == 1 then
set2 = (set2 + 0x080)
end
if armorM2L9 == 1 then
set2 = (set2 + 0x100)
end
if armorM2L10 == 1 then
set2 = (set2 + 0x200)
end
if armorM2L11 == 1 then
set2 = (set2 + 0x400)
end
if armorM2L12 == 1 then
set2 = (set2 + 0x800)
end
if armorM2L13 == 1 then
set2 = (set2 + 0x1000)
end
if armorM2L14 == 1 then
set2 = (set2 + 0x2000)
end
if armorM2L15 == 1 then
set2 = (set2 + 0x4000)
end
if armorM2L16 == 1 then
set2 = (set2 + 0x8000)
end
if armorM2L17 == 1 then
set2 = (set2 + 0x10000)
end
if armorM2L18 == 1 then
set2 = (set2 + 0x20000)
end
-- make 41~50 MENU
set3 = 0x0
if armorM3L1 == 1 then
set3 = (set3 + 0x001)
end
if armorM3L2 == 1 then
set3 = (set3 + 0x002)
end
if armorM3L3 == 1 then
set3 = (set3 + 0x004)
end
if armorM3L4 == 1 then
set3 = (set3 + 0x008)
end
if armorM3L5 == 1 then
set3 = (set3 + 0x010)
end
if armorM3L6 == 1 then
set3 = (set3 + 0x020)
end
if armorM3L7 == 1 then
set3 = (set3 + 0x040)
end
if armorM3L8 == 1 then
set3 = (set3 + 0x080)
end
if armorM3L9 == 1 then
set3 = (set3 + 0x100)
end
if armorM3L10 == 1 then
set3 = (set3 + 0x200)
end
if armorM3L11 == 1 then
set3 = (set3 + 0x400)
end
if armorM3L12 == 1 then
set3 = (set3 + 0x800)
end
if armorM3L13 == 1 then
set3 = (set3 + 0x1000)
end
if armorM3L14 == 1 then
set3 = (set3 + 0x2000)
end
-- make AF and high level MENU
set4 = 0x0
if armorM4L1 == 1 then
set4 = (set4 + 0x001)
end
if armorM4L2 == 1 then
set4 = (set4 + 0x002)
end
if armorM4L3 == 1 then
set4 = (set4 + 0x004)
end
if armorM4L4 == 1 then
set4 = (set4 + 0x008)
end
if armorM4L5 == 1 then
set4 = (set4 + 0x010)
end
if armorM4L6 == 1 then
set4 = (set4 + 0x020)
end
if armorM4L7 == 1 then
set4 = (set4 + 0x040)
end
if armorM4L8 == 1 then
set4 = (set4 + 0x080)
end
if armorM4L9 == 1 then
set4 = (set4 + 0x100)
end
if armorM4L10 == 1 then
set4 = (set4 + 0x200)
end
if armorM4L11 == 1 then
set4 = (set4 + 0x400)
end
if armorM4L12 == 1 then
set4 = (set4 + 0x800)
end
if armorM4L13 == 1 then
set4 = (set4 + 0x1000)
end
if armorM4L14 == 1 then
set4 = (set4 + 0x2000)
end
if armorM4L15 == 1 then
set4 = (set4 + 0x4000)
end
if armorM4L16 == 1 then
set4 = (set4 + 0x8000)
end
if armorM4L17 == 1 then
set4 = (set4 + 0x10000)
end
if armorM4L18 == 1 then
set4 = (set4 + 0x20000)
end
if armorM4L19 == 1 then
set4 = (set4 + 0x40000)
end
if armorM4L20 == 1 then
set4 = (set4 + 0x80000)
end
if armorM4L21 == 1 then
set4 = (set4 + 0x100000)
end
if armorM4L22 == 1 then
set4 = (set4 + 0x200000)
end
if armorM4L23 == 1 then
set4 = (set4 + 0x400000)
end
if armorM4L24 == 1 then
set4 = (set4 + 0x800000)
end
-- make Relic MENU
-- items 1-4
set5 = 0x0
if armorM5L1 == 1 then
set5 = (set5 + 0x001)
end
if armorM5L2 == 1 then
set5 = (set5 + 0x002)
end
if armorM5L3 == 1 then
set5 = (set5 + 0x004)
end
if armorM5L4 == 1 then
set5 = (set5 + 0x008)
end
if armorM5L5 == 1 then
set5 = (set5 + 0x010)
end
if armorM5L6 == 1 then
set5 = (set5 + 0x020)
end
if armorM5L7 == 1 then
set5 = (set5 + 0x040)
end
if armorM5L8 == 1 then
set5 = (set5 + 0x080)
end
if armorM5L9 == 1 then
set5 = (set5 + 0x100)
end
if armorM5L10 == 1 then
set5 = (set5 + 0x200)
end
if armorM5L11 == 1 then
set5 = (set5 + 0x400)
end
if armorM5L12 == 1 then
set5 = (set5 + 0x800)
end
if armorM5L13 == 1 then
set5 = (set5 + 0x1000)
end
if armorM5L14 == 1 then
set5 = (set5 + 0x2000)
end
if armorM5L15 == 1 then
set5 = (set5 + 0x4000)
end
if armorM5L16 == 1 then
set5 = (set5 + 0x8000)
end
if armorM5L17 == 1 then
set5 = (set5 + 0x10000)
end
if armorM5L18 == 1 then
set5 = (set5 + 0x20000)
end
if armorM5L19 == 1 then
set5 = (set5 + 0x40000)
end
if armorM5L20 == 1 then
set5 = (set5 + 0x80000)
end

set[1] = set1
set[2] = set2
set[3] = set3
set[4] = set4
set[5] = set5

   return (set)
end

function getSetInfo(option) -- View Storable sets or remove set from storage sendMore information
   
-- Gil values used in this script
-- 0x12c = 300 decimal
-- 0x258 = 600 decimal
-- 0x320 = 800 decimal
-- 0x3e8 = 1000 decimal
-- 0x7d0 = 2000 decimal

-- 24~30
if option == 16 then
armor = { 0x780,0x3088,0x3108,0x3188,0x3208,0x3288,0x12c }
end
if option == 17 then
armor = { 0x781,0x37f7,0x385a,0x3a0a,0x3b3d,0x3bd3,0x12c }
end
if option == 18 then
armor = { 0x782,0x3291,0x3211,0x3191,0x3111,0x3091,0x12c }
end
if option == 19 then
armor = { 0x783,0x30ba,0x313a,0x31ba,0x323a,0x32ba,0x12c }
end
if option == 20 then
armor = { 0x784,0x37f9,0x385f,0x3a0c,0x3b3f,0x3bd5,0x12c }
end
if option == 21 then
armor = { 0x785,0x30aa,0x312a,0x31aa,0x322a,0x32aa,0x12c }
end
if option == 22 then
armor = { 0x786,0x3858,0x3a08,0x3b3b,0x3bd1,0x37f5,0x12c }
end
if option == 23 then
armor = { 0x787,0x309a,0x311a,0x319a,0x321a,0x329a,0x12c }
end
if option == 24 then
armor = { 0x788,0x3096,0x3116,0x3196,0x3216,0x3296,0x12c }
end
if option == 25 then
armor = { 0x789,0x30b6,0x3136,0x31b6,0x3236,0x32b6,0x12c }
end
if option == 26 then
armor = { 0x78a,0x37f6,0x3859,0x3a09,0x3b3c,0x3bd2,0x12c }
end
if option == 27 then
armor = { 0x78b,0x3bcf,0x37f3,0x3856,0x3a06,0x3b39,0x12c }
end

-- 31~40
if option == 28 then
armor = { 0x78c,0x316e,0x31d9,0x3247,0x32d7,0x0,0x258 }
end
if option == 29 then
armor = { 0x78d,0x316f,0x31da,0x3248,0x32d8,0x0,0x258 }
end
if option == 30 then
armor = { 0x78e,0x3170,0x31db,0x3249,0x32d9,0x0,0x258 }
end
if option == 31 then
armor = { 0x78f,0x3171,0x31dc,0x324a,0x32da,0x0,0x258 }
end
if option == 32 then
armor = { 0x790,0x3172,0x31dd,0x324b,0x32db,0x0,0x258 }
end
if option == 33 then
armor = { 0x791,0x3173,0x31de,0x324c,0x32dc,0x0,0x258 }
end
if option == 34 then
armor = { 0x792,0x3174,0x31df,0x324d,0x32dd,0x0,0x258 }
end
if option == 35 then
armor = { 0x793,0x30a2,0x3122,0x31a2,0x3224,0x32a2,0x258 }
end
if option == 36 then
armor = { 0x794,0x3142,0x31c2,0x3242,0x32c2,0x0,0x258 }
end
if option == 37 then
armor = { 0x795,0x3089,0x3109,0x3189,0x3209,0x3289,0x258 }
end
if option == 38 then
armor = { 0x796,0x30b2,0x3132,0x31b2,0x3232,0x32b2,0x258 }
end
if option == 39 then
armor = { 0x797,0x362f,0x35d7,0x36b1,0x37a3,0x3726,0x258 }
end
if option == 40 then
armor = { 0x798,0x309b,0x311b,0x319b,0x321b,0x329b,0x258 }
end
if option == 41 then
armor = { 0x799,0x30bb,0x313b,0x31bb,0x323b,0x32bb,0x258 }
end
if option == 42 then
armor = { 0x79a,0x366b,0x3830,0x37a9,0x3724,0x0,0x258 }
end
if option == 43 then
armor = { 0x79b,0x308f,0x310f,0x318f,0x320f,0x328f,0x258 }
end
if option == 44 then
armor = { 0x79c,0x3080,0x3100,0x3180,0x3200,0x3280,0x258 }
end
if option == 45 then
armor = { 0x79d,0x3146,0x31c7,0x3246,0x32c6,0x0,0x258 }
end

-- 41~50
if option == 46 then
armor = { 0x79e,0x3b65,0x386C,0x36e3,0x3c2a,0x3bed,0x320 }
end
if option == 47 then
armor = { 0x79f,0x358f,0x3590,0x3591,0x3225,0x3593,0x320 }
end
if option == 48 then
armor = { 0x7a0,0x308a,0x310a,0x318a,0x320a,0x328a,0x320 }
end
if option == 49 then
armor = { 0x7a1,0x30ab,0x312b,0x31ab,0x322b,0x32ae,0x320 }
end
if option == 50 then
armor = { 0x7a2,0x309c,0x311c,0x319c,0x321c,0x329c,0x320 }
end
if option == 51 then
armor = { 0x7a3,0x3631,0x35d9,0x36b3,0x3728,0x37a5,0x320 }
end
if option == 52 then
armor = { 0x7a4,0x30b3,0x3133,0x31b3,0x3233,0x32b3,0x320 }
end
if option == 53 then
armor = { 0x7a5,0x30ac,0x312c,0x31ac,0x322c,0x32ac,0x320 }
end
if option == 58 then
armor = { 0x7aa,0x3081,0x3101,0x3181,0x3201,0x3281,0x320 }
end
if option == 54 then
armor = { 0x7a6,0x3086,0x3106,0x3186,0x3206,0x3286,0x320 }
end
if option == 55 then
armor = { 0x7a7,0x30be,0x313e,0x31be,0x323e,0x32be,0x320 }
end
if option == 56 then
armor = { 0x7a8,0x3143,0x31c3,0x3243,0x32c3,0x0,0x320 }
end
if option == 57 then
armor = { 0x7a9,0x3673,0x35f6,0x39ea,0x37e6,0x376d,0x320 }
end
if option == 59 then
armor = { 0x7ab,0x3b8a,0x38a2,0x3a3b,0x3cda,0x3d2f,0x320 }
end

-- AF and High Level items
if option == 1 then
armor = { 0x28e,0x3786,0x3709,0x3689,0x315e,0x30df,0x3e8 }
end
if option == 2 then
armor = { 0x28f,0x3787,0x370a,0x368a,0x315f,0x30e0,0x3e8 }
end
if option == 3 then
armor = { 0x290,0x3788,0x370b,0x368b,0x3160,0x361f,0x3e8 }
end
if option == 4 then
armor = { 0x291,0x3789,0x370c,0x368c,0x3161,0x3620,0x3e8 }
end
if option == 5 then
armor = { 0x292,0x378a,0x370d,0x368d,0x3162,0x30e1,0x3e8 }
end
if option == 6 then
armor = { 0x293,0x378b,0x370e,0x368e,0x3163,0x30e2,0x3e8 }
end
if option == 7 then
armor = { 0x294,0x378c,0x370f,0x368f,0x3164,0x30e3,0x3e8 }
end
if option == 8 then
armor = { 0x295,0x378d,0x3710,0x3690,0x3165,0x30e4,0x3e8 }
end
if option == 9 then
armor = { 0x296,0x378e,0x3711,0x3691,0x3166,0x30e5,0x3e8 }
end
if option == 10 then
armor = { 0x297,0x378f,0x3712,0x3692,0x3167,0x3621,0x3e8 }
end
if option == 11 then
armor = { 0x298,0x3790,0x3713,0x3693,0x3168,0x30e6,0x3e8 }
end
if option == 12 then
armor = { 0x299,0x3791,0x3714,0x3694,0x35d5,0x362c,0x3e8 }
end
if option == 13 then
armor = { 0x29a,0x3792,0x3715,0x3695,0x35d6,0x362d,0x3e8 }
end
if option == 14 then
armor = { 0x29b,0x3793,0x3716,0x3696,0x3169,0x30e7,0x3e8 }
end
if option == 15 then
armor = { 0x29c,0x3794,0x3717,0x3697,0x316a,0x30e8,0x3e8 }
end
if option == 60 then
armor = { 0x7ac,0x38b9,0x3a50,0x3ba1,0x3cf0,0x3d44,0x3e8 }
end
if option == 61 then
armor = { 0x7ad,0x38ba,0x3a51,0x3ba2,0x3cf1,0x3d45,0x3e8 }
end
if option == 62 then
armor = { 0x7ae,0x38bb,0x3a52,0x3ba3,0x3cf2,0x3d46,0x3e8 }
end
if option == 78 then
armor = { 0x7af,0x38f2,0x3a9a,0x3d2b,0x3d82,0x3f0a,0x3e8 }
end
if option == 79 then
armor = { 0x7b0,0x38f3,0x3a9b,0x3d2c,0x3d83,0x3f0b,0x3e8 }
end
if option == 80 then
armor = { 0x7b1,0x38f4,0x3a9c,0x3d84,0x3f0c,0x3fb7,0x3e8 }

end
if option == 81 then
armor = { 0x7b2,0x38c2,0x3a5c,0x3cf9,0x3d4f,0x3ec5,0x3e8 }

end
if option == 82 then
armor = { 0x7b3,0x38c2,0x3a5c,0x3cf9,0x3d4f,0x3ec5,0x3e8 }
end
if option == 83 then
armor = { 0x7b4,0x38bf,0x3a57,0x3cf6,0x3d4a,0x3ec0,0x3e8 }
end

-- Relic
if option == 63 then
armor = { 0x35d,0x3ae0,0x3aef,0x3afe,0x3b0d,0x3b1c,0x7d0 }
end
if option == 64 then
armor = { 0x35e,0x3ae1,0x3af0,0x3aff,0x3b0e,0x3b1d,0x7d0 }
end
if option == 65 then
armor = { 0x35f,0x3ae2,0x3af1,0x3b00,0x3b0f,0x3b1e,0x7d0 }
end
if option == 66 then
armor = { 0x360,0x3ae3,0x3af2,0x3b01,0x3b10,0x3b1f,0x7d0 }
end
if option == 67 then
armor = { 0x361,0x3ae4,0x3af3,0x3b02,0x3b11,0x3b20,0x7d0 }
end
if option == 68 then
armor = { 0x362,0x3ae5,0x3af4,0x3b03,0x3b12,0x3b21,0x7d0 }
end
if option == 69 then
armor = { 0x363,0x3ae6,0x3af5,0x3b04,0x3b13,0x3b22,0x7d0 }
end
if option == 70 then
armor = { 0x364,0x3ae7,0x3af6,0x3b05,0x3b14,0x3b23,0x7d0 }
end
if option == 71 then
armor = { 0x365,0x3ae8,0x3af7,0x3b06,0x3b15,0x3b24,0x7d0 }
end
if option == 72 then
armor = { 0x366,0x3ae9,0x3af8,0x3b07,0x3b16,0x3b25,0x7d0 }
end
if option == 73 then
armor = { 0x367,0x3aea,0x3af9,0x3b08,0x3b17,0x3b26,0x7d0 }
end
if option == 74 then
armor = { 0x368,0x3aeb,0x3afa,0x3b09,0x3b18,0x3b27,0x7d0 }
end
if option == 75 then
armor = { 0x369,0x3aec,0x3afb,0x3b0a,0x3b19,0x3b28,0x7d0 }
end
if option == 76 then
armor = { 0x36a,0x3aed,0x3afc,0x3b0b,0x3b1a,0x3b29,0x7d0 }
end
if option == 77 then
armor = { 0x36b,0x3aee,0x3afd,0x3b0c,0x3b1b,0x3b2a,0x7d0 }
end
if option == 84 then
armor = { 0x41e,0x2c1c,0x2c76,0x2cc9,0x3ab1,0x3fda,0x7d0 }
end
if option == 85 then
armor = { 0x41f,0x2c1f,0x2c79,0x2ccc,0x3ab4,0x3fdd,0x7d0 }
end
if option == 86 then
armor = { 0x420,0x2c22,0x2c7c,0x2ccf,0x3ab7,0x3fe0,0x7d0 }
end
if option == 87 then
armor = { 0x421,0x2c29,0x2c84,0x2cd6,0x3abe,0x3fe8,0x7d0 }
end
if option == 88 then
armor = { 0x422,0x2c2b,0x2c86,0x2cd8,0x3ac0,0x3fea,0x7d0 }
end

--print(armor[2])
--print(armor[3])
--print(armor[4])
--print(armor[5])
--print(armor[6])
--print(armor[7])
   
   return (armor)
end