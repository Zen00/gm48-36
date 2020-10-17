/// @description DEBGUG

//Add a discount
ds_list_add(global.GENERATOR_DISCOUNTS[| GENERATORS.sticks], 0.75);
with(par_generator) { update_purchase_price(); }
