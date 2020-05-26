# Neuropythy Tutorials

A set of tutorial notebooks for [neuropythy](https://github.com/noahbenson/neuropythy).

**Author**: Noah C. Benson &lt;[nben@nyu.edu](mailto:nben@nyu.edu)&gt;

This github repository encodes a set of tutorials for the neuropythy software
library. This repository is currently under construction, but as of 2020-05-26, the
ROI-drawing tutorial is available.

The tutorials themselves are in notebooks (`work/*ipynb` in this repository) that
can be executed inside of a [docker](https://docker.com/) container. In order to
run this tutorial, you will need to have docker installed (or, you can install all
the python dependencies locally, but docker is generally easier). In addition, if you
want to use a Human Connectome Project (HCP) subject as your example subject, you
will also need a set of Amazon S3 credentials from the HCP. To obtain these
credentials, visit their [database site](https://db.humanconnectome.org/),
register for the site, then request Amazon S3 credentials for the 1200 subject
release (see the ["Getting HCP Credentials" section](#credentials) below for
detailed instructions).

To run the tutorial, make sure that your local port 8888 is free, then perform
the following:

```bash
# In bash:
> git clone https://github.com/noahbenson/neuropythy-tutorials
...
> cd neuropythy-tutorials
# Optional: Export our HCP credentials; if you have credentials in a file:
> export HCP_CREDENTIALS="`cat ~/.hcp-passwd`"
# ... Or if you just have them as a key and secret:
> export HCP_CREDENTIALS="<key>:<secret>"
# Start the jupyter notebook server by bringing up the docker
> docker-compose up
```

This last command should produce a large amount of output as the docker container is built
and started. Once it has started, it should finish by printing a web address that looks
somethin like the following:

```
...
Attaching to neurohackademy2019
neuropythy-tutorials    | Executing the command: jupyter notebook
neuropythy-tutorials    | [I 22:28:43.171 NotebookApp] Writing notebook server cookie secret to /home/jovyan/.local/share/jupyter/runtime/notebook_cookie_secret
neuropythy-tutorials    | [I 22:28:44.106 NotebookApp] JupyterLab extension loaded from /opt/conda/lib/python3.7/site-packages/jupyterlab
neuropythy-tutorials    | [I 22:28:44.106 NotebookApp] JupyterLab application directory is /opt/conda/share/jupyter/lab
neuropythy-tutorials    | [I 22:28:44.109 NotebookApp] Serving notebooks from local directory: /home/jovyan
neuropythy-tutorials    | [I 22:28:44.110 NotebookApp] The Jupyter Notebook is running at:
neuropythy-tutorials    | [I 22:28:44.110 NotebookApp] http://(58e2ccd31ba9 or 127.0.0.1):8888/?token=e2f1bd8b37c875799a77198bc240af1b32e1ebc967e04801
neuropythy-tutorials    | [I 22:28:44.110 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
neuropythy-tutorials    | [C 22:28:44.116 NotebookApp]
neuropythy-tutorials    |
neuropythy-tutorials    |     To access the notebook, open this file in a browser:
neuropythy-tutorials    |         file:///home/jovyan/.local/share/jupyter/runtime/nbserver-7-open.html
neuropythy-tutorials    |     Or copy and paste one of these URLs:
neuropythy-tutorials    |         http://(58e2ccd31ba9 or 127.0.0.1):8888/?token=e2f1bd8b37c875799a77198bc240af1b32e1ebc967e04801
```

This final line is telling you how to connect to the notebook server. Basically, copy
everything starting with the "`:8888/`" to the end of the line and paste it into your
browser after "`localhost`", so in this case, you would point your browser to
`localhost:8888/?token=e2f1bd8b37c875799a77198bc240af1b32e1ebc967e04801`. This should
connect you to the notebook server. Click on the `work` directory then on the
`tutorial.ipynb` file to open the notebook. From there, follow the text and
code in the notebook.


### <a name="credentials"></a> Getting HCP Credentials

Neuropythy uses Amazon's S3 service to obtain structural data from the HCP,
which hosts mosts of its public data there. In order to access these data, you
must obtain a set of S3 credentials from the HCP with access to their S3
buckets. To obtain these credentials, follow these instructions:

1. Point your browser to https://db.humanconnectome.org/ --this should load a
   login page with the title "Access HCP Data Releases"
2. Click the "Register" button in the lower right of the "Create an Account"
   section.
3. Fill out the dialog box that pops up and click "Register". You should get
   a verification email; follow any instructions that it contains.
4. You should now be able to go back to https://db.humanconnectome.org/ and
   log in.
5. Once you have logged in, you should see a page titled "Public Connectome
   Data" with a number of cards below it. The top card should be titled
   "WU-Minn HCP Data - 1200 Subjects" Within this card should be a bunch of
   text describing the dataset and some statistics about it. Near the bottom
   of the card is the word "ACCESS:" followed by a button labeled "Data Use
   Terms Required". Click this button and accept the terms of use that
   appear.
6. The "ACCESS:" tag should now be next to a checkmark and a link labeled
   "Open Access Terms Accepted". Just to the right of this link should be a
   button with the Amazon AWS logo (three yellow cubes) that says something
   about Amazon S3 access. Click this button to bring up the AWS Connection
   Manager dialog; it should have a large button that lets you generate an
   AWS Access Key and Secret. Click this button and follow the instructions
   if any.
7. The access key and secret should look something like this:  
   Key: AKAIG8RT71SWARPYUFUS  
   Secret: TJ/9SJF+AF3J619FA+FAE83+AF3318SXN/K31JB19J4  
   (These are not real credentials).  
   Copy the key and secret and paste them into a file in your home
   directory that you can remember. I recommend using ~/.hcp-passwd, as that
   is the file I will assume you have placed your credentials in during my
   tutorial. When you paste the key and secret into the file, separate them
   by a colon (:) character. For the fake key and secret given above, the
   file would contain the following:  
   AKAIG8RT71SWARPYUFUS:TJ/9SJF+AF3J619FA+FAE83+AF3318SXN/K31JB19J4

For eneral information on configuring neuropythy, including how to setup the HCP
auto-downloading mechanism, see the [neuropythy configuration wiki
page](https://github.com/noahbenson/neuropythy/wiki/Configuration).

### License 

This README file is part of Noah Benson's neuropythy tutorials.

This tutorial collection is free software: you can redistribute it and/or Modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <http://www.gnu.org/licenses/>.

