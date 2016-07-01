from PIL import Image
import PIL.ImageOps    

image = Image.open('pitchfork-logo-300x300.png')

inverted_image = PIL.ImageOps.invert(image)

inverted_image.save('pitchfork-logo-300x300.png')