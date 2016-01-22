# Constants
HOME=/home/condauser
BASH_RC=/home/condauser/.bashrc
PREFIX=/home/condauser/anaconda3

PY3PATH=$PREFIX/bin
PY2PATH=$PREFIX/envs/python2/bin

# python 3
CONDA3=$PY3PATH/conda
PIP3=$PY3PATH/pip

# python 2
CONDA2=$PY2PATH/conda
PIP2=$PY2PATH/pip

# Install and remove file
bash $HOME/Anaconda.sh -b -p $PREFIX

# make anaconda's python default for our user
echo "
# added by Anaconda-Notebook
export PATH=\"$PY3PATH:\$PATH\"" >> $BASH_RC

hash -r
$CONDA3 config --set always_yes yes --set changeps1 no

# additional packages to install
$CONDA3 install --yes seaborn numpy scipy matplotlib pyzmq flake8 ipython-notebook

# python 2 environment
$CONDA3 create --yes -n python2 python=2 pip numpy scipy matplotlib pyzmq ipython-notebook
# ipython setup
$PY3PATH/ipython profile create default --ipython-dir $HOME/.ipython
chown condauser:condauser $HOME/.ipython/profile_default/security -R
mkdir $HOME/notebooks
cp -a /tmp/notebooks $HOME/notebooks

# cleanup
rm -rf $HOME/Anaconda.sh
rm -rf $HOME/temp
