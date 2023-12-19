#!/usr/bin/env bash

printf "FASE COPIA\n"
git clone https://github.com/open-mmlab/mmpretrain.git mmclassification
cd mmclassification
git checkout 58b21ee
cd ..
git clone https://github.com/zhyever/Monocular-Depth-Estimation-Toolbox.git Monocular-Depth-Estimation-Toolbox
cd Monocular-Depth-Estimation-Toolbox
git checkout 86d1248
cd ..
git clone https://github.com/zhyever/pytorch-image-models-mobileAI2022.git pytorch-image-models
cd pytorch-image-models
git checkout 50a3df1
cd ..
git clone https://github.com/jonbarron/robust_loss_pytorch.git robust_loss_pytorch
cd robust_loss_pytorch
git checkout 9831f1d
cd ..

conda install -y pytorch==1.8.0 torchvision==0.9.0 torchaudio==0.8.0 cudatoolkit=11.1 -c pytorch -c conda-forge
# conda install -y pytorch==1.8.0 torchvision==0.9.0 torchaudio==0.8.0 cpuonly -c pytorch -c conda-forge
pip install mmcv-full==1.4.3 -f https://download.openmmlab.com/mmcv/dist/cu111/torch1.8.0/index.html
cd Monocular-Depth-Estimation-Toolbox && pip install -e . && cd ..
cd mmclassification && pip install -e . && cd ..
pip install timm
conda install opencv