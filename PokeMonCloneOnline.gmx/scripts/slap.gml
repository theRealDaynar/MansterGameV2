///slap()
//display info
if argument_count
{
    
    switch(argument[0])
    {
        //return name
        case 1:
            return "Slap"
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

    stam -= 5

    var tags = ds_list_create()
    ds_list_add(tags,"str","normal")
    deal_damage(targets[|0],str * 1.3 * lvl_mod,tags)
}

