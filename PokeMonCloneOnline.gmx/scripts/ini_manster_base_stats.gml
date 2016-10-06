///ini_manster_base_stats(manster id)
switch(argument0)
{
case -1: //dummy
sprite_index = sDummyManster
max_hp = 100
hp = max_hp
max_stam = 100
stam = max_stam
endurance = 3
spd = 5
str = 5
def = 5
pow = 5
res = 5
ds_list_add(ability,slap,slap,slap,slap)
break;
case 0:
name = "Gluffle"
sprite_index = glufflespr
max_hp = 305
hp = max_hp
max_stam = 26
stam = max_stam
endurance = 5
spd = 144
str = 124
def = 195
pow = 162
res = 182
eri[? "heat"] = 1.25
eri[? "electric"] = 1.25
eri[? "bio"] = .8
ds_list_add(ability,a_secrete,a_curl_up,a_scream,a_ooze_spit)
break;
case 1:
name = "Swinkey"
sprite_index = swinkeyspr
max_hp = 280
hp = max_hp
max_stam = 30
stam = max_stam
endurance = 4
spd = 160
str = 165
def = 235
pow = 200
res = 226
eri[? "nature"] = .8
eri[? "heat"] = 1.25
eri[? "dark"] = 1.3
eri[? "light"] = .7
eri[? "bio"] = 1.1
ds_list_add(ability,a_hard_throw,a_exploding_apple,a_crab_apple,a_sweet_apple)
break;
}

