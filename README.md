This is an interface code for calling the PyTorch-trained REANN model in Fortran programs with LibTorch.

1. For efficiency, this interface code only work with **fixed cell** (or supercell), 
   It's also easy to modify the corresponding code to work with unfixed cell if necessary.

2. software requirements:
   ```bash
   CMake              3.19.3
   libtorch-CPU/GPU   1.12.1
   CUDA               11.3  (only necessary if you want to use GPU)
   gcc/g++/gfortran   9.2.0
   ```
   Test based on the software with the version mentioned above has been done.
   If you use different version, it's necessary to test by yourself.

3. The path of the libtorch library is set in src/CMakeLists.txt as below
   for cpu,
   ```bash
   SET(CMAKE_PREFIX_PATH     /public/home/xjf/proj-22-0117/lammps/lammps-libtorch-1.10/pkg/libtorch-1.12.1-cpu)
   ```
   for gpu,
   ```bash
   SET(CMAKE_PREFIX_PATH     /public/home/xjf/proj-22-0117/lammps/lammps-libtorch-1.10/pkg/libtorch-1.12.1-gpu)
   ```
   Before compiling the code, modify it to your own path.

4. The whole code with this interface code is recommended to 
   be compiled with GCC/GFortran due to the compiled libtorch.
   If you want to use icc/ifort (Intel fortran compiler), it would
   be necessary to compile the libtorch from the source code with icc at first,
   or it will cause error.

5. This interface code has only been tested on potential energy surfaces trained based on REANN-github-0408/ . 
   It is recommended to use the accompanying REANN-github-0408 to train the corresponding potential energy surface. 
   If using other versions, there may be compatibility issues, and you may need to modify the corresponding interface 
   code by yourself.

6. More information could be seen in the simple document in doc/.

Disclimer:
There is no guarrantee for the code that is bug free. The users are responsible for their own results.
Basic Knowledge about C, C++ (especially the pointer), Fortran, and CMake is necessary and helpful to use 
and modify this code.
