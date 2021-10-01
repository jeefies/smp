import sys
from subprocess import call

def c(cmd):
    return call(cmd, shell = True)

file = sys.argv[-1]
with open(file) as f:
    l = f.read().split()

libs = []
for i in l:
    if i:
        libs.append(i.strip())
cmd = "sudo apt install {} -y".format(' '.join(libs))

while c(cmd):
    pass
