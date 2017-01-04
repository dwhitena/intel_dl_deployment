# A Docker-ized Version of Intel's Deep Learning Deployment Tool

This docker image includes:

- [Caffe](http://caffe.berkeleyvision.org/)
- [Intel's Deep Learning SDK deployment tool](https://software.intel.com/en-us/deep-learning-sdk)
- [Intel's Deep Learning Plugin for MKL](https://software.intel.com/en-us/articles/introducing-dnn-primitives-in-intelr-mkl)

With this image you can:

1. Optimize trained networks.
2. Interact with the optimized networks via the inference engine API for C++.

The example C++ applications utilizing thei inference engine have been built in the Docker image, so you can spin things up quickly and start predicting!
