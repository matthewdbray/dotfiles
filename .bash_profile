alias ki='/usr/local/krb5/bin/pkinit mdbray@HPCMP.HPC.MIL'
alias kk='/usr/local/krb5/bin/kinit mdbray@HPCMP.HPC.MIL' 
alias shell='/usr/local/ossh/bin/ssh -X mdbray@garnet.erdc.hpc.mil'
alias huey='/usr/local/ossh/bin/ssh -X mdbray@us1.erdc.hpc.mil'
alias sftp='/usr/local/ossh/bin/sftp mdbray@garnet.erdc.hpc.mil'
alias h_sftp='/usr/local/ossh/bin/sftp mdbray@us.erdc.hpc.mil'
alias scp='/usr/local/ossh/bin/scp'
alias shutdown='sudo shutdown -h now'
alias la='ls -la'
alias ll='ls -ll'
alias restart='sudo shutdown -r now'
alias get_h5='sudo /usr/bin/get_h5.sh'
alias get_h5_surf='sudo /usr/bin/get_h5_surf.sh'
alias xdmf_concat='python /Users/matthewbray/Desktop/Python/xdmf_concat.py'
alias AsciiToXdmf='python /Users/matthewbray/Desktop/Python/AsciiToXdmf.py'
alias j_sftp='/usr/local/ossh/bin/sftp mdbray@jade01.erdc.hpc.mil'
alias jade='/usr/local/ossh/bin/ssh -X mdbray@jade01.erdc.hpc.mil'
alias diamond='/usr/local/ossh/bin/ssh -X mdbray@diamond01.erdc.hpc.mil'
alias d_sftp='/usr/local/ossh/bin/sftp mdbray@diamond01.erdc.hpc.mil'
alias copper='/usr/local/ossh/bin/ssh -X mdbray@copper01.ors.hpc.mil'
alias c_sftp='/usr/local/ossh/bin/sftp mdbray@copper01.ors.hpc.mil'
alias cdg='cd /Users/matthewbray/Desktop/Geosites/'
alias scp='/usr/local/ossh/bin/scp'
alias cda='cd ~/git/apod-dev/src/'
alias ipy='ipython notebook --pylab=inline'

export PS1='\[\e[0;31m\]\u\[\e[0m\][\e[1;31m\]@\[\e[0m\]\[\e[0;31m\]\H\[\e[0m\]] \w $ '
fancy_prompt() {
   local blue =$(tput setaf 4)
   local purple=$(tput setaf 5)
   local reset=$(tput sgr0)
   PS1="\[$blue\]\h:\[$purple\]\w\[$reset\]\\$ "
}

shopt -s checkwinsize

#Prompt color

export TERM=xterm-color
export PS1="\[\e[36;1m\]\u@\[\e[32;1m\]\H> \[\e[0m\]"
export MACHINE_TYPE=`uname -s`
export SYSDIR=$HOME/ext
export PREFIX=$SYSDIR/$MACHINE_TYPE
export PATH=$PREFIX/bin:$PATH
export PATH=$scripting/src/tools:$scripting/$MACHINE_TYPE/bin:$PATH
export LD_LIBRARY_PATH=$PREFIX/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/Users/matthewbray/Library/Enthought/Canopy_64bit/User/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/Users/matthewbray/git/meshpy/build/lib.macosx-10.6-x86_64-2.7/meshpy
export MANPATH=$PREFIX/man:$MANPATH
#export C_INCLUDE_PATH=/opt/local/include
#export CPLUS_INCLUDE_PATH=/usr/include/c++/4.2.1/
#export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/
#export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/c++/4.2.1/tr1
#export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/sys
#Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PYTHONPATH=$PYTHONPATH:/Users/matthewbray/Library/Enthought/Canopy_64bit/User/lib/python2.7/site-packages
export PYTHONPATH=$PYTHONPATH:/Users/matthewbray/Desktop/Python/MyModules
export PYTHONPATH=$PYTHONPATH:/Users/matthewbray/git/meshpy/build/lib.macosx-10.9-x86_64-2.7/
export PYTHONPATH=$PYTHONPATH:./bin
PATH=$PATH:.:$scripting/$MACHINE_TYPE/bin
export PATH
#export PATH=/usr/local/bin:$PATH
export scripting=$HOME/scripting
#PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH
export MAGICK_HOME="$HOME/Bin/ImageMagick-6.7.3"
export PATH="$MAGICK_HOME/bin:$PATH"
export DYLD_LIBRARY_PATH="MAGICK_HOME/lib/"
##
# Your previous /Users/matthewbray/.bash_profile file was backed up as /Users/matthewbray/.bash_profile.macports-saved_2011-11-16_at_17:36:28
##
#MacPorts Installer addition on 2011-11-16_at_17:36:28: adding an appropriate PATH variable for use with MacPorts.
# Finished adapting your PATH environment variable for use with MacPorts.
export WSCP=mdbray@garnet.erdc.hpc.mil:/lustre/work1/mdbray
export HSCP=mdbray@garnet.erdc.hpc.mil:/lustre/home1/u/mdbray
export RSCP=mdbray@garnet.erdc.hpc.mil:/lustre/work1/u4gsgrvk/raju

# Setting PATH for EPD-7.3-1
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
#export PATH

MKL_NUM_THREADS=1
export MKL_NUM_THREADS

# Added by Canopy installer on 2013-05-08
#source /Users/matthewbray/Library/Enthought/Canopy_64bit/User/bin/activate

# added by Anaconda 1.6.1 installer
# export PATH="/Users/matthewbray/anaconda/bin:$PATH"

# added by Anaconda 2.1.0 installer
# export PATH="/Users/matthewbray/anaconda/bin:$PATH"

export PATH=/Users/matthewbray/usr/local/bin:$PATH
export PATH=./:$PATH
