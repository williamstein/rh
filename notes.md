## Critical TODO (_not_ just trivial typos)

- (0:15?) (done) P. 98, 99: "Figure ??"

- (DONE) (easy) We use "Riemann Spectrum" half the time and "Riemann spectrum" the other half. [[Changed to "Riemann spectrum" since that was used 18 times, but "Riemann Spectrum" only 12 times.  Also, this doesn't quite raise to the level of "Riemann Hypothesis", which we always capitalize when it is not a quote.]]

- (DONE) People to thank: Will Hearst, Nicola Dunn, David Mumford, James Prop, Keith Conrad, Chris Swenson, Karl Crisman, Robert Harron,  Bill Gosper, Dan Asimov, Andrew Granville, Harald Bögeholz, Keren Binyaminov, Michael J. Gruber, G+ thread people? Who else??  [[I added a footnote on page 9 with everybody I could find -- \footnote{Including
Dan Asimov, Keren Binyaminov, Harald B\"{o}geholz, Louis-Philippe Chiasson, Keith Conrad, Karl-Dieter Crisman, Nicola Dunn, Thomas Egense, Bill Gosper,  Andrew Granville, Michael J. Gruber, Robert Harron,  William R. Hearst III, David Jao, Fredrik Johansson, David Mumford, James Propp, Andrew Solomon, Dennis Stein, and Chris Swenson.}"]]

- (DONE -- we don't agree) (Nicola Dunn <djonma@gmail.com>) Page 70, First paragraph. "the older form being specere and the later form spectare". I'm fairly certain that spectare is incorrect, and specere could be seen as being incorrect as well, as specere is the present infinitive of the word specio.  Spectrum is the word you're looking for instead of spectare. Spectare is the present infinitive of specto, which has the same root as spectrum (Latin not English), but our word spectrum comes from Latin spectrum, not specto. This is, however, my view of rather little Latin study and lots of looking it up online, where all of the etymology sites I normally use have our spectrum coming from Latin spectrum.

- (done) #now (0:12) (0:05?) double check this residue claim:
        It has a residue after division by $N$ of\\ $3334581100595953025153969739282790317394606677381970645616725285996925$\textbackslash\newline$
         6610000568292727335792620957159782739813115005451450864072425835484898$\textbackslash\newline$
         565112763692970799269335402819507605691622173717318335512037458$.
[[WOW, it really was wrong!  'The "it" was 2^(N-1) instead of 2^(N-1)-1.  Crazy.]]

- (DONE -- took 1:14)  (0:30?) (Nicola Dunn <djonma@gmail.com>) Page 134, third paragraph. - I'm mostly assuming that you know about this, but just in case; there's a 'To be done' section here awaiting a picture. There's a lovely picture here too: http://mathworld.wolfram.com/GaussianPrime.html Though as you're using SageMath and Wolfram is a competing product, perhaps you won't like that. Sage Code is here: http://sagecell.sagemath.org/?q=vqqecj


- (maybe done?) Serious concern by an analyst (Michael J Gruber): Here I suggest to at least use clopen intervals (a,b] so that the splitting formula for the integral later on is correct.  This becomes visible again when the Dirac distribution is defined through integrals over intervals - but not when one endpoint is 0. From the point of view of an analyst, the whole section worries me a bit: it is a description of Stieltjes measures, not of distributions. It suffices for \delta, of course, but not for \delta', and I'm wondering whether it gives the right impression of the nature of distributions. [[I did make the change to clopen intervals.]]


## Might be nice to do (not critical)

- (Nicola Dunn <djonma@gmail.com>) Whole text. There is no attribution for any of the photos / paintings. For example, the painting of Isaac Newton was painted in 1689 (at age 46) by Godfrey Kneller. If you don't have time to find these attributions, do let me know and I'll hunt down as many as I can find. I feel it's important to attribute work to the original artist. If you took the photos yourself, you should say so.

- Your choice of whether to put commas in numbers over 1,000 is inconsistent.  [[William: should we just remove all commas? We could.]]

- (Nicola Dunn <djonma@gmail.com>) There is no index, so it is not necessary to renumber it, though I must say I am a little disappointed to see no index.



## Complaints that I want to ignore

- From Karl Crisman:

   -  (At this point I will say that the style of the sentences is not my cup of tea.  Lots of commas rather than new sentences, and so forth, awkward phrasing like "This ubiquitous use to which giant primes are put".  But I will pass all that by tacitly.  I assume you do have some kind of editor from AMS or someone for this, right?)   [[Not AMS.  And I flatly disagree.]]

   - page 41: really is it that much trouble to have an entire picture of a slide rule?  Looks a little unprofessional.  In general the stock images etc. does make the production value look less - it's just very standard LaTeX, right?   [[I completely disagree.]]

   - page 64: Did you want to label the axes by multiples of pi or not?  [[I don't.  I think it only confuses readers given our point.]]

   - page 65: Or you could use sine waves with 200 Hz or 440 Hz instead of the usual ones.  Or really do C and E and not just those made-up ones.  [[Not necessary, and would require units.]]

   - page 138: why Fermat test?  My understanding is that Master Sun (of the Chinese Remainder Theorem) already used this for a=2 hundreds of years earlier.  [[We say why.]]

## Cover

Lots of people don't like certain technical details about the cover:

> when I see that cover I can't help but make an aesthetic objection: Why couldn't the designer just let the Zeta function's own, perfectly beautiful form do it's thing? Why artificially insert the sharp red border on it like that? The 'natural border' of this region of the function would do perfectly well by itself... It seems like a gorgeous design concept that lost something during execution. Still not bad looking overall, but it could be much better!

> I also dislike the cover, just in case the future design takes ideas from this; the colours make it very difficult to read the title for me.

> As for the cover, go more minimalistic, stronger Zeta function colors and center the text in the red area.  Perhaps make the Zeta 1/3 of the total cover space. Drop the picture and blue wave and use a font with more geometric features (uniform element thickness throughout the characters' elements).



## To the copy editor /production people

Issues, which need to get fixed in production:


- From a reader:
> Page numbering system: Whilst this works for a pdf, or other electronic version of the book, if the book is to be published as a physical version, counting the cover as page one will not work. In fact the foreword should be numbered using roman numerals and page one should be the first actual page of the text. This varies depending on the publisher, but these are the generally accepted rules. As such, it may be necessary to renumber the contents section.

- From a reader:
> Contents - This will vary depending on publisher preference, but sometimes the foreword and endnotes should be included within the contents.

- From a reader:
> Pages 5-8 inclusive. Each of these pages, whilst being in the Foreword, have CONTENTS at the top, as though they belong to the Contents section. Whilst this may have been intentional, it reads oddly, as surely they belong to the Foreword section, not the Contents section. [[This is the fault of the style file I happened to use...]]

- A reader says:
> You have chosen to use emdash, and therefore no spacing between words and emdash, which is stylistically correct. I personally prefer endash, or simply dash, with spaces. It makes it easier to read for people who struggle with such things. However this isn't an error, merely a suggestion from someone who struggles with dyspraxia and reading issues.

- Our endnote figures aren't labeled properly to be in an endnotes chapter -- can you fix this?
> Endnotes. You label each figure in the endnotes as though it belongs to chapter 38. Whilst I can understand why, it's not strictly correct; the figures belong to the Endnotes section. Perhaps they could be relabelled E.1, E.2, etc. That could just be my personal preference though, so feel free to ignore it.

- One reader was concerned because the figures have a different typeface than the text.

- "zeros" vs "zeroes"?  We are consistent, but which should we use?

- (Karl Crisman) page 35 and elsewhere: I wonder if you might want to LaTeX the ticks for the various graphs.  They look weird being in a different typeface.  Use  tick_formatter="latex".  [[Question for production department: how do you want us to re-do all text in figures?]]

