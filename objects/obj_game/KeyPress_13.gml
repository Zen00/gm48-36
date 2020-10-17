/// @description DEBUG

ds_list_add(global.GENERATOR_MULTIPLIERS[| GENERATORS.sticks], 1.25);
with(par_generator) { update_production(); }
