# ENPM673 Perception for Autonomous Robots - Highway Lane Detection

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
---

Highway Lane Detection was a course project in the ENPM673 Perception for Autonomous Robots course. The project aims to detect straight and curved lanes on a highway to be used as a sub-system on a driverless vehicle. 

<p align="center">
<img src="https://github.com/bharatm11/Lane-Detection/blob/master/Output/Hough_lines.jpg">
</p>

## Algorithm

The algorithm used is as follows:

1. Read image

2. Convert to grayscale

3. Perform Sobel Edge Detection

4. Perform Morphological Operations to make edges more prominent and remove noise

5. Obtain processed image using a combination of the resulting image along with color detection (based on yellow and white) 

6. Extract the Region of Interest from the processed image

7. Extract Hough Lines from the resulting image based on certain conditions and perform curve fitting on the three most prominent lines to estimate the driving lanes


## Running Instructions

Make appropriate changes to the working directory to read Dataset.mp4

Run main.m




