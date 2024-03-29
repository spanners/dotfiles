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
  bgnotify
)

source ${ZSH}/oh-my-zsh.sh

#####################
#
# Aliases and Exports
#
#####################

alias ooo="libreoffice"
alias pdf="mupdf"

# I use Vim
export VISUAL=vim
export EDITOR=${VISUAL}

# Put handmade tools on my PATH
export PATH=${HOME}/bin:${PATH}

#################
#
# SPARK2014 stuff
#
#################

# GNAT
MY_GNAT=${HOME}/gnat/install
MY_SPARK=${HOME}/spark2014/install

export PATH=${HOME}/.local/bin:${PATH}

export PATH=${MY_GNAT}/compiler/bin:${PATH} # gnat, gcc
export PATH=${MY_GNAT}/codepeer/bin:${PATH} # codepeer
export PATH=${MY_GNAT}/provers/bin:${PATH} # cvc4, z3

export PATH=${MY_SPARK}/bin:${PATH} # gnatprove built from your local development environment
export PATH=${MY_SPARK}/libexec/spark/bin:${PATH} # gnatwhy3 built from your local development environment
export GPR_PROJECT_PATH=${MY_SPARK}/lib/gnat # include these GPR files as dependencies

export PATH=${MY_GNAT}/gps/bin:${PATH} # gnatstudio

export TEXINPUTS=${HOME}/latex//: # altran latex stuff
export TEXFONTS=${HOME}/latex//: # altran latex stuff

export LD_LIBRARY_PATH=${MY_GNAT}/compiler/lib:${LD_LIBRARY_PATH}
export SPARK_LEMMAS_OBJECT_DIR=${HOME}/lemma_obj
export IMPACTDB_EDITOR=${VISUAL}
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
    echo '    for Default_Switches ("Ada") use ("-gnatdk", "-gnat2020", "-gnatws");' >> test.gpr
    echo '    for Local_Configuration_Pragmas use "test.adc";' >> test.gpr
    echo "  end Compiler;" >> test.gpr
    echo "end Test;" >> test.gpr
}


# SVN diff with colour, piped into GNU Less
function svndiff () {
    svn diff $@ | colordiff | less -R;
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
