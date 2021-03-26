#FROM nvidia/cuda:9.1-cudnn7-devel-ubuntu16.04
#FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04  
#FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
FROM nvidia/cuda:11.2.0-devel-ubuntu18.04
MAINTAINER Nitin Kandpal <nitinsonu5@gmail.com>
RUN apt-get update && apt-get install -y \
        gcc \
        g++ \
        wget \ 
        build-essential \
        cmake \
        git \
        libgtk2.0-dev \
        pkg-config \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        python3 \
        python3-numpy \
        python3-dev \
        libtbb2 \
        libtbb-dev \ 
        libjpeg-dev \
        libpng-dev \ 
        libtiff-dev \ 
        libdc1394-22-dev \
        libv4l-dev \ 
        v4l-utils \
        qv4l2 \ 
        v4l2ucp \
        python2.7-dev \
        python-dev \
        python-numpy \ 
        python3-pip \
        sudo
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
#RUN pip3 install opencv-python
RUN pip3 install --upgrade pip
RUN pip3 install opencv-contrib-python
RUN apt update

# apt package installation
RUN apt install -y sudo apt-utils udev build-essential cmake git libqt5xml5 libopencv-dev python-opencv wget curl unzip
RUN DEBIAN_FRONTEND=noninteractive apt install -y libqt5svg5 libqt5gui5 libqt5widgets5 libqt5opengl5 unixodbc-dev libsybdb5 libglew-dev ttf-mscorefonts-installer freeglut3-dev libturbojpeg libjpeg-turbo8 curl libhidapi-dev libhidapi-libusb0


          
RUN cd \
        && pip3 install cython > 0.26 \
        && pip3 install numpy > 1.13



#RUN cd \
#       /usr/local/cuda-9.1/targets/x86_64-linux/lib/stubs/ \
#       /usr/local/lib/python3.5/dist-packages/pyzed/ \
#      && sudo ln -s /usr/local/cuda-9.1/targets/x86_64-linux/lib/stubs/libcuda.so libcuda.so.1

 
RUN mkdir -p /tensorflow/models
#RUN apt-get install -y git python-pip
RUN pip3 install tensorflow-gpu

RUN curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip

# Unzip
RUN unzip protoc-3.2.0-linux-x86_64.zip -d protoc3

# Move protoc to /usr/local/bin/
RUN mv protoc3/bin/* /usr/local/bin/

# Move protoc3/include to /usr/local/include/
RUN mv protoc3/include/* /usr/local/include/



RUN apt-get update && apt-get -y upgrade
RUN apt-get install python-pip -y



RUN pip3 install contextlib2
RUN pip3 install Pillow
RUN pip3 install lxml
RUN pip3 install jupyter
RUN pip3 install matplotlib
RUN git clone https://github.com/tensorflow/models.git /tensorflow/models
WORKDIR /tensorflow/models/research
RUN protoc object_detection/protos/*.proto --python_out=.
RUN export PYTHONPATH=$PYTHONPATH:'pwd':'pwd'/slim
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /root/.jupyter/jupyter_notebook_config.py



WORKDIR /
RUN pip3 install pandas
RUN pip3 install image-quality
RUN pip install supervisely
RUN pip3 install supervisely
RUN apt-get install -y python3-scipy 
RUN pip3 install keras-resnet
RUN git clone https://github.com/fizyr/keras-retinanet.git
#WORKDIR /keras-resnet
#RUN python3 setup.py build_ext --inplace
#WORKDIR /
EXPOSE 8888
EXPOSE 22
EXPOSE 5900

#CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/tensorflow/models/research/object_detection", "--ip='*'", "--port=8888", "--no-browser"]

CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/, "--ip=0.0.0.0", "--port=8888"]
