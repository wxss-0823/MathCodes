Program Name: 
------------
PETOOL v2.0 (Parabolic Equation Toolbox v2.0)

Licensing Provisions:
--------------------
GNU General Public License 3

Program Description: 
-------------------
A MATLAB-based one-way and two-way split-step parabolic equation software tool (PETOOL) with a user-friendly graphical user interface (GUI) for the analysis and visualization of 
radio-wave propagation over variable terrain and through homogeneous and inhomogeneous atmosphere.

Program Development:
-------------------
The program has been developed in MATLAB Release R2019a (version 9.6), and tested on Windows 7 and 10.
Partial Differential Toolbox", "Curve Fitting Toolbox" and "Mapping Toolbox" are REQUIRED to run the program.

Installation: 
------------
1. Install MATLAB (http://www.mathworks.com/) Release R2017a or higher on your system to run the program. 
2. Extract the file "PETOOL_v2.zip" to your hard disk.
3. Run MATLAB software and choose the folder you have initially extracted PETOOL. 
4. To run PETOOL, type petool in the MATLAB command window, or open petool.m with MATLAB editor and press F5.
5. Click the 2D or 3D analysis button on the small window opened after running the PETOOL. Depending on your choice, the main window of 2D or 3D analysis will appear.
6. Enter the input parameters and click "Run" button to start the analysis.

***** Please read the papers about the first and second versions and the user manual carefully before using the program. *****

What's New in v2.0:
------------------
(i) Several evaporation duct models have been developed. 
(ii) Real atmosphere data have been included in the form of "Binary Universal Form for Representation (BUFR)" data. 
(iii) Real terrain data have been incorporated into the toolbox in the form of "Digital Terrain Elevation Data (DTED)". 
(iv) A special add-on has been developed to generate a 3D coverage map of propagation factor/loss on real terrain data. 

Important Remark: 
----------------
The names of the directories ("User_Files" directory and its sub-directories, and "Maps" directory) must not be changed at all.

Journal Reference of the Previous Version: 
-----------------------------------------
O. Ozgun, G. Apaydin, M. Kuzuoglu, and L. Sevgi, PETOOL: MATLAB-based one-way and two-way split-step parabolic equation tool for radiowave propagation over variable terrain, Computer Physics Communications 182 (2011) 2638–2654.

Description of Files/Subdirectories in the Main Directory: 
---------------------------------------------------------
petool.m: Main file to run PETOOL
mainwindow.m & .fig: Files that open the main window for 2D analysis
mainwindow2.m & .fig: Files that open the main window for 3D analysis 

aboutgui.m & .fig: Files that open the “About” window to show the version number and contact info
Analysis_Parameter.m & .fig: Files that open the window to enter angle parameters in 3D analysis
BUFR_generation.m & .fig: External program that generates BUFR data.
bulk.p: Function that computes bulk parameters in evaporation duct models (used in Evaporation_Duct_Models.p)
closereq_mainwindow: Script that deletes internally used data files upon exiting  
Coordinates.m & .fig: Files that open the window to enter initial and final coordinates on DTED map
createbufr.m: Function that is used in BUFR_generation.m
duct_params_gui.m & .fig: Files that open the window to enter M-altitude pair in duct definition
elevated_duct_gui.m & .fig: Files that open the window to define the elevated duct
evaporation_duct_gui.m & .fig: Files that open the window to define the evaporation duct
Evaporation_Duct_Models.p: Function that computes the M profile and evaporation duct height using the evaporation duct models
filesave.m: Function that checks the values of the parameters during saving
fill_duct_window.m: Function that fills the parameter spaces in Atmosphere Parameters panel by using the data created by duct definition windows
gui_crosshair.m: Gui interface for reading (x,y) values from a plot
gui_height.m & gui_plot_height.m: Functions that are used to plot the propagation factor (or path loss) versus height (altitude) for a given range
gui_range.m & gui_plot_range.m: Functions that are used to plot the propagation factor (or path loss) versus range for a given height (altitude)
guimousevalue.m: Function that finds the current point on the Cartesian plot when the user moves the mouse over the plot
guimousevalue_polarplot.m: Function that finds the current point on the polar plot when the user moves the mouse over the plot
image_gui.m & .fig: Files that open a figure window during .tiff file saving
polarPcolor.m: Function that plots a pseudocolor plot of matrix Z for a vector radius R and a vector angle theta
range_angle_plotanalysis.m & .fig: Files that open a window for azimuthal coverage map at an altitude
readbufr.m: Function that is used in evaporation duct window to read BUFR data 
SSPE_function.m: Main function that implements one-way and two-way SSPE algorithms
standard_gui.m & .fig: Files that open the window to define the standard atmosphere
surface_based_duct_gui.m & .fig: Files that open the window to define the surface based duct
surface_gui.m & .fig: Files that open the window to define the surface duct
terrain_gui2.m & .fig: Files that open the window to enter the range value for terrain definition
terrainparams_gui.m & .fig: Files that open the window to enter the range-altitude pair for terrain definition
user_defined_duct_gui.m & .fig: Files that open the window to define the user defined duct
warning_gui.m & .fig: Files that open the warning window

defaultinputs.mat & inputfigs.mat: Data files that store default input values and image files

“Maps” directory is used to store DTED files. The map for Turkey is provided by default.
“User_Files” directory is used to store user files. 
“MANUAL” directory includes the manual files, the readme file, the license file and two movie files that show the usage of PETOOL.


Contact:
-------
You can send your questions, suggestions or bug reports to: 
Dr. Ozlem Ozgun
email: ozgunozlem@gmail.com
web: http://www.ee.hacettepe.edu.tr/~ozlem/ 
