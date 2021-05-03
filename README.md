## DESCRIPTION

This program is organized in two parts: finding and accounting.

Finding: written on GNU Octave, this part carries on the image processing logic,
which is currently based on de Canny edge detector. It takes the captured
images as input and outputs a binary image, containing the identified particles.

Accounting: written in C++ for speed, this part takes care of the translation of
the image data (from the binary images), into table data. It sweeps through all
the particles in all the binary images and generate .CSV files with more usefull
data for further analysis.

## REQUIREMENTS

This application was developed in a Linux environment, and the instructions were
written targeting Linux.
However, you should have no problem creating the necessary directories and
executing the GNU Octave scripts in a Windows machine, if you have GNU Octave
installed, of course.
In order to build the C++ application though, CMake is used. If you are familiar
with CMake, you should have no problem whatsoever, since CMake is
cross-platform. If you're not, I suggest you search on the Web, but I assure
you it's possible ;)

## USAGE

### Finding:

-   Create the requiring directories:

```bash
mkdir Images BWImages Data
```

-   Put the captured images into the /Images directory, and optionally use the
    trim.m script to select the area of interest in the images.
-   Execute the findParticles.m script:

```octave
octave findParticles.m
```

The output binary images should be in the /BWImages directory.
Now, in order to account the particles, you have to build the C++ part of the
application. To do so:

-   create a /build directory:

```bash
mkdir build
```

-   enter the /build directory:

```bash
cd build
```

-   run CMake:

```bash
cmake ../src
```

-   run Make:

```bash
make
```

-   move the executable to the root directory:

```bash
mv accountParticles ..
```

-   return to the root directory:

```bash
cd ..
```

### Accounting:

Now, just execute the accountParticles file:

```bash
./accountParticles
```

The .CSV files should now be in the /Data directory.
