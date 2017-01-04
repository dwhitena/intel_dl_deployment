FROM tleyden5iwx/caffe-cpu-master

# install dependencies
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test
RUN apt-get update && \
    apt-get install -y \ 
    vim \
    gcc-4.9 \
    g++-4.9 \
    gcc-4.9-multilib \
    g++-4.9-multilib

# Use gcc 4.9
RUN update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-4.9 60 && \
  update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-4.9 60 && \
  update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 && \
  update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 60

# install the deep learning deployment tools
ADD l_deeplearningsdk_deploymenttool_2016.1.0.861.tgz .
ADD silent.cfg l_deeplearningsdk_2016.1.0.861
RUN cd l_deeplearningsdk_2016.1.0.861 && \
    ./install.sh -s silent.cfg

# build the inference samples
RUN cd /opt/intel/deep_learning_sdk_2016.1.0.861/deployment_tools/inference_engine/samples && \
    mkdir build && \
    cd build && \
    cmake /opt/intel/deep_learning_sdk_2016.1.0.861/deployment_tools/inference_engine/samples && \
    make

