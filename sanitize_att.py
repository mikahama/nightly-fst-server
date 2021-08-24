import sys
from mikatools import *

file = sys.argv[1]
att = open_read(file).read()
att = att.replace("	 	 	0.000000", "	@SPACE@	@SPACE@	0.000000")
att = att.replace("	?	?	0.000000", "	%?	%?	0.000000")
att = att.replace("	0	0	0.000000", "	%0	%0	0.000000")
att = att.replace("	%	%	0.000000", "	%%	%%	0.000000")
att = att.replace("	\"	\"	0.000000", "	%	%	0.000000")
att = att.replace("	:	:	0.000000", "	@COLON@	@COLON@	0.000000")
att = att.replace("					0.000000", "	@TAB@	@TAB@	0.000000")
att = att.replace("	 	", "	@SPACE@	")
att = att.replace("	ε	", "	@0@	")
out = open_write(file)
out.write(att)
out.close()

