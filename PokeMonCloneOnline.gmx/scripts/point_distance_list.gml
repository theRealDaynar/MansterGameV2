///point_distance_list(x,y,lx,ly)
var size = ds_list_size(argument2)
var dist = 99999999
for(var i = 0; i < size; ++i)
{
    var tdist = point_distance(argument0,argument1,argument2[|i],argument3[|i])
    if tdist < dist
        dist = tdist
}
return dist

