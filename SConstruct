import os

def cleanfiles(targetdir,auxfiletypes):
    liste = []
    [[liste.append(os.path.join(targetdir,m)) for m in os.listdir(targetdir) if m[-4:] == x] for x in auxfiletypes]
    #print liste
    return liste


#add builder for TeX using rubber
xetex = Builder(action = 'rubber --inplace -m xelatex $SOURCE ')
#auxilary files to delete when cleaning up
auxfiletypes = ['.log','.bak', '.aux','.bbl', '.blg' ,'.idx' ,'.brf' ,'.out' ,'.nlo' ,'.nls' ,'.ilg' ,'.ind' ,'.lof', '.lot','.toc']

targets =  ['einheit01','einheit02','einheit03','einheit04','einheit05','einheit06','einheit07','einheit08','einheit09','quicksheet','klausur1','klausur2','script']

# creating environment
env = Environment(BUILDERS = {'TeX' : xetex})

# Look in sage-directory for .sty files
env['ENV']['TEXINPUTS'] = ":.:" + os.getcwd()

# debug output..
print "BUILD_TARGETS is", map(str, BUILD_TARGETS)

env.Alias('klausur1', 'klausuren/2012/klausur1')
env.Alias('klausur2', 'klausuren/2012/klausur2')

# setting default target
#Default('einheit01')



# build environments for the units
for t in targets:
    # file for quicksheet
    if t == 'quicksheet':
        file = 'quicksheet.tex'
    elif t == 'klausur1':
        # file for exams
        file = 'klausuren/2012/klausur1/klausur1.tex'
        env.Alias('')
    elif t == 'klausur2':
        file = 'klausuren/2012/klausur2/klausur2.tex'
    elif t == 'script':
        file = 'script/script.tex'
    else:
        # files for units
        file = t + '/' + t + '.tex'
        file = t + '/zusammenfassung' + t[-2:] + '.tex'
    
    # add builder for path
    env.TeX(file)
    dir = os.path.dirname(file)
    if dir == '': 
        dir = '.'
    #print dir
    # create symlinks for xelatex-module of rubber
    if not os.access(dir + '/xelatex.py', os.F_OK):
        os.symlink(os.getcwd() + '/xelatex.py', dir + '/xelatex.py')
        os.symlink(os.getcwd() + '/xelatex.pyc', dir + '/xelatex.pyc')
    env.Clean(t, cleanfiles(dir,auxfiletypes))



#% : %/%.aux
#    while grep 'Rerun to get ' $(FILE).log ; do \
#    $(RUBBER) $(FILE) ; done
#    while grep 'Citation(s) may have changed' $(FILE).log ; do \
#    $(RUBBER) $(FILE) ; done
#
#xhtml : $(FILE).tex $(SRC) $(BIB)
#    #bibtex aufrufen?
#    htlatex $(FILE).tex "xhtml,jsmath,charset=utf-8" " -cunihtf -utf8" "-cvalidate"

#TODO: extractaufg : 

#TODO: convertslides : 

#TODO: exec ssh -t -L 8000:localhost:8000 $1@login.num.math.uni-goettingen.de sh -c 'hostname; exec ~/sagelocal port=8000'

