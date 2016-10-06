///a_scream()
//display info
var a_power = 3
var a_stam = 5
if argument_count
{
    
    switch(argument[0])
    {
        //return name
        case 1:
            return "Scream"
        //return targeting info
        case 2:
            var info = ds_map_create();
            //number of targets to select
            info[? "n"] = 0
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
    ds_list_add(tags,"normal","pow")
    with(oBattleManster)
        if !dead and team != other.team
            with(other)
            {
                var tags2 = ds_list_create()
                ds_list_copy(tags2,tags)
                deal_damage(other.id,pow * a_power * lvl_mod,tags2)
            }
    ds_list_destroy(tags)
}

