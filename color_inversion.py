import py_compile
from PIL import Image
import PIL.ImageOps 
import sys

# def main():	

	# load image
	pitchfork_image = Image.open("pitchfork-logo-300x300 copy.jpg")

	pixel = pitchfork_image.load
	
	# iterate pixels
	for x in range(300): 
		sys.stdout.write('New Row')
		for y in range(300):
			# get RGB tuple
			rgb = pix[x,y]
			# switch to HEX
			print rbg
			# hex_val = rgb_to_hex(rgb)
			# invert hex

			# shift back to RBG
			# overwrite current RGB
	# print "Completed\n"
	return 0

def rgb_to_hex(rgb):
	return '%02x%02x%02x' % rgb

def hex_to_rgb(value):
	value = value.lstrip('#')
	lv = len(value)
	return tuple(int(value[i:i+lv/3], 16) for i in range(0, lv, lv/3))