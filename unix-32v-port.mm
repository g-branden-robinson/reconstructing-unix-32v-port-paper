.\" London & Reiser's UNIX/32V porting paper
.\"
.\" Reconstruction in groff mm (but DWB 3.3 mm compatible) from
.\" "32vscan.pdf" by G. Branden Robinson, June 2024.
.\"
.\" The scan shows no evidence of superscript usage, except on the cover
.\" sheet where "TM" superscripts "UNIX".
.\"
.\" Some differences may arise due to changes in the mm macro package
.\" itself from its PWB incarnation (ca. 1978) and DWB 3.3 (July 1992).
.\" Thanks to Dan Plassche for the history.
.\" https://www.tuhs.org/pipermail/tuhs/2022-March/025545.html
.\"
.\" The groff reimplementation of mm was undertaken mostly from
.\" 1991-1999 (by Joergen Haegg), based on the DWB documentation and
.\" James Clark's reimplementation of the ms macro package.  It added
.\" features but also parameterized even more aspects of package
.\" behavior, for example to facilitate easy localization.  Later,
.\" Werner Lemberg and G. Branden Robinson contributed enhancements, bug
.\" fixes, and improvements to the groff mm package and man page.
.\"
.\" GBR anticipates adding further parameters to groff mm to better
.\" emulate the old version of mm used by this paper.  (For example, the
.\" format of the caption applied to the reference page differs between
.\" ~PWB mm and DWB 3.3.)  Where this document exercises such
.\" extensions, they should be prefixed with a `do` request so that AT&T
.\" (PWB/DWB) troff will ignore them.
.do ds XX \" empty; dummy string for ending macros
.ie \n(.g .do de REFX XX
.el       .ig XX
.HU References
.XX
.nr Pt 1
.nr Hy 1
.nr Hu 1
.ds HF 3
.\" Override: "By default, ... bold stand-alone headings are printed
.\" in a size one point smaller than the body." (DWB 3.3 mm manual)
.ds HP 10
.ds UX UNIX\"
.ds pD PDP-11\"
.ds vX VAX-11\"
.ds iD Interdata\ 8/32\"
.nr y4 1900+\n(yr
.af y4 0000
.af mo 00
.af dy 00
.PF "''\s8Reconstructed by GBR \n(y4-\n(mo-\n(dy\s0''"
.TL
A \*(UX\*(Tm Operating System for the DEC \*(vX/780 Computer
.AU "Thomas B.\& London" tbl HO 1353
.AU "John F.\& Reiser" jfr HO 1353
.TM 78-1353-4
.ND "July 7, 1978"
.\" groff <= 1.23 typesets the cover "page" (more like a header)
.\" messily.  In nroff mode, it's outright horrific.  Fixed in groff
.\" Git, June 2024.
.\"
.\" The scan lays out the "affiliated firm" (`AF` macro content)
.\" differently than DWB 3.3.  DWB draws a long rule starting at the
.\" left margin and overdrawing the right one by an inch, maybe.  It
.\" also sets the firm name in larger type than the body, possibly bold,
.\" and aligned with the right-hand column of document metadata.  DWB
.\" 3.3 sets it under the rule at the left margin in Helvetica roman.
.\"
.\" XXX: Consider an `Afstyle` register to switch to this style?
.\"
.\" The 1978 AT&T logo also appears in the document.  GBR has no
.\" appetite for trademark entanglements, though Tadziu Hoffman has
.\" prepared a reconstruction of it in PostScript, which could be
.\" included with groff's `PSPIC` or `PDFPIC` macros...
.\"
.\" Scan capitalizes "Subject:"; DWB 3.3 renders it in full lowercase.
.\" GBR thinks this is not worth parameterizing in groff.
.\"
.\" XXX: To reproduce this document better, groff mm needs an `Aumt`
.\" threshold register to keep some `AU` arguments from printing in the
.\" cover header.  We can't just drop them from the reconstruction
.\" because they are also used to the construct the secretarial
.\" annotation produced by `SG`.
.\"
.\" In the scan, the right column of the cover header happily overrruns
.\" the right margin.  GBR thinks this is not worth parameterizing in
.\" groff.
.\"
.\" (In fact, the size and placement of the right column appear to be
.\" computed to precisely fit the words "Bell Laboratories" in the font
.\" used.  This practice obviously does not generalize well.)
.\"
.\" Scan bears a "TM:" heading for the technical memorandum number(s).
.\" DWB 3.3 lacks it.  GBR thinks this is not worth parameterizing in
.\" groff.
.\"
.\" groff mm <= 1.23 organizes the department and site name differently
.\" from DWB 3.3 in the cover header; GBR didn't see any reason for it
.\" to.  Fixed in groff Git, June 2024.
.\"
.\" Memorandum captions may have changed from PWB to DWB 3.3 mm.  groff
.\" mm was updated in Git (June 2024) to use the captions documented in
.\" the DWB 3.3 manual.  Here, we override the default for authenticity.
.MT "MEMORANDUM FOR FILE"
.H 1 Introduction
The \*(vX/780 \*(Rf
.\" Scan sets reference marks as a typewriter might, at normal size on
.\" the baseline between square brackets.  DWB 3.3 converts them to
.\" superscripts but keeps the brackets(!).
.\"
.\" XXX: groff mm should add a "Rfstyle" register to control the
.\" foregoing.
.\" 0 = auto (nroff/troff); 1 = bracket; 2 = superscript; 3 = both. (?)
.\" Spaces/commas between adjacent \*(Rf interpolations would be the
.\" responsibility of the document author.  A document could define, for
.\" example, an `rF` macro that interpolated the `Rf` string and
.\" included a leading space only `.if n`.
.RS
Digital Equipment Corporation,
.I "\*(vX/780 Architecture Handbook" .
Maynard,
Massachusetts,
1977.
.RF
is a new,
general-purpose,
stored-program electronic digital computer
manufactured by Digital Equipment Corporation.
At minicomputer prices
it provides addresses and data which are 32 bits wide;
the traditional minicomputer address space bound of 64K is gone.
This memorandum describes the \*(vX/780 and
the implementation of a \*(UX
operating system and complete user environment for it.
Section 2 contains an overview
suitable for general consumption;
details normally of interest only
to devotees of computer system architecture appear in Section 3.
The authors comment on software portability in Section 4.
.H 1 Overview
.B Environment.
A user of \*(UX and C software on the \*(pD will find that
the \*(vX/780 provides a very similar environment.
There are no apparent differences in the command language
or the vast majority of programs
which are customarily invoked directly from the shell.
A casual user probably will not be able to distinguish
the hardware,
except by issuing the command "who am i" \" straight quotes in scan
(which identifies the hardware and the current user)
or by noting that one of the columns printed
by the process status command
.I ps
is in hexadecimal rather than octal.
The C language programmer will find that
.B int ,
.B long ,
and pointer data types all occupy 4 bytes
(a
.B short
still occupies 2 bytes),
and that a
.B long
has its two halves
stored in a different order on the \*(pD than on the \*(vX.
Characters still suffer sign extension when converted
to longer integer types,
but one may use the declaration
.B "unsigned char" .
.P
.B Hardware.
The \*(vX is a follow-on computer to the \*(pD.
The architecture seen
by the user-mode assembly-language programmer of a \*(vX
is "culturally compatible" \" straight quotes in scan
with the \*(pD.
Specific details differ,
but a programmer familiar with the \*(pD
can quickly understand the differences.
The \*(vX provides UNIBUS and MASSBUS interfaces
and uses the same input/output peripheral devices as a \*(pD.
.P
Significant new features of the \*(vX include an extended
virtual address space,
intelligent console,
and dramatically improved physical packaging.
The address space of a process
is divided into a few gigantic segments.
Each segment is further divided
into a large number of small pages.
Sufficient hardware exists to make demand paging
a viable memory management strategy.
All console functions are handled by
an LSI-11 microcomputer
through a standard ASCII terminal.
The terminal may be remotely located from the processor
and can still halt,
boot,
or diagnose the \*(vX.
The mechanical and physical design of the \*(vX/780 is well done.
The processor contains no sliding drawers or moving cables.
All parts are easily accessible for servicing.
Adequate airflow is maintained even under maintenance conditions.
.P
.br
.ne 2v
.B Configuration.
The actual configuration purchased by Department 1353 is:
.br
.\" Either `VL` worked differently in 1978 mm, or didn't exist, or
.\" somebody wanted this list _just so_.
.\"VL \n(Pi 0 1
.LB \n(Pi "" "" 0 0 0
.\" DWB mm requires the list item to be an unadjustable space to get the
.\" effect desired here.  groff mm tolerates an ordinary space.
.LI "\ "
\*(vX/780 cpu
.LI "\ "
0.5 megabytes memory with battery backup
.LI "\ "
floating-point accelerator
.LI "\ "
12Kbyte user-writeable control store
.LI "\ "
UNIBUS adaptor with DZ11 (8 RS-232C lines)
.LI "\ "
MASSBUS adaptor with TE16 tape drive (800/1600 bpi)
.LI "\ "
MASSBUS adaptor with two RP06 disk spindles (176M bytes per spindle)
.LI "\ "
additional BA11KE UNIBUS box
.LE
The list price of the above configuration in February 1978 was $241,255;
the price
including a DEC discount to a Bell Labs purchaser was $200,242.
.P
.B Software.
We have implemented a \*(UX operating system \*(Rf
.RS
D.\ M.\ Ritchie and K.\ Thompson,
The \*(UX Time-Sharing System,
CACM
.I 17 ,
(July 1974),
365-375.
See also BSTJ 57,
6 (July-August 1978),
1905-1929.
.RF
and complete user software environment on the \*(vX/780.
The operating system is Research version 7 as of April 15, 1978.
The environment includes the Bourne shell,
C compiler,
code improver
.I c2 ,
assembler,
loader,
debugger,
standard I/O subroutine library
.B libS ,
C subroutine library
.B libc ,
source code control system SCCS,
.I nroff/troff ,
and more than 130 commands.
Maintenance programs for file system checking,
bootstrapping,
and physical disk pack handling have also been implemented.
.P
We began with the C language code of Research version 7
of the \*(UX operating system,
and a \*(pD/45 running \*(UX as a bootstrap machine.
Creating a C compiler
which produced \*(vX native-mode assembly code
was the first task.
The code generator portion of the portable C compiler
was rewritten to do this.
An assembler and loader,
based on similar code for the \*(iD,
completed the basic support software.
Existing \*(pD/70 device drivers
for disk,
tape,
and terminal communication lines
were adapted to the \*(vX/780.
Assembly language interfaces
(trap handlers,
hardware initialization,
etc.)
were completely rewritten.
We then created magnetic tapes
in the proper format
for an initial file system and for deadstart load,
and physically carried these tapes from the
\*(pD/45 to the \*(vX/780.
.P
Work on the C compiler began in mid-December 1977.
The hardware arrived on March 3.
We held a party on May 19
to celebrate successful multiuser operation of the system.
.P
.B Performance.
Identical documents were formatted by
.I nroff
on our \*(vX/780
and on a \*(pD/70 running Research version 7 \*(UX;
both systems used RP06 disks.
Identical C programs were compiled and assembled
on the \*(vX/780
and on the \*(pD/70.
As reported by the
.I time
command,
the results
(converted to seconds)
were:
.TS
center;
C S S S
L N N N.
nroff \-ms \-e \-T450\-12 ios.r >/dev/null
\&
\&	real	user	sys
\*(vX/780	47.0	28.6	8.7
\*(pD/70	54.0	36.9	7.9
.TE
.TS
center;
C S S S
L N N N.
cc \-c \-O pftn.c
\&
\&	real	user	sys
\*(pD/70 (Ritchie compiler)	86.0	43.5	11.8
\*(vX/780 (portable compiler)	82.0	64.0	10.5
\*(pD/70 (portable compiler	153.0	114.6	16.6
  for \*(iD)
.TE
.P
From the statistics on
.I nroff
one should conclude that,
based on user-mode CPU time,
the \*(vX/780 can execute the code produced by the \*(vX C compiler
approximately 22% faster
than the \*(pD/70 can execute the code
produced by the \*(pD C compiler.
This is a measure of the combined power of the hardware
and efficiency of the code generated by the
compiler.
Except as an upper limit,
the figures give no indication as to the throughput,
response time,
or efficiency of the operating system.
The differences in real time and system time
between the \*(vX/780 and the \*(pD/70
are not significant.
.P
The times given for compilation of the file
.I pftn.c
are an attempt at a "black box" \" straight quotes in scan
comparison of apples and oranges.
The black box is any program (compiler) which takes C language
input and produces executable instructions.
The black-box comparison is that the current
\*(vX C compiler running on the \*(vX/780
and compiling code for the \*(vX requires
49% more user-mode CPU time
than the current \*(pD C compiler running on the \*(pD/70
and compiling code for the \*(pD.
The apples and oranges aspect arises because
the two compilers,
while equivalent from the black box viewpoint,
are
(on the inside)
totally different pieces of software.
The \*(pD compiler is a production compiler
written by D.\ M\. Ritchie;
the \*(vX compiler is a portable compiler
based on work by S.\ C.\  Johnson.
The figures for the portable compiler running on the \*(pD/70
and compiling for the \*(iD
are included for those who wish to compare two portable compilers.
We have no \*(vX equivalent to the Ritchie compiler,
and thus cannot run the tests which would enable comparison
of two production compilers.
.P
The loaded size in bytes of the operating system
and seven other programs appears in Table 1.
One should note the general similarity
between the text (instructions) sizes
on the \*(pD and on the \*(vX,
and between the bss
(uninitialized data)
sizes on the \*(vX and on the \*(iD.
The particular \*(pD UNIX system chosen
has several more input/output device drivers
and experimental multiplexing software
not in the \*(vX system,
which accounts for its larger text size.
If many global integer variables
(or large arrays)
are used,
there is a tendency for the data and bss portions to double
in size when going from a \*(pD to a \*(vX
or an \*(iD
because an
.B int
occupies two bytes on the \*(pD
and four bytes on the other machines.
However,
character arrays occupy the same amount of space on all machines.
An unusually large number of references
to global variables in the
.I nroff
program accounts for its increase in text size on the \*(vX
compared with the \*(pD.
A program can be written
to automatically change the addressing modes
used in the \*(vX code
so that most references to global data become shorter than at present,
but this has not been done.
.P
.B Evaluation.
We believe that the \*(vX/780 provides
an excellent hardware environment for running \*(UX and C software.
With the software in its current state,
we view the system as operationally equivalent
to a \*(pD/70 running \*(UX software,
except that the 64K limit on process address space
is gone and programs run faster.
We believe that the advanced memory management
and user/system communication capabilities of the \*(vX/780 offer an
opportunity to construct future \*(UX-like systems
with substantially higher throughput
than provided by today's \*(UX on a \*(pD/70.
.H 1 Details
.HU Hardware
.P
Four main subsystems \(em the central processor,
console,
main memory,
and input/output \(em constitute the \*(vX/780 computer system.
The central processor,
memory,
and
input/output subsystems are connected
by the Synchronous Backplane Interconnect (SBI),
an internal synchronous bus
with a maximum data throughput of 13.3 megabytes per second.
The SBI deals in physical addresses which are 30 bits wide.
Half of the SBI address space is reserved for memory addresses,
and half for input/output device registers.
Arbitration for bus cycles on the SBI is distributed;
each subsystem decides if it will use the next bus cycle.
.P
The central processor
is a microprogrammed 32-bit general-register computer.
The architecture seen by the user-mode assembly-language programmer
is "culturally compatible" \" straight quotes in scan
with the \*(pD;
an expert programmer familiar with the \*(pD
can learn and understand the differences in one day or less.
The processor handles binary integers of 8, 16, and 32 bits;
single precision
(32 bit)
and double precision
(64 bit)
floating-point numbers;
character strings
up to 65535 bytes long;
bit fields up to 32 bits wide;
and IBM-style packed decimal strings up to 31 digits long.
Bit fields have no alignment restrictions whatsoever;
all other data types require alignment only to a byte
(8 bit)
boundary.
The central processor provides sixteen 32-bit general registers.
Register 15 is the program counter
.B pc .
Software operating in one of the privileged access modes
(see below)
must use register 14 as a stack pointer
.B sp .
The instructions which implement high-level procedure call and return
.RB ( pushl ,
.B calls ,
.B callg ,
.B ret )
assume a convention about the use of
.B sp ,
register 13
.RB ( fp ,
the frame pointer)
and register 12
.RB ( ap ,
the argument pointer).
The instructions which handle character
and packed decimal strings
use registers 0 through 5 to hold pointers and counters,
so as to be interruptible.
Floating-point operations may use the general registers;
there are no separate floating-point registers.
Instructions take from zero to six operands.
The operation code occupies one byte
and is followed by the operands,
which require from one to nine bytes each.
Nine addressing modes
(including all the \*(pD modes except *\-(r))
are allowed,
and the addressing modes are independent of the operation code.
When the central processor is executing in the context of a process,
there are four access privilege modes
(user,
supervisor,
executive,
kernel),
each with its own stack pointer;
software which desires a per-process kernel stack
is easy to implement.
A fifth stack pointer is used
when executing in a special system-wide interrupt context.
The \*(vX/780 processor includes an eight kilobyte,
two-way set associative,
write-through,
memory data cache;
an eight-byte instruction stream buffer;
and a 128-address virtual address translation buffer.
Most of the processor is implemented in Schottky TTL MSI logic.
A programmable realtime clock and a time-of-year clock
(battery operated during loss of line voltage)
are standard equipment.
Options include a hardwired floating-point accelerator
and user-writeable control store.
.P
The console subsystem consists of an LSI-11 computer,
local memory,
floppy disk,
DECwriter terminal,
and remote-access communications port.
The console is connected directly to
the central processor and performs all the functions
of a conventional "lights and switches" \" straight quotes in scan
front panel.
The floppy disk serves as the initial bootstrap device
for normal operation
and holds special microcode for diagnostic operation.
When activated by a key switch on the central processor,
the remote-access port becomes the console.
A terminal connected through the remote-access port
can halt the central processor,
boot it,
diagnose it,
etc.
.P
The virtual address space of a process
running on the \*(vX/780 consists of 2**32 8-bit bytes.
The two high-order bits of a 32-bit address
determine one of four segments.
Two of these segments are system segments
common to the address space of all processes.
One of the system segments is reserved for future use.
The other two segments are separately defined for each process
and are automatically managed by the context switching instructions.
One of the per-process segments is designed for a stack
which grows towards lower-numbered memory addresses.
Segments are divided into pages of 512 bytes.
Memory mapping hardware translates virtual addresses
into physical addresses using page tables.
A page table contains one four-byte entry for each page mapped;
the entry contains a valid bit,
a four-bit field which encodes access privileges,
a modify bit,
and the physical page-frame number where the page is mapped.
(There is no reference bit which is maintained by hardware!)
A base register and a limit register
describe the page table of each segment.
The base register of a per-process segment
contains a virtual address within the system segment;
the base register for the system segment
contains a physical memory address.
The \*(vX/780 central processor
contains a virtual address translation buffer
holding 128 virtual address-page frame number pairs
which eliminates the need for extra memory references
during address
translation for (typically) 98% of all memory references.
The memory is implemented using MOS semiconductor RAMs
with an error correcting code
which corrects all single-bit errors
and detects all double-bit errors
and 70% of all greater-than-double bit errors.
A memory controller can handle 8 memory boards;
using 4K chips each board can hold 128K bytes.
There can be two memory controllers,
thus the maximum amount of physical memory is currently 2 megabytes.
When 16K chips are used
[forecasted for late 1978],
each board will hold 512K,
and physical memory can
be 8 megabytes.
There is a battery backup option
for maintaining data in the event of a power failure.
Each optional battery will maintain 1 megabyte for 10 minutes.
.P
The input/output subsystem consists
of UNIBUS adaptors and MASSBUS adaptors.
A UNIBUS adaptor (UBA) is an interface
between a standard UNIBUS and the SBI.
The UBA does the bus arbitration and everything else necessary to
administer the UNIBUS.
It also contains a set of registers
for mapping UNIBUS addresses to and from SBI addresses.
The maximum throughput on a UBA is 1.5 megabytes per second.
A MASSBUS adaptor (MBA) is an interface
between the SBI and MASSBUS devices
(RP06 disk,
TE16 tape,
etc.).
An MBA would be more properly called an RH-780 controller,
analogous to the RH-11 controller on a \*(pD/70 MASSBUS;
only one unit may transfer data at a time,
although several similar units
connected to the same MBA can execute control functions simultaneously.
The MBA contains the device control registers
normally found in an RH controller.
The registers lie in the I/O section of SBI addresses.
An MBA also contains a set of mapping registers
which translate device byte addresses to and from SBI addresses.
The maximum throughput on a MBA is 2.0 megabytes per second.
The published limits are 1 UBA and 4 MBAs per system.
Theoretically one could have any number of either kind
as long as the sum of the number of central processors,
memory controllers,
MBAs,
and twice the number of UBAs were 15 or less,
since the SBI has 15 "ports". \" straight quotes in scan
.P
The physical packaging of the system
has been dramatically improved
compared with the \*(pD.
The \*(vX/780 processor cabinet contains no drawers or moving cables.
The SBI is fixed and rigid.
Three one-third horsepower squirrel-cage blowers provide
sufficient air flow \(em even while servicing the CPU.
Any logic card,
power supply,
or blower can be replaced
within twenty minutes
by one person using only a screwdriver.
The CPU stands 1.53m x 1.17m x 0.77m (HWD);
cabinets housing the CPU,
UNIBUS devices,
and tape drive are usually bolted together
to form a single unit 1.53m x 2.51m x 0.77m.
Our configuration
(see section 2)
weighs 3452 pounds and requires 42050 BTU/hr cooling.
.HU "C Compiler"
A \*(vX "native mode" \" straight quotes in scan
C compiler was constructed using S.\ C.\ Johnson's
portable compiler as a base.
After one month,
a reasonable version began to evolve:
it produced code which was good enough to exercise the assembler,
loader,
and debugger
(on the
bootstrap \*(pD/45).
This initial version did not make use of \*(vX indexed addressing
(which does single-level array subscripting
including appropriate index shifts),
bit field instructions,
or autoincrement/decrement addressing.
It contained its share of bugs,
particularly since the hardware had not arrived
and could not be used to actually run the generated code.
.P
Substantial effort has been subsequently directed
towards improving all aspects of the compiler:
bugs have been corrected,
routines have been made to execute more efficiently,
and the quality of the generated code has been improved.
All addressing modes are supported,
bit-field instructions are used for programmer-defined bit fields,
and autoincrement and autodecrement addressing
as well as three-address instructions are used.
.P
Overall,
our experience with the compiler has been very favorable.
When the \*(vX/780 was delivered,
the compiler worked well enough to compile itself,
the \*(UX kernel,
and many user-level commands.
In fact,
since the delivery of the machine,
only about a half-dozen serious bugs have been detected.
Additionally,
the framework of the compiler has proven itself to be flexible:
a compiler for the \*(iD was transformed
into a compiler for the \*(vX/780,
some improvements and extensions were easily added,
and,
in general,
a quickly evolving compiler has remained stable and productive.
The authors feel that,
with a few extensions to the model of the compiler
and a certain amount of tuning,
the current \*(vX compiler could easily remain
as the production \*(vX compiler.
.P
There are still some deficiencies
in the current version of the compiler,
as well as in the basic "product" itself. \" straight quotes in scan
The compiler is slow and quite large;
see the statistics in section\ 2 and Table\ 1.
Some of the blame for the size and lethargy
of the first pass can be attributed
to the use of
.I lex
for the scanner and
.I yacc
for the parser,
and to the use of ASCII to communicate information between passes.
Both
.I lex
and
.I yacc
produce large routines:
the scanner is 17K bytes in length
(over 4.5K bytes of instructions),
and the parser is 16K bytes long
(over 5.5K bytes of instructions).
On the average,
the first pass spends 20% of its time in the lexical scanner,
.I yylook ,
and 9% of its time in the parser
.I yyparse .
.P
Using ASCII to communicate between the two passes
causes an additional speed penalty for character conversion.
On typical programs,
the first pass (parser)
spends roughly 30% of its time performing output services
(i.e.,
calls to
.I _doprnt
(18%),
.I _strout
(8%),
and
.I printf
(4%)),
while the second pass
(code generator)
spends roughly 21% of its time
reading it back in
(i.e.,
calls to
.I read
(18%)
and
.I rdin
(3%)).
(Additionally,
the routine used to convert
from ASCII to binary
contained a bug
which caused "\-2147483648" \" straight quotes in scan
(which is \-(2**31) )
to be read as zero on our \*(pD/45.)
.P
The above problems are not inherent to the compiler model.
To speedup compilation,
the scanner can be hand-coded
(as in the standard \*(pD compiler),
and the interpass data can be formatted in binary
(or the two passes can be combined).
With these simple modifications
(some are already in progress),
it should be possible to produce a compiler almost twice as fast
as the current one.
.P
Two features of the \*(vX architecture \(em
three-address instructions and indexed addressing mode \(em
were difficult to model within the basic structure of the compiler.
The full
implementation of three-address instructions proved to be
so difficult that it was not really attempted.
Instead,
.I c2 ,
the assembly language code improver,
tries to merge several instructions
into an appropriate three-address instruction.
For example,
the statement
.I "a = b + c"
compiles
.DS
	addl3	b,c,r0
	movl	r0,a
.DE
which the improver can change to:
.DS
	addl3	b,c,a
.DE
for a savings of three bytes and over 400 nanoseconds.
However,
.I c2
will not always succeed in this shortening.
It cannot tell the difference between
.DS
	a = b + c;
	return
.DE
and
.DS
	return( a = b + c );
.DE
since register
.B r0
must be considered "live" \" straight quotes in scan
(i.e.,
contains a value which may be required later)
across the return statement.
.P
The \*(vX has six indexed addressing modes
which yield the address of an element
of a one-dimensional array of a base type
.RB ( char ,
.B short ,
.B int ,
.B long ,
pointer,
.B float ,
or
.B double ).
The
statement
.DS
	a[i] = b[j] * c[k];
.DE
where
.I i ,
.I j ,
and
.I k
are declared
.B "register int"
and
.I a ,
.I b ,
and
.I c
are
.B double
arrays
(either external or local)
can be compiled into the single instruction:
.DS
	muld3	b[j],c[k],a[i]
.DE
Although the index specifier
(e.g.
.I i
in the above example)
must be a register,
the base address specifier can be any addressing mode
except register,
literal,
or another indexed mode.
For example,
the C-language constructs
.I a[i] ,
.I (*p)[i] ,
.I (\-\-p)[i] ,
.I (p++)[i] ,
and
.I (*p++)[i]
(or their equivalents
.I *(a+i) ,
.I *(*p+i) ,
.I *(--p+i) , \" recte: *(\-\-p+i)
.I "*(p++ +i)" ,
and
.I "*(*p++ +i)" ,
respectively)
all can be done with a single \*(vX address
(where
.I a
is an array of base type,
.I p
is a pointer to the same type,
and
.I i
is of type
.B "register int" ).
It is usually difficult to recognize
or conveniently represent such constructs
(e.g.,
.I (*p++)[i]
is fun),
or generate the possible cases
(e.g.,
.I a[i]
where
.I a
is not
readily addressable).
.P
The fact that the code generator
can easily recognize only expression trees of height one
(two if OREG and UNARY MUL nodes are taken into account)
causes substantial difficulty in making use of indexed mode,
three address instructions,
and indirect addressing.
Expression trees of non-trivial height occur not infrequently
(e.g. as a worst case,
the statement
.DS
	a = b + (*p++)[i];
.DE
has an expression tree of height six,
but can be compiled into the single instruction
.DS
	addl3	b,*(p)+[i],a
.DE
if
.I p
and
.I i
are
.B register
variables).
The complexity of the code generator is raised
by forcing the compression of subtrees into single nodes
which are then treated with special checks,
special code, etc.
.P
The size and alignment attributes of data objects
are logically independent,
even though
previous hardware architectures
(IBM 360,
\*(pD,
\*(iD, ...) \" bad ellipsis spacing in scan
have imposed alignment restrictions based on size.
The VAX 11/780 \" - in "VAX-11" missing; error in text or scanner fubar?
has no such restrictions,
although programs run faster with data aligned on natural boundaries.
The C language has little notion of alignment;
because of run-time penalties,
the \*(vX C compiler aligns all the basic data types
on address boundaries which are a multiple of
.B sizeof
the basic type.
Due to questions about alignment,
both the language and the compiler have difficulty
with the declaration
.I "char c:10;" .
.P
The decision to naturally align most data items
has undesirable side effects which cannot be ignored.
Consider the structure declaration
.DS
	struct foo {
		char c;
		float f;
	} bar;
.DE
On the \*(pD,
.BR sizeof (\c
.I foo )
is 6 bytes while on the \*(vX,
.BR sizeof (\c
.I foo )
is currently 8 bytes
(the offset of
.I f
within
.I bar
is 2 and 4 respectively).
.BR sizeof (\c
.I foo )
could be 5 bytes in each case.
Although both machines use the same data formats
for chars and floats,
the differing alignment imposed by the the \*(vX C compiler
means that the two machines cannot speak directly
to one another using media which record structures
containing binary information.
Since alignment is important,
we feel that it ought to be specifiable in the C language.
.HU "Operating system conversion"
A \*(UX system running on a \*(pD/45 was used as the base
for transporting software to the \*(vX/780.
The software itself originated with the code
produced by members of Center 127,
Computing Science Research,
for the \*(iD.
Programs were cross-compiled,
assembled,
loaded,
and put on magnetic tape in
.I tp
format;
absolute bit-string files
were put on tape in
.I dd
format.
Tapes were then carried across the room to the \*(vX/780.
An absolute tape boot
(in machine language),
.I tp
boot and primary disk boot
(in assembly language),
secondary disk boot
(in C),
and stand-alone utilities
(disk formatter,
disk verifier,
tape-to-disk,
disk-to-tape,
disk-to-disk,
and disk-to-console,
all in C)
were then used to bring up the system.
.P
Establishing an initial file system on the disk
took longer than expected.
The \*(pD/45 was running USG issue 3 of the \*(UX
operating system with a "16-bit" \" straight quotes in scan
file system
and the \*(vX/780 was to have a Research version 7
"32-bit" \" straight quotes in scan
file system.
Also,
C-language code on the \*(vX
expects the bytes of a 32-bit integer to be stored in a different order
than C-language code on the \*(pD.
We swallowed these two red herrings hard,
and suffered.
We now know that the proper way
to create an initial file system
is to modify the program
.I mkfs
so that its output
(on the bootstrap machine)
is a file containing the proper bits,
put that file on tape,
and use the tape-to-disk utility on the target machine.
.P
Mapping the software architecture of the \*(UX operating
system onto the hardware architecture of the \*(vX
required a number of decisions.
Commentary on these decisions follows.
The SCB
(system context base)
processor register contains a page-aligned
physical memory address which is the base of the hardware
interrupt vector.
The \*(UX system puts this vector at physical memory address zero.
.P
Operating system code,
data,
kernel stacks,
and interrupt stack occupy the \*(vX/780 system segment
(virtual addresses 80000000 to bfffffff).
User code and data are loaded into segment zero
(0 to 3fffffff)
and the user stack is initialized in segment one
(7fffffff to 40000000).
User processes pass arguments to system service code using the ordinary
.B calls
subroutine calling sequence.
The
.B chmk
instruction is then used to gain kernel privileges.
The
.B chmk
instruction switches the stack pointer
.B sp
from the user stack to the kernel stack,
but does not change the argument pointer
.B ap
or the frame pointer
.B fp .
The kernel uses the value in
.B ap
to copy the arguments into
.I u.u_arg .
The \*(vX hardware allows the values to be directly addressed,
but the kernel software requires the copy.
.P
The
.I "u area"
is a per-process data structure
in which the operating system
keeps swappable information about a process.
The kernel virtual address of the
.I "u area"
must be a constant across all processes.
The \*(pD implementation puts the
.I "u area"
at kernel address 0160000;
when process switching occurs
the
.I "u area"
is switched by changing a kernel data space segmentation register.
Since the operating system can address user memory on a \*(vX,
the
.I "u area"
could be placed in (protected) user memory,
say at address 0 or at 7fffe000.
However,
it was desirable for the first implementation
to make the page tables for user segments part of the
.I "u area" ,
which creates timing problems unless the
.I "u area"
lies in system space.
The base of the
.I "u area"
was assigned kernel virtual address 80020000.
When process switching occurs,
the
.I "u area"
is changed by changing the system-space page table
and invalidating the page-table translation cache
for the appropriate pages.
.P
Since the operating system can directly address the memory
of the current user process,
the procedures
.I fubyte ,
.I subyte ,
.I fuword ,
etc.,
are unnecessary and could be made into macros
which would merely do the appropriate load or store.
However,
these procedures
(along with
.I copyin
and
.I copyout)
were kept to ensure that each access to user space is valid.
.P
A \*(vX/780 internal processor register called the PCB
(process context base)
points to an area in which the \*(vX/780
saves the hardware state of the machine
(96 bytes)
when switching context.
This save area was put in the
.I "u area"
as
.I u_rsav .
.P
The implementation of context switching required major effort.
The \*(vX has two very nice instructions
.RB ( svpctx ,
save process context;
and
.B ldpctx ,
load process context)
which facilitate context switching.
Unfortunately,
they do not implement the mechanism which the \*(UX system expects.
(The mechanism used by \*(UX is so dispersed and intricately detailed
that it is hard to imagine any hardware which implements it directly.)
The temptation to drastically change the \*(UX code
has been resisted so far.
The
.IR savu / retu / aretu
tar pit was VAX-inated,
but it took more than a week.
The newer
.IR save / restore
primitive does make the C-language code prettier,
but the assembly-language side
(at least for the \*(vX)
is just as dirty as ever.
The \*(UX context switching mechanism
requires three state save areas,
.I u.u_rsav ,
.I u.u_ssav ,
and
.I u.u_qsav
because the same mechanism is also used for abnormal returns.
The \*(vX context switching instructions
use only a single state save area.
To make use of the \*(vX instructions,
the software simulates a great deal of microcode
and bastardizes call frames in a most ugly manner.
Context switching is certainly high on the list of things
to rewrite in the second implementation
(even for the \*(pD!).
.P
The procedures
.I sureg
and
.I estabur
were also tricky to implement.
They were designed with the assumption that only a small number
(16 or fewer)
of registers would be needed
to map the address space of a user process,
while on the \*(vX a 32K process requires 64 page table entries.
Furthermore,
the memory map of a process is diddled in tricky ways,
particularly in
.I expand
and
.I getxfile .
.P
Handling DMA I/O hardware was the other major implementation bottleneck.
The UBA and MBA mapping registers contain physical memory page numbers,
and physical addresses are hard to handle.
It is not pleasant to deal with the hardware
which implements the mapping registers.
If an I/O transfer is in progress
then the mapping registers may be neither read nor written;
this applies even to registers which would not be used by the transfer.
As a result,
the map for the next I/O operation
cannot be setup during the current I/O operation.
Furthermore,
a single transfer is limited to 64K bytes
because the byte counter is only 16 bits wide.
Thus swapping a process to the disk can require multiple I/O operations.
The solution to these problems
involved permanently reserving the last 129 registers in each map
to service both swap and physical I/O operations.
The remaining map registers are available to map the system buffers,
and are loaded at system initialization time.
Disk ECC error correction is currently done
only for I/O involving the system buffers.
Disk errors on raw I/O cause process termination;
the swap area on disk had better be error-free.
.P
Like the \*(UX system for the \*(pD,
the current implementation for the \*(vX/780
maintains each process in contiguous physical memory
and swaps processes to disk
when there is not enough physical memory to contain them all.
Reducing external memory fragmentation
to zero by utilizing the \*(vX/780 memory mapping hardware
for scatter loading is high on the list of things to do
in the second implementation pass.
To simplify kernel memory allocation,
the size of the user-segment memory map
is an assembly parameter which currently allows
three pages of page table or 192K bytes total for text,
data,
and stack.
This also deserves to be rewritten,
both to allow varying process size,
and to allow processes larger than physical memory
through demand paging.
Dynamic page table size
would mean dynamic
.I "u area"
size if the page table remained part of the
.I "u area" .
.P
The code in
.I \%sendsig
for sending a signal to a process involves a tedious simulation of the
.B calls
instruction due to the problem
of "inward return" \" straight quotes in scan
across privilege modes upon termination of the routine
which handles the signal.
Making a portion of the kernel code readable by a
user-mode process would simplify
.I \%sendsig .
Motivated by a problem with the Bourne shell,
the signal number is passed as a parameter to the signalled routine.
.P
Interprocess communication via signals
.RI ( signal
and
.I kill )
uses the low-order bit of a machine address
for something other than addressing.
This implies that a procedure which
handles signals must start on an even byte boundary,
which means that every procedure
must start on an even byte boundary.
The C compiler thus issues a pseudo-op to the assembler
to align the beginning of each procedure.
This can waste memory on a \*(vX.
It also imposes a nontrivial requirement on the assembler,
since if the resolution of conditional jump instructions
can change the parity of the length of a procedure
then the alignment directive must also
be handled like a conditional jump.
In hindsight,
it would have been better if a distinct value
(say +1 or -1) \" recte: \-1
were used for
.I ignore ,
rather than multiplexing the bottom bit.
.P
The \*(vX/780 provides a (non-maskable) trap
for integer division by zero.
The system would like to turn this
into a signal to the process.
A similar situation exists for subscript range trap.
Integer overflow,
floating overflow,
floating underflow,
and reserved operand also need signal numbers.
Perhaps only one "error" signal \" straight quotes in scan
is needed with some other means for determining the true fault.
The whole business of interrupts,
signals,
asynchronous I/O,
and the use of the hardware AST mechanism deserves more attention.
.P
A bug was discovered in the \*(UX code for process termination
involving the
.I proc
and
.I xproc
structures.
(The problem also existed on the \*(pD,
but it would only be noticed
if a process had accumulated more than 65535 ticks of system time,
which is highly unlikely.)
When a process dies its resource
utilization statistics
(currently only
exit status,
system,
and process CPU time)
are temporarily saved so that they can be added to
the totals for the descendents \" sic
of the parent process.
The actual accumulation is done by the kernel
when the parent process issues a
.B wait
system call;
the child process is then completely erased.
The kernel was overlaying the statistics
in a part of the
.I proc
structure normally used by the scheduler to contain the pointer
.I p_textp .
Ordinarily the exit was processed immediately,
causing no harm.
But if the system was loaded so that swapping was necessary,
then the scheduler could sneak in
after the child exited and before the parent read the statistics,
and would interpret the timing data
in the zombie
.I xproc
structure as a pointer.
This invariably caused an illegal memory reference
from kernel mode on the \*(vX/780.
.P
One of the greatest disappointments with the current system
stems from a design quirk
in the FP-11 floating-point processor for the \*(pD.
When converting between floating-point and 32-bit integer,
the FP-11 expects the high-order 16 bits of the integer
to be stored at the lower memory address;
this is not in line
with the general "right to left" design \" straight quotes in scan
of the \*(pD,
which would place the low-order 16 bits in the lower memory address.
C code for the \*(pD uses the FP-11 convention for storing
.B long
integers.
The \*(vX hardware stores
the least significant bit of
.I any
integer data type in the lowest addressed byte.
C code for the \*(vX uses the hardware convention.
This means that files containing long integers represented
in the local convention are not binary compatible
between a \*(UX system on the \*(vX and a \*(UX system on the \*(pD.
This is the only exception for data types common to both machines:
.BR char ,
.BR short ,
.BR float ,
and
.B double
all have a common representation.
Except for this
(and the structure alignment problem noted earlier),
disk packs containing 32-bit file systems,
tapes,
etc.,
would have been interchangeable.
The fact that DEC's Fortran-IV Plus
for the \*(pD avoided the FP-11 convention,
and that RSX-11 files
.I are
binary compatible between the \*(vX and the \*(pD,
is only salt on an open wound!
.HU "Subroutine libraries"
.B libc.
Conversion of the system-call interface routines
was straightforward but tedious.
Most routines are merely
.DS
		.word	0x0000
		chmk	$nn
		bcc	L1
		jmp	cerror
	L1:	ret
.DE
The routines
.I printf ,
.I ecvt ,
and
.I fcvt
were left to
.B libS
and were not implemented in
.B libc .
.P
.B libS.
Conversion of the standard input/output library
.B libS
posed no problems
except for
.I _doprnt ,
the routine which constructs character representations
of other datatypes for the printing routines
.I printf ,
.I fprintf ,
and
.I sprintf .
Since many programs spend 15% to 20% of their execution time within
.I _doprnt ,
it pays to code the routine for speed in assembly language.
Packed-decimal instructions handle decimal,
unsigned,
and floating-point conversions.
The algorithm
chosen for converting from floating-point to character string revealed a
microcode bug in the \*(vX/780's
.B ashp
(arithmetic shift and round packed)
instruction.
Under certain conditions a carry from the rounded digit
propagated both to the adjacent digit and to the digit eight places
further left.
This usually caused an overflow,
since the destination packed-decimal string
was typically not long enough to represent the spurious carry.
DEC claims to have a fix
for the bug,
but the FCO has not arrived.
In the meantime a five-instruction patch
detects and corrects the spurious overflow.
.HU Commands
.B "as, ld."
Code developed by Center 127 for the \*(iD
was the model for an interpretation by a \*(vX/780 artist.
The assembler uses an algorithm described in \*(Rf
.RS
W.\& Wulf,
R.\& K.\& Johnsson,
C.\& B.\& Weinstock,
S.\& O.\& Hobbs,
and
C.\& M.\& Geschke,
.I "The Design of an Optimizing Compiler" .
American Elsevier,
New York,
1975.
.RF
with heuristic improvement of \*(Rf
.RS
J.\& F.\& Reiser,
Common Instances of Pathological Span-dependent Instructions,
TM 78-1353-3.
.RF
to resolve conditional jump pseudoinstructions.
Variable-length,
unaligned instructions and address constants
forced the relocation information in object files
to include the explicit segment-relative address
for each relocatable datum,
rather than
deducing
the address from a one-to-one correspondence
between the position in the segment
and the corresponding position in the relocation table.
This caused a slight change in the header information
within object files.
.P
.B c2.
The code improver for the assembly language
generated by the \*(vX C compiler
is based on a similar program for the \*(pD.
A "backwards" register usage pass, \" straight quotes in scan
performed once and before anything else,
was a major addition.
Knowing that no temporary register is live across a backwards jump,
the register usage pass introduces three-address instructions
where ever \" sic
possible.
It also recognizes situations where
jump on bit
.RB ( jbc ,
.BR jbs ,
.BR jlbc ,
.BR jlbs ),
extract field
.RB ( extzv ,
.BR movzbl ),
and move address
.RB ( moval,
.BR movab ,
.BR pushal ,
.BR pushab )
instructions can be used.
The code for insertion of fancy loop control instructions
.BR sob ,
.BR aob ,
.BR acb
was also extended.
.P
.B adb.
The most significant change to the symbolic debugging routine
was the writing of a disassembler for \*(vX native-mode instructions.
Additionally,
the character input and output routines
were modified to use a default radix for all numeric values.
The radix is initialized to sixteen.
.P
.B sh.
The (Bourne) shell is the standard user command interpreter.
It required by far the largest conversion effort
of any supposedly portable program,
for the simple reason that it is not portable.
Critical portions are coded in assembly language
and had to be painstakingly rewritten.
The shell uses its own
.I sbrk
which is functionally different from the standard routine in
.B libc .
The shell wants the routine which fields a signal
to be passed a parameter
giving the number of the signal being caught;
.I signal
was also a private routine.
This was handled by having the operating system
provide the parameter in the first place,
doing away with the private code for
.I signal .
The code in
.I fixargs
(for constructing the argument list to an
.B exec
system call)
had to be diddled.
.P
.B "ps, iostat."
The process and input/output status commands
consistently referenced
.I /dev/mem
(physical memory)
when they should have referred to
.I /dev/kmem
(kernel virtual memory).
.I iostat
also assumed that certain variables maintained by the kernel
were allocated contiguously,
even though they were not declared as part of a structure.
.P
.B pr.
The command which formats and prints files
had a bug that caused a division by zero
when it was asked to print several files
and the first file in the list did not exist.
On a \*(pD division by zero returns the dividend,
but on a \*(vX it gives an unmaskable trap.
.P
.B "cat, dc."
These two commands did not count
their arguments using the first parameter
.I argc ,
but rather assumed that an additional argument
.RI ( argv[argc],
initialized as -1) \" recte: \-1
could be used as a pointer.
On the \*(pD the resulting address
references the fixed end of the stack;
on the \*(vX,
-1 \" recte: \-1
is an illegal address.
.P
.B "nroff/troff."
The source code
for the document preparation and phototypesetter commands
is not portable;
several weeks were required to produce properly running version \" sic
of these commands.
Use of the explicit
(or worse,
implicit)
constant "2" \" straight quotes in scan
instead of
.B sizeof(int)
was quite common.
The code assumes that variables
which are adjacent in external declarations
occupy contiguous memory at execution time.
Several tables are initialized by assembly-language programs.
Converting the tables was merely tedious;
changing the
code which
thought it knew the
format of an
.I a.out
file required some effort.
This memorandum
was created using the converted
.I nroff/troff
programs on the \*(vX/780.
.P
.B SCCS.
Version 4 of the Source Code Control System \*(Rf
.RS
.I "SCCS/PWB User's Manual, The Source Code Control System" .
.RF
is used to provide version backup for software
in case disastrous bugs are introduced.
The source for SCCS itself
had not quite been converted to version 7 \*(UX,
and the header files required some massaging.
The PWB routines
.I logname
and
.I pexec
had to be simulated.
The utility procedures for dynamic storage allocation
required some work to integrate them with
.B libS
and to remove \*(pD dialect.
The exit status of the
.I diff
command changed in version 7,
causing
.I delta
to bomb.
The code implicitly assumed that all checksums
were computed modulo 65536.
The documentation is incorrect:
everywhere "99999" appears \" straight quotes in scan
it should really say "65535". \" straight quotes in scan
The procedure
.I satoi
returns two values,
storing one of them indirectly through a pointer parameter.
Naturally,
.I satoi
and its callers did not agree on
.B sizeof
the stored value;
this took a day to track down.
.HU "Software portability"
We thank the members of Center 127,
Computing Science Research,
for their efforts in producing the basic software
and for their recent efforts towards making the software portable.
The fact that people other than the original developers
can quickly create a running system for a new machine
is a tribute to how well the original work was done.
.P
Yet in our effort to transport a complete \*(UX system
to the \*(vX/780 we stumbled
across a large number of nonportable constructions
and were dismayed by the seeming lack of appropriate facilities
to detect and prevent them.
Based on our experience,
we strongly recommend that the C language and its compilers
be enhanced so that
.P
.\" Either `AL` worked differently in 1978 mm, or didn't exist, or
.\" somebody wanted this list _just so_.
.\"AL "" 5
.LB 5 0 0 1 1
.LI
The actual arguments in a procedure call
are type checked against the procedure declaration,
and a "dummy" declaration \" straight quotes in scan
which specifies types
is permitted even if the called procedure
is not actually declared in the same compilation.
.LI
The '\->' operator is checked to insure
that the structure element on the right
is a member of a structure to which the pointer on the left may point.
.LI
A structure element may be declared with any name
as long as the name is unique
within the immediately surrounding structure.
(The current requirement
that a structure element name
must uniquely correspond
to an offset from the beginning of the structure,
across all structures in a compilation,
creates naming problems and frequently leads
to errors of the type noted in item 2 above.)
.LI
The issue of alignment to an even-byte
(or other)
boundary is brought into the open,
so that arbitrary data structures can be accurately described.
.LE
.P
There is a program called
.I lint
\*(Rf
.RS
S.\& C.\& Johnson,
.I lint ,
a C Program Checker.
Computing Science Technical Report #65,
Bell Laboratories,
December 1977.
.RF
which,
if conscientiously used throughout the life of a piece of software,
provides type checking which partially addresses
the first two points in the above list.
The problem is that
.I lint
is big,
noisy,
relatively recent and unknown,
and
(partially as a result)
infrequently used.
There is little incentive for the average programmer
to use
.I lint
as a matter of course.
The authors believe that type checking belongs
in the everyday compiler as the default,
where it is very inexpensive to implement.
Those who wish to do "dirty" work \" straight quotes in scan
may request that type checking be disabled;
those who wish to bless their dirty work may use type casts.
.P
We believe that these four enhancements
would go a long way towards making C language software
portable as a rule rather than as an exception,
thus preserving Bell Laboratories'
investment in present and future C software.
.bp
.P
.I Acknowledgments.
Thank you,
D.\& M.\& Ritchie and S.\& C.\& Johnson,
for answering questions at key moments;
G.\& K.\& Swanson,
for assistance with boot procedures and stand-alone utilities;
J.\& F.\& Jarvis,
for the mathematical function library;
and
D.\& K.\& Sharma,
for help in bringing up user-level commands.
Additional thanks go to many other members of Centers 127 and 135,
and Department 8234,
for helpful comments and suggestions.
.P
.I "2024 Reconstruction Notes."
Dennis Ritchie made available a scan of the original London/Reiser paper
circa 2003,
the basis of this reconstruction.
Unfortunately,
no
.I mm
source document was offered;
Ritchie made available new PDF and PostScript versions
that appear to have been converted to the
.I ms
macro package or similar,
and introduced an abstract.
.P
.I "2024 Reconstruction Acknowledgments."
Naoki Hamada prepared
an HTML conversion of Ritchie's converted form of the paper
that proved invaluable in detecting OCR and transcription errors.
Thanks to
Arnold Robbins
and
Damian McGuckin
for catching typographical errors.
McGuckin also spotted clumsy
.I mm
macro usage.
Jonathan Gray kindly reminded this reconstructor
of Ritchie's resource page,\c
.ds fM \s-2\v'-.3m'*\v'+.3m'\s0
\*(fM
.FS \*(fM
https://www.bell\-labs.com/usr/dmr/www/portpapers.html
.FE
which may be the origin of the numerous copies of
.I 32vscan.pdf
on the Web.
.\" Scan has signatures set farther to the right, not left-aligned at
.\" the page's vertical centerline where DWB 3.3 mm sets them.  groff mm
.\" follows DWB here.
.\"
.\" Scan and DWB 3.3 put the signature names in bold; groff <= 1.23 sets
.\" them at normal weight.  Fixed in groff Git, June 2024.
.\"
.\" XXX: Scan has a couple of vees between the signature line and the
.\" flush left secretarial annotation (containing arguments after the
.\" second to `AU` macro calls).  groff mm sets the annotation on
.\" the same line as the last author but also puts its information in
.\" the cover header as DWB 3.3 does, described next.  DWB 3.3: (1)
.\" omits the secretarial annotation altogether, but puts the third and
.\" subsequent `AU` arguments in the cover header under the authors'
.\" names [the scan does not]; (2) does not use author initials (in the
.\" cover header) (3) puts the department number after "Org." on the
.\" line under the author name; (4) puts the abbreviated AT&T site name
.\" below that.  Should we consider a `Sganno` Boolean-valued register
.\" for groff mm?
.SG
.NS 3
References
Table 1
.NE
.RP "" 2
.\" XXX: Scan has references caption set flush left, in mixed case and
.\" bold (just like `HU`).  DWB 3.3 and groff center it and set it in
.\" full caps in italics (at normal weight).  If there were a way to
.\" dump the accumulated reference list independently of rendering the
.\" caption, that would give the author much more flexibility.
.\"
.\" XXX: The numbered reference list does not look like one produced
.\" with `RL` nor with `AL`.  The numeric tag is left-aligned within the
.\" paragraph indentation.  groff mm aligns it to the right.  Extend
.\" groff mm to support this.
.\"
.\" DWB 3.3 and Heirloom mm don't seem to honor `.RP "" 2` as the DWB
.\" manual documents.  They start the table immediately after the
.\" reference list and go haywire boxing the table.  Bug in DWB.
.\" (You could work around it by using `.TS H` and `.TH`.)
.TS
box center;
L L C C C C
L L N N N N.
Program	System	Text	Data	Bss	Total
\&
/unix
\&	\*(pD	48064	2470	44040	94574
\&	\*(vX	34476	4292	39448	78216
\&	\*(iD	79976	11904	39208	131088
\&
C, pass 1
\&	\*(pD	36736	19826	17656	74218
\&	\*(vX	37520	29492	23512	90524
\&	\*(iD	60606	32192	24920	117718
\&
C, pass 2
\&	\*(pD	21248	6254	5246	32748
\&	\*(vX	23408	9092	7552	40052
\&	\*(iD	35652	9032	7560	52244
\&
ed
\&	\*(pD	10752	302	4390	15444
\&	\*(vX	11552	212	4556	16320
\&	\*(iD	21886	480	4576	26942
\&
grep
\&	\*(pD	4736	408	1906	7050
\&	\*(vX	4864	476	1936	7276
\&	\*(iD	11950	1160	1936	15046
\&
ls
\&	\*(pD	7104	768	3856	11728
\&	\*(vX	6884	1140	5764	13788
\&	\*(iD	15660	1920	5768	23348
\&
nroff
\&	\*(pD	29312	6684	7842	43838
\&	\*(vX	36360	9408	10636	58836
\&	\*(iD	\(em	\(em	\(em	\(em
\&
sort
\&	\*(pD	6656	1578	2104	10338
\&	\*(vX	6580	1764	2788	11132
\&	\*(iD	13886	2208	2792	18886
\&
.TE
.TB "Loaded Program Sizes (in bytes)."
