/*
 * ******************************************************************************************
 * File		: initfini.c
 * Author	: GowinSemicoductor
 * Chip		: AE350_SOC
 * Function	: Initialized and finished
 * ******************************************************************************************
 */

// Includes ---------------------------------------------------------------------------------
#include <sys/types.h>


// Definitions ------------------------------------------------------------------------------

#define USE_LIBC_INITFINI		1

#if USE_LIBC_INITFINI

/*
 * The _init() and _fini() will be called respectively when use __libc_init_array()
 * and __libc_fnit_array() in libc.a to perform constructor and destructor handling.
 * The dummy versions of these functions should be provided.
 */
void _init(void)
{
}

void _fini(void)
{
}

#else

/* These magic symbols are provided by the linker.  */
extern void (*__preinit_array_start []) (void) __attribute__((weak));
extern void (*__preinit_array_end []) (void) __attribute__((weak));
extern void (*__init_array_start []) (void) __attribute__((weak));
extern void (*__init_array_end []) (void) __attribute__((weak));

/*
 * The __libc_init_array()/__libc_fnit_array() function is used to do global
 * constructor/destructor and can NOT be compiled to generate the code coverage
 * data. We have the function attribute to be 'no_profile_instrument_function'
 * to prevent been instrumented for coverage analysis when GCOV=1 is applied.
 */
/* Iterate over all the initial routines.  */
void __libc_init_array (void) __attribute__((no_profile_instrument_function));
void __libc_init_array (void)
{
	size_t count;
	size_t i;

	count = __preinit_array_end - __preinit_array_start;
	for (i = 0; i < count; i++)
	{
		__preinit_array_start[i] ();
	}

	count = __init_array_end - __init_array_start;
	for (i = 0; i < count; i++)
	{
		__init_array_start[i] ();
	}
}

extern void (*__fini_array_start []) (void) __attribute__((weak));
extern void (*__fini_array_end []) (void) __attribute__((weak));

/* Run all the cleanup routines.  */
void __libc_fini_array (void) __attribute__((no_profile_instrument_function));
void __libc_fini_array (void)
{
	size_t count;
	size_t i;

	count = __fini_array_end - __fini_array_start;
	for (i = count; i > 0; i--)
	{
		__fini_array_start[i-1] ();
	}
}


#endif	// USE_LIBC_INITFINI
