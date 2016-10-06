#define simplex_noise
///simplex_noise()


#define init_simplex_noise
///init_simplex_noise()
var simplex = ds_map_create();
var divi = 8;
simplex[? "divisions"] = divi; //Number of gradients to generate
var grads = ds_list_create();
simplex[? "grads"] = ds_grid_create(divi,2)

//Gradient calculations. For 2D, the gradients are just a set of 2D vectors distributed evenly around a unit circle.
for(var i=0;i<divi;i++)
{
    grads[#i,0]=cos(2*pi * i/divi);
    grads[#i,1]=sin(2*pi * i/divi);
}

set_simplex_seed(random_get_seed()); //Precalculate hash using existing random seed

//Precalculate skewing and unskewing factors for transforming 2D input space into 2D simplex space and vice versa
simplex[? "f2"] =.5*(sqrt(3)-1);
simplex[? "g2"] =(3-sqrt(3))/6;


#define set_simplex_seed
//Arguments:
//0: Random seed

var oldSeed=random_get_seed(); //Save the old random seed

random_set_seed(argument0);
for(var i=0;i<256;i++)
    global.__perm[i]=irandom_range(0,255); //Generate a list of random values
    
for(var i=0;i<512;i++)
    {
        global.__perm[i]=global.__perm[i & 255]; //To simplify later calculations, repeat the list twice.
        global.__permMod[i]=global.__perm[i] % global.__divisions; //Precalculate perm modulo divisions to simplify calculations.
    }   

random_set_seed(oldSeed); //Restore the old random seed