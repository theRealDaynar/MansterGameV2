///a_curl_up()
//display info
var a_stam = 4
if argument_count
{
    
    switch(argument[0])
    {
        //return name
        case 1:
            return "Curl Up"
        //return targeting info
        case 2:
            var info = ds_map_create();
            //number of targets to select
            info[? "n"] = 0
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
    stam -= a_stam;
    ++def_n;
}

