#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Math::XOR		PACKAGE = Math::XOR

PROTOTYPES: ENABLE

SV *
xor_buf(sv1, sv2)
	SV *sv1;
	SV *sv2;
	CODE:
		STRLEN size;
		int isize, irem;
		long i;
		SV *ret;
		char *scalar1, *scalar2, *scalar3;
		int *int1, *int2, *int3;
		size = SvCUR(sv1);		/* length of string $_[0] */
		isize = size / 4;
		irem = size % 4;
		if(SvCUR(sv2) < size)
		{
			warn("XOR::xor() error: string 2 is shorter than string 1 (%i < %i)\n", SvCUR(sv2), size);
			RETVAL = NULL;
		}
		else
		{
			scalar1 = SvPVX(sv1);			/* obtain physical memory addresses of scalars */
			scalar2 = SvPVX(sv2);
			int1 = (int *)scalar1;
			int2 = (int *)scalar2;
			ret = NEWSV(42, size + 1);		/* create a new $calar */
			SvPOK_on(ret);					/* make it a string (as opposed to a reference) */
			scalar3 = SvPVX(ret);			/* obtain it's physical memory address */
			scalar3[size]=0;				/* make sure the last character is null */
			int3 = (int *)scalar3;
			for(i=0;i<isize;i++)
			{
				int3[i] = int1[i] ^ int2[i];			/* do the XOR'ing, 32 bit-width */
			}
			for(i=isize * 4;i<(isize * 4)+irem;i++)
			{
				scalar3[i] = scalar1[i] ^ scalar2[i];	/* do the XOR'ing, bytewidth */
			}
			SvCUR_set(ret, size);			/* tell perl that the string is of specified length */
			RETVAL = ret;					/* XORed string */
		}
	OUTPUT:
		RETVAL

