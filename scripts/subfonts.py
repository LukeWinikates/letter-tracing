import fontforge
import sys

file = sys.argv[1]

font = fontforge.open(file)

i = 0
for sf in font.cidsubfontnames:
    print("%d: %s" % (i, sf))
    i += 1
