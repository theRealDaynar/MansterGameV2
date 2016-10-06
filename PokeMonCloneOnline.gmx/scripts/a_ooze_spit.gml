///a_ooze_spit()
//display info
var a_power = 7
var a_stam = 4
if argument_count
{
    
    switch(argument[0])
    {
        //return name
        case 1:
            return "Ooze Spit"
        //return targeting info
        case 2:
            var info = ds_map_create();
            //number of targets to select
            info[? "n"] = 1
            //type that can be targeted (a = all, e = enemies, t = teammates)
            info[? "t"] = "e"
            return info
        //priority
        case 3:
            return 1
    }

}
//execute ability
else
{

    stam -= a_stam

    var tags = ds_list_create()
    ds_list_add(tags,"bio","pow","projectile")
    deal_damage(targets[|0],pow * a_power * lvl_mod,tags)
    with(targets[|0])
    {
        if ds_map_exists(buffs,"ooze slow")
            buffs[? "ooze slow"]++
        else
            buffs[? "ooze slow"] = 1
        ++spd_d
    }
}

