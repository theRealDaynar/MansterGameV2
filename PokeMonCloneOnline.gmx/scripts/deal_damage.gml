///deal_damage(manster,attack power, tags)
var dmg = argument1
var tags = argument2

with(argument0)
{
    //ensure tags list exists to prevent crashing
    if !ds_exists(tags,ds_type_list) tags = ds_list_create()
    
    //apply defence 
    if ds_list_find_index(tags,"str") != -1
        dmg /= (def * def_n / def_d)
    else if ds_list_find_index(tags,"pow") != -1
        dmg /= (res * res_n / res_d)
    
    //apply elemental resistance
    var s = ds_list_size(tags)
    for(var i = 0; i < s; ++i)
        if ds_map_exists(eri,tags[|i])
            dmg *= eri[? tags[|i]]
        
    hp -= dmg
    if hp <= 0
    {
        dead = true
        var pos = ds_list_find_index(oBattleController.execution_list,id)
        if pos >= 0
            ds_list_delete(oBattleController.execution_list,pos)
    }
}
ds_list_destroy(tags)

