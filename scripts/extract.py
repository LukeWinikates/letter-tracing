import fontforge
import sys

file = sys.argv[1]
subfont = int(sys.argv[2])
out = sys.argv[3]

font = fontforge.open(file)

font.cidsubfont = subfont
for g in font.glyphs():
    g.export(out + "/" + g.glyphname + ".svg")
