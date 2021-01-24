from PIL import Image
from os import listdir

def convertFile(infile):
	try:
		im = Image.open(infile)
	except IOError:
		print "error", infile
		return	
	i = 0
	pal = im.getpalette()

	try:
		while 1:
			im.putpalette(pal)
			new_im = Image.new("RGBA", im.size)
			new_im.paste(im)
			new_im.save(str(i) + "_" + infile.replace("gif", "png"))

			i += 1
			im.seek(im.tell() + 1)
	except EOFError:
		pass

for i in listdir("."):
	convertFile(i)
