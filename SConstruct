import os

def cleanfiles(targetdir,auxfiletypes):
    liste = []
    [[liste.append(os.path.join(targetdir,m)) for m in os.listdir(targetdir) if m[-4:] == x] for x in auxfiletypes]
    #print liste
    return liste


#auxilary files to delete when cleaning up
#auxfiletypes = ['.log','.bak', '.aux','.bbl', '.blg' ,'.idx' ,'.brf' ,'.out' ,'.nlo' ,'.nls' ,'.ilg' ,'.ind' ,'.lof', '.lot','.toc']

targets =  ['einheit01','einheit02','einheit03','einheit04','einheit05','einheit06','einheit07','einheit08','einheit09','quicksheet','klausur1','klausur2','script']

# creating environment
env = Environment(ENV = os.environ, PDFLATEX = 'xelatex')

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
        file = t + '/quicksheet.tex'
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
        env.PDF(file)
        file = t + '/zusammenfassung' + t[-2:] + '.tex'
    
    # add builder for path
    env.PDF(file)
    dir = os.path.dirname(file)
    #if dir == '': 
    #    dir = '.'
    #print dir
    #env.Clean(t, cleanfiles(dir,auxfiletypes))


#xhtml : $(FILE).tex $(SRC) $(BIB)
#    #bibtex aufrufen?
#    htlatex $(FILE).tex "xhtml,jsmath,charset=utf-8" " -cunihtf -utf8" "-cvalidate"

#The other environment variables that control the executables (and their default values) are:
#    env['TEX']      = 'tex'
#    env['TEXFLAGS'] = SCons.Util.CLVar('-interaction=nonstopmode -recorder')
#
#    env['PDFTEX']      = 'pdftex'
#    env['PDFTEXFLAGS'] = SCons.Util.CLVar('-interaction=nonstopmode -recorder')
#
#    env['LATEX']        = 'latex'
#    env['LATEXFLAGS']   = SCons.Util.CLVar('-interaction=nonstopmode -recorder')
#
#    env['PDFLATEX']      = 'pdflatex'
#    env['PDFLATEXFLAGS'] = SCons.Util.CLVar('-interaction=nonstopmode -recorder')
#
#    env['BIBTEX']      = 'bibtex'
#
#    env['MAKEINDEX']      = 'makeindex'

#TODO: exec ssh -t -L 8000:localhost:8000 $1@login.num.math.uni-goettingen.de sh -c 'hostname; exec ~/sagelocal port=8000'

