# SIA 3DEN Mission Framework

Eden Editor extension for SIA's Mission Framework.  Made for the purpose of making it easier to configure the framework.

## Building Addons
### Requirements for building:
Note: These requirements are subject to change.  If you have problems building in the future, check back here.

- Arma 3 Tools
- project (P) drive
- Python version >= 3.0

### Build Instructions
1. Ensure that the folder that contains the ``addons`` folder is named ``SIA_3DEN_framework``.
2. Setup the project drive (P:\\)
	- Ensure that there is no current drive with the 'P' label
	- Open Arma 3 Tools
	- Click the "Mount the Project Drive" button located in the "Other" section
		- Note that you will have to do this every time you restart your computer.
	- Optionally, run the ArmA3p program from [Mikero Tools](https://mikero.bytex.digital/Downloads).  This will also require you to install a few other programs from the same page.  This will copy and de-pbo all of Arma's game files to the project drive, which is required for some other projects.  Currently, this is not required, but it may become required if I decide to change the way the mod is built.  Note that this can take multiple hours due to how the program extracts PBOs
3. Run the ``setup.py`` script.  Ensure that the detected paths AND the paths above them are correct.
4. Run the ``make.py`` script.  This should build the mod into ``.\release\@SIA_3DEN_framework``.