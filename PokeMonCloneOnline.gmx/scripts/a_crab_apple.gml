///a_crab_apple()
//display info
if argument_count
{
    
    switch(argument[0])
    {
        //return name
        case 1:
            return "Crab Apple"
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
    with(targets[|0])
    {
        stam += max_stam / 3
        if stam > max_stam
            stam = max_stam
    }
}

