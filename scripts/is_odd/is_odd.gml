///@func is_odd(int)
///@desc Tells if an integer is even or odd
///@arg int
function is_odd(argument0) {

	/*
	Is 2 odd?
	  0010 | 2
	& 0001 | 1
	  ----
	  0000 | false
	*/

	return round(argument0) & 1;



}
