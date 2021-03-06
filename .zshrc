###########
#
# Oh-My-Zsh
#
###########

# Path to your oh-my-zsh installation.
export ZSH="/home/simon/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

#####################
#
# Aliases and Exports
#
#####################

# aliases
alias ooo="libreoffice"
alias pdf="mupdf"

# I use Vim
export VISUAL=vim
export EDITOR=$VISUAL

# Put handmade tools on my PATH
export PATH=/home/simon/bin:$PATH

#################
#
# SPARK2014 stuff
#
#################

# GNAT
MY_GNAT=/home/simon/gnat/install

# Langkit, libadalang
MY_LANGKIT=${MY_GNAT}/langkit_support
MY_LIBADALANG=${MY_GNAT}/libadalang
MY_GNATCOLL=${MY_GNAT}/gnatcoll

export PATH=${MY_GNAT}/gtkada:$PATH
export PATH=${MY_GNAT}/gnatcoll:$PATH
export PATH=${MY_GNAT}/xmlada:$PATH
export PATH=${MY_LANGKIT}:$PATH
export PATH=${MY_LIBADALANG}/bin:$PATH

export PATH=${MY_GNAT}/compiler/bin:$PATH # gnat, gcc
export PATH=${MY_GNAT}/codepeer/bin:$PATH # codepeer
export PATH=${MY_GNAT}/provers/bin:$PATH # cvc4, z3
export PATH=/home/simon/spark2014/install/bin:$PATH # gnatprove built from your local development
export PATH=${MY_GNAT}/gps/bin:$PATH # gnatstudio

export TEXINPUTS=/home/simon/latex//: # altran latex stuff
export TEXFONTS=/home/simon/latex//: # altran latex stuff

# Uncomment if using libadalang dev environment
#
#export GPR_PROJECT_PATH=${MY_LANGKIT}/share/gpr:${MY_LIBADALANG}/share/gpr:${MY_GNATCOLL}/share/gpr
#export LD_LIBRARY_PATH=${MY_LANGKIT}/lib:${MY_LIBADALANG}/lib:${MY_GNATCOLL}/lib:${MY_GNAT}/compiler/lib
#
# WARNING: SPARK2014 will not build if ~/gnat/install/gnatcoll/share/gpr is out
#  of sync with GAIA wavefront GNAT compiler.

export SPARK_LEMMAS_OBJECT_DIR=$HOME/lemma_obj
export IMPACTDB_EDITOR=$VISUAL
export IMPACTDB_PRODUCT=spark

# OPAM configuration
. /home/simon/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Convenience function for creating a gnatprove project file
function mk_default_gpr {
    # test.adc
    echo -e "pragma SPARK_Mode (On);\npragma Profile (Ravenscar);\npragma Partition_Elaboration_Policy (Sequential);" > test.adc

    # test.gpr
    echo "project Test is" > test.gpr
    echo "  package Compiler is" >> test.gpr
    echo '    for Default_Switches ("Ada") use ("-gnatdk", "-gnato13", "-gnatws");' >> test.gpr
    echo '    for Local_Configuration_Pragmas use "test.adc";' >> test.gpr
    echo "  end Compiler;" >> test.gpr
    echo "end Test;" >> test.gpr
}


#######################
#
# Google Cloud Platform
#
#######################

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/simon/.local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/home/simon/.local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/simon/.local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/simon/.local/share/google-cloud-sdk/completion.zsh.inc'; fi

###########
#
# Travis CI
#
###########

# added by travis gem
[ ! -s /home/simon/.travis/travis.sh ] || source /home/simon/.travis/travis.sh
