Description:
-----------------------

This application will allow a user to submit a job on the [Texas Advanced Computing Center (TACC)](https://www.tacc.utexas.edu/) [Lonestar6 Supercomputer](https://www.tacc.utexas.edu/systems/lonestar6) to utilize [PyReconstruct](https://github.com/SynapseWeb/pyReconstruct#pyreconstruct); the Python functionality of the 3D image reconstruction software [RECONSTRUCT](https://synapseweb.clm.utexas.edu/software-0).

Running the Application:
-----------------------
To run the application, the user must submit a job using the [3D Electron Microscopy (3Dem)](https://3dem.org/) web-based research platform. Once running, a virtual DCV session will be initialized for the user, and a button on the History/Jobs page will appear allowing the user to open the session. Additionally, a document titled 'PyReconstruct_dcvserver.txt' will be created in the user's work folder with connection instructions. Once connected, the PyReconstruct software will begin running, and a Tapis jobs archive folder will appear on the desktop for the user's convenience.

For instructions on using PyReconstruct, please see the [documentation](https://github.com/SynapseWeb/pyReconstruct#the-main-window).

 Acknowledgements:
---------------------

PyReconstruct was developed by the [Harris Lab](https://synapseweb.clm.utexas.edu/harrislab) of the [University of Texas at Austin's](https://www.utexas.edu/) [Center for Learning and Memory](https://clm.utexas.edu/). Reconstruct was written by John C. Fiala, Ph.D. For more information, see [Reconstruct History](https://sites.cns.utexas.edu/synapseweb/reconstruct-history) and [Citations](https://sites.cns.utexas.edu/synapseweb/citations).

Harris KM, Spacek J, Bell ME, Parker PH, Lindsey LF, Baden AD, Vogelstein JT, Burns R (2015) A resource from 3D electron microscopy of hippocampal neuropil for user training and tool development. Sci Data Sep 1;2:150046. PMCID: PMC4555877. ([PDF](https://sites.cns.utexas.edu/sites/default/files/synapseweb/files/2015_sci_data_harris_burns_a_resource_from_3dem.pdf); [Tables](http://www.nature.com/articles/sdata201546/fig_tab)) 

Reconstruct was created with funding, in part, from the National Institutes of Health and the Human Brain Project under grants (P30 HD18655, R01 MH/DA 57351, and R01 EB 002170).

Permission to use, copy, and redistribute Reconstruct is granted without fee under the terms of the GNU General Public License version 2 as published by the [Free Software Foundation](http://www.gnu.org/). 

(This software is distributed in the hope that it will be useful, but without any warranty, including the implied warranty of merchantibility or fitness for any particular purpose. For details read the terms of the GNU General Public License when installing the software.)
