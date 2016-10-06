#define perlin
///perlin(x,y,z,p)
var xx = argument0
var yy = argument1
var zz = argument2
var p = argument3

var xi = xx & 255
var yi = yy & 255
var zi = zz & 255
var xf = xx - round(xx)
var yf = yy - round(yy)
var zf = zz - round(zz)

var u = fade(xf)
var v = fade(yf)
var w = fade(zf)

var aaa, aba, aab, abb, baa, bba, bab, bbb;
aaa = p[|p[|p[|    xi ]+    yi ]+    zi ];
aba = p[|p[|p[|    xi ]+inc(yi)]+    zi ];
aab = p[|p[|p[|    xi ]+    yi ]+inc(zi)];
abb = p[|p[|p[|    xi ]+inc(yi)]+inc(zi)];
baa = p[|p[|p[|inc(xi)]+    yi ]+    zi ];
bba = p[|p[|p[|inc(xi)]+inc(yi)]+    zi ];
bab = p[|p[|p[|inc(xi)]+    yi ]+inc(zi)];
bbb = p[|p[|p[|inc(xi)]+inc(yi)]+inc(zi)];

    var x1, x2, y1, y2;
    x1 = lerp(    grad (aaa, xf  , yf  , zf),           // The gradient function calculates the dot product between a pseudorandom
                grad (baa, xf-1, yf  , zf),             // gradient vector and the vector from the input coordinate to the 8
                u);                                     // surrounding points in its unit cube.
    x2 = lerp(    grad (aba, xf  , yf-1, zf),           // This is all then lerped together as a sort of weighted average based on the faded (u,v,w)
                grad (bba, xf-1, yf-1, zf),             // values we made earlier.
                  u);
    y1 = lerp(x1, x2, v);

    x1 = lerp(    grad (aab, xf  , yf  , zf-1),
                grad (bab, xf-1, yf  , zf-1),
                u);
    x2 = lerp(    grad (abb, xf  , yf-1, zf-1),
                  grad (bbb, xf-1, yf-1, zf-1),
                  u);
    y2 = lerp (x1, x2, v);
    
    return (lerp (y1, y2, w)+1)/2;     

#define fade
///fade(t)
return argument0 * argument0 * argument0 * (argument0 * (argument0 * 6 - 15) + 10);


#define inc
///inc(num)
//if (repeat > 0) num %= repeat;    
return (++argument0);


#define grad
///grad(hash,x,y,z)
/*var h = argument0 & 15;// Take the hashed value and take the first 4 bits of it (15 == 0b1111)
if h < 8
var u = argument1;// If the most significant bit (MSB) of the hash is 0 then set u = x.  Otherwise y.
else
var u = argument2
var v;// In Ken Perlin's original implementation this was another conditional operator (?:).  I
// expanded it for readability.

if(h < 4 /* 0b0100 *///)// If the first and second significant bits are 0 set v = y
/*v = argument2;
else if(h == 12 /* 0b1100 */ //|| h == 14 /* 0b1110*/)// If the first and second significant bits are 1 set v = x
/*v = argument1;
else // If the first and second significant bits are not equal (0/1, 1/0) set v = z
v = argument3
var grd = 0
if (h&1) == 0
    grd = u
else
    grd = -u
if (h&2) == 0
    grd += v
else
    grd -= v
return grd; // Use the last 2 bits to decide if u and v are positive or negative.  Then return their addition.
*/

    switch(argument0 & $F)
    {
        case $0: return  argument1 + argument2;
        case $1: return -argument1 + argument2;
        case $2: return  argument1 - argument2;
        case $3: return -argument1 - argument2;
        case $4: return  argument1 + argument3;
        case $5: return -argument1 + argument3;
        case $6: return  argument1 - argument3;
        case $7: return -argument1 - argument3;
        case $8: return  argument2 + argument3;
        case $9: return -argument2 + argument3;
        case $A: return  argument2 - argument3;
        case $B: return -argument2 - argument3;
        case $C: return  argument2 + argument1;
        case $D: return -argument2 + argument3;
        case $E: return  argument2 - argument1;
        case $F: return -argument2 - argument3;
        default: return 0; // never happens
    }

#define get_p
///Perlin()

var permutation= ds_list_create()
repeat(256)
ds_list_add(permutation,random(255))
/*ds_list_add(permutation,151,160,137,91,90,15)// Hash lookup table as defined by Ken Perlin.  This is a randomly
ds_list_add(permutation,131,13,201,95,96,53,194,233,7,225,140,36,103,30,69,142,8,99,37,240,21,10,23)// arranged array of all numbers from 0-255 inclusive.
ds_list_add(permutation,190, 6,148,247,120,234,75,0,26,197,62,94,252,219,203,117,35,11,32,57,177,33)
ds_list_add(permutation,88,237,149,56,87,174,20,125,136,171,168, 68,175,74,165,71,134,139,48,27,166)
ds_list_add(permutation,77,146,158,231,83,111,229,122,60,211,133,230,220,105,92,41,55,46,245,40,244)
ds_list_add(permutation,102,143,54, 65,25,63,161, 1,216,80,73,209,76,132,187,208, 89,18,169,200,196)
ds_list_add(permutation,135,130,116,188,159,86,164,100,109,198,173,186, 3,64,52,217,226,250,124,123)
ds_list_add(permutation,5,202,38,147,118,126,255,82,85,212,207,206,59,227,47,16,58,17,182,189,28,42)
ds_list_add(permutation,223,183,170,213,119,248,152, 2,44,154,163, 70,221,153,101,155,167, 43,172,9)
ds_list_add(permutation,129,22,39,253, 19,98,108,110,79,113,224,232,178,185, 112,104,218,246,97,228)
ds_list_add(permutation,251,34,242,193,238,210,144,12,191,179,162,241, 81,51,145,235,249,14,239,107)
ds_list_add(permutation,49,192,214, 31,181,199,106,157,184, 84,204,176,115,121,50,45,127, 4,150,254)
ds_list_add(permutation,138,236,205,93,222,114,67,29,24,72,243,141,128,195,78,66,215,61,156,180)
*/

var p = ds_list_create();
for(var i=0;i<512;i++) {
ds_list_add(p,permutation[|i%256])
}
ds_list_destroy(permutation)
return p

#define octave_perlin
///octave_perlin(x,y,z,octaves,persistence,p)
var total = 0
var frequency = .5
var amplitude = 2
var maxValue = 0;
for(var i = 0; i < argument3; i++)
{
    total += perlin(argument0 * frequency, argument1 * frequency, argument2 * frequency,argument5) * amplitude
    maxValue += amplitude
    amplitude *= argument4
    frequency *= 2
}
return total/maxValue


#define distance_squared
///distance_squared(dx,dy,area_size)
var dx = (2 * (argument0 - argument2/2) / (argument2 - 1))
var dy = (2 * (argument1 - argument2/2) / (argument2 - 1))

return dx*dx + dy*dy