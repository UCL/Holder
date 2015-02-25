#RSDT and EITT collaboration – Work plan and progress reportAt the beginning of February 2015, a member of UCL’s RSD team started collaborating with the EIT team and will be working on their software system on a 2 days/week basis. 
The EIT team has kindly prepared a shared folder for RSDT containing an updated version of the different subsystems and their source code. The overview workflow of the EIT Software System is represented in the following sequence diagram:

![Component Diagram](diagrams/EIT%20Software%20System%20Overview.png "Figure 2")

---

The next diagram represents an overview of all the components of the system, their interfaces and their authorship/management:

 
![Component Diagram](diagrams/ComponentDiagram.png "Figure 1")



---

RSDT has examined the code and come up with a management plan for EIT’s software system:

###Version Control
At the moment, there are different versions of the code, which are customizations of specific pieces of software depending on application. It would be very beneficial for the team to have a unique version of the software they can access and contribute to, keeping track of past releases. Thus, each member of the EIT team can develop new features or correct bugs in different branches that will then be submitted for other EITT colleague to code review before merging with the main branch.
 RSDT will provide training and guidance on how to version control the existing code using Git. At the beginning of March there will be hands-on training sessions on how to use Git followed by individual assessments for each member on how to version control the software they are managing. Most of RSDT effort to accomplish this task is expected to be spent in the first weeks of the collaboration while the EIT team members are learning and practising. RSDT will mentor them during the time of the collaboration to ensure this software management plan is adopted successfully.

###Automatic Testing
In the shared folder prepared by the EIT team, some of the components contain example data and source code fragments intended for testing purposes. However there is not a homogeneous automated procedure, and the testing currently in place may not be effective enough. 
The RSD team will mentor and assist in the creation of unit tests for subroutines of the code and regression tests of different functionalities to ensure the overall behavior of the EIT software system remains consistent. These tests will be managed by RSDT’s continuous integration service called Jenkins, with tests running automatically whenever code is uploaded to the Git repository, notifying developers upon failure. 

Time spent on this task depends on each of the team members’ ability to design and implement tests with RSDT’s guidance. Integration in Jenkins will be done by RSDT and checked and maintained by both. This will be a time consuming task for RSDT that will be performed gradually as the code is being refactored.

###Refactoring
This might be the most time-consuming and challenging task for RSDT. It’s difficult to come up with a time estimate without more information. The code has been reviewed, but needs to be examined in more detail in conjunction with the source code authors in order to give a good estimate. 
Refactoring includes:

* *Code  structure*:
The existing software has been created by different authors who have followed different programming methodologies. This is reflected in the heterogeneous structure of each of the system components. In the current version of the EIT software system, there is often duplication of code. For example, the CGAL mesher code for a human’s brain and a rat’s brain. Both pieces of software share most of the code, and their workflows are similar, so they need to be merged, made more modular and be parametized. This would improve readability and would make the code easier to test and debug. 

* *Coding conventions*:
indentation, variable naming, “magic numbers”, 

* *Adoption of other good practises*:
use a logging system instead of screen printouts, replace C++ structs with classes


###Documentation
There is existing documentation prepared by the EIT team in the form of README text files for each component and a few installation manuals and publications detailing the functioning of systems like the Forward Solver. Most of the code has comments on it, but they don’t follow the appropriate syntax for an automated documentation tool like Doxygen to generate consistent documentation. Thus, it would be beneficial for the EIT team to adopt this technique for future software development and replace the existing code-embedded documentation with a Matlab/C++ documentation style appropriate for this purpose.

RSDT will train the team on how to do this and assist on the generation of appropriate software documentation during all the collaboration. 
###Cross-platform Software Release
Some of the components in the EIT Software System work only in Windows or only in Linux. The EIT team has indicated that components like the Mesher that can only be executed in their Windows machines at the moment, would benefit from more RAM available in their Linux stations. It would also be convenient for external teams who use EIT’s software to have the choice to build the components they use in Linux or Windows.

###Collaboration with Third Parties - Black Rock?? 
Commercialization of software? Minimum amount of time for the code to be ready to be published? Which components are they interested in?

###Work Plan
The role of RSDT in this collaboration is to detect areas of improvement in the existing software system and mentor the EIT team on how to adopt software development good practises that will be beneficial to ensure their research software is reliable and reproductible.

The collaboration work has just started and more insight in the source code is needed in order to make a more specific work plan for the next months. Also, feedback from the EIT team members on prioritization of tasks would help.

RSDT has met with a few members of the EIT team and planned some initial objectives to be reached by the end of March:
* 2 short hands-on training group sessions on Git/Github/SmartGit for all software developers in the EIT team
* Upload of the EIT Software System as is on Github
* Individual guidance on how to apply version control on the code authored/managed by each EIT team member
* Installation of the Forward Solver in RSDT's Jenkins server for automatic testing

On a longer term plan, RSDT will continue examining the existing code and meeting with different EIT team members to work on their software targeting the areas mentioned in this report. The actual time schedule for completing each remaining task in the future needs more insight and depends on the ability and availability of each of the team members, and it's too early in the project to have an accurate estimate. 



