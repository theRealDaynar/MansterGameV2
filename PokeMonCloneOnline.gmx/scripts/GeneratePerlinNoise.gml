#define GeneratePerlinNoise
///GeneratePerlinNoise(noise,octave)
var w = ds_grid_width(argument0)
var h = ds_grid_height(argument0)

var n = ds_list_create()

var persistance = .5

for(var i = 0; i < argument1; ++i)
    ds_list_add(n,GenerateSmoothNoise(argument0,i))

var pn = ds_grid_create(w,h)
var amplitude = 1
var totalAmplitude = 0

for(var i = argument1 - 1; i >= 0; --i)
{
    amplitude *= persistance
    totalAmplitude += amplitude
    for(var yy = 0; yy < h; ++yy)
    for(var xx = 0; xx < w; ++xx)
        pn[#xx,yy] += ds_grid_get(n[|i],xx,yy) * amplitude

}
for(var yy = 0; yy < h; ++yy)
for(var xx = 0; xx < w; ++xx)
    pn[#xx,yy] /= totalAmplitude

ds_grid_destroy(argument0)
while(!ds_list_empty(n))
{
    ds_grid_destroy(n[|0])
    ds_list_delete(n,0)
}
ds_list_destroy(n)

return pn


#define GenerateSmoothNoise
///GenerateSmoothNoise(noise, octave)
var w = ds_grid_width(argument0)
var h = ds_grid_height(argument0)

var n = ds_grid_create(w,h)

var period = 1 << argument1
var frequency = 1/period

for(var i = 0; i < w; ++i)
{
    var sample_i0 = floor((i div period) * period)
    var sample_i1 = (sample_i0 + period) % w
    var h_bend = (i - sample_i0) * frequency
    
    for(var j = 0; j < h; ++j)
    {
        var sample_j0 = floor((j div period) * period)
        var sample_j1 = (sample_i0 + period) % h
        var v_bend = (j - sample_j0) * frequency
    
        var top = Interpoliate(argument0[#sample_i0,sample_j0],argument0[#sample_i1,sample_j0],(h_bend))
        var bottom = Interpoliate(argument0[#sample_i0,sample_j1],argument0[#sample_i1,sample_j1],(h_bend));
        
        n[#i,j] = Interpoliate(top,bottom,(v_bend))
    }
}
return n

#define GenerateWhiteNoise
///GenerateWhiteNoise(width,height)
var n = ds_grid_create(argument0,argument1)
for(var yy = 0; yy < argument0; ++yy)
for(var xx = 0; xx < argument0; ++xx)
    n[#xx,yy] = random(1)
return n
#define Interpoliate
///Interpoliate(x,y,alpha)
return argument0 * (1 - argument2) + argument2 * argument1;