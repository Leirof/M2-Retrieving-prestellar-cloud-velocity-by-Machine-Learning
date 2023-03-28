#!/bin/bash

#OAR -n "Jupyter Session"
# Pour utiliser tout le serveur gpu tesla avec un temps limite de 500h
#OAR -l /nodes=1,walltime=20:00:00
#OAR -t tesla
#OAR -t besteffort
#OAR -O logs/jupyter.log
#OAR -E logs/jupyter-error.log

echo " " > logs/jupyter-error.log
echo " " > logs/jupyter.log

export http_proxy=http://11.0.0.254:3142/
export https_proxy=http://11.0.0.254:3142/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64

cd ~/M2-Prestel-state-from-obs-ML
NSLOTS=$(cat $OAR_NODEFILE | wc -l)

echo $NSLOTS

source ~/M2-Prestel-state-from-obs-ML/venv/bin/activate

~/M2-Prestel-state-from-obs-ML/venv/bin/python ~/M2-Prestel-state-from-obs-ML/venv/bin/jupyter-lab --no-browser --port 25565 --IdentityProvider.token=c7b927e4bd9ad9f008a2491c40b8f5d4790945a935674a6e --ServerApp.allow_origin='*'

exit 0
