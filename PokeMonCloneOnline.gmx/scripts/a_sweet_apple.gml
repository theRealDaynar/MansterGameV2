///a_sweet_apple()
//display info
var a_power = 6
var a_stam = 6
if argument_count
{
    
    switch(argument[0])
    {
        //return name
        case 1:
            return "Sweet Apple"
        //return targeting info
        case 2:
            var info = ds_map_create();
            //number of targets to select
            info[? "n"] = 1
            //type that can be targeted (a = all, e = enemies, t = teammates)
            info[? "t"] = "t"
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

    //var tags = ds_list_create()
    //ds_list_add(tags,"normal","str","projectile")
    //deal_damage(targets[|0],str * a_power,tags)
    heal_health(targets[|0], a_power * pow)
}

