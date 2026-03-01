"A Unix Operating System for the DEC VAX-11/780 Computer", Reconstructed
========================================================================

Reiser and London's paper documenting their preparation of UNIX/32V,[1]
a port of Seventh Edition Unix to the VAX-11/780, is an important
milestone in Unix development--as much I think for its frank critique of
C as "portable assembly" as for the status of the system documented: the
last common ancestor of the BSD and System III (and later System V)
branches of development.

Because the only version I've ever seen of this paper is a scan of,
possibly, a photocopy several generations removed from the original, I
thought I'd throw an OCR tool at it and see about reconstructing it, not
just for posterity but to put the groff implementation of mm to the
test.  So even if someone has a beautiful scan of this document
elsewhere, this exercise was worthwhile to me for what it has shown me
about the (initially "Programmer's Workbench", later "Documenter's
Workbench") mm macro package for troff and and groff's mostly compatible
reimplementation thereof.  Preparing this reconstruction drove numerous
improvements in groff mm, all of which appear in groff's 1.24.0 release.

You can find a pre-rendered PDF of this document under "Releases".

[1] London and Reiser do not use the name "UNIX/32V"; it seems likely
    that this label became attached later.
    [McIlroy](https://www.cs.dartmouth.edu/~doug/reader.pdf) and
    [Ritchie](https://www.nokia.com/bell-labs/about/dennis-m-ritchie/portpapers.html)
    applied it specifically to this work.
