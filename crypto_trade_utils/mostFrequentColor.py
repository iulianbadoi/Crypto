from os import walk
from PIL import Image
import urllib.request
import time

f = []
mypath ="C:\\Users\\user\\Desktop\\python_colors\\color\\"
for (dirpath, dirnames, filenames) in walk(mypath):
	for name in filenames:
		im = Image.open(mypath + name);
		rgb_im = im.convert('RGB')
		colors = rgb_im.getcolors()
		freqColor = 0
		for color in colors:
			if(color[1][0] == 255 and color[1][1] == 255 and color[1][2] == 255):
				continue
			if(freqColor < color[0]):
				freqColor = color[0]
				actualColor = color[1]
		name = name.replace(".png","");
		usage= "https://thisisshitfuckit.herokuapp.com/updateColor?short="+name+"&r="+str(actualColor[0])+"&g="+str(actualColor[1])+'&b='+str(actualColor[2])
		usage=usage.replace(" ", "")
		contents = urllib.request.urlopen(usage).read()
		print (usage)
		time.sleep(0.5)
		exit
		
		
		