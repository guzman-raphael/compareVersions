# CompareVersions

Version "Greater Than or Equal To" m-function.
Matlab function that will determine if a cell array of values is greater than or equal to a reference version.


## Description

C = compareVersions(A,B). 
Determine if a cell array of versions (A) is greater than or equal to a reference version (B). 
Returns a logical array (C) with elements set to logical 1 (true) where A is greater than or equal to B; otherwise, the element is logical 0 (false). The test compares only the numeric part of each cell element delimited by period(.) i.e. semantic versioning.


## Tests

To run, use the command `runtests`.

## Dev Notes

### Package

generate a .prj for the first time...

copyfile('/src/compareVersions_template.prj','/src/compareVersions.prj');
cd /src;
version = compareVersions('version');
cd /tmp;
fid  = fopen('/src/compareVersions.prj','r');
f=fread(fid,'*char')';
fclose(fid);
f = regexprep(f,'{{VERSION}}',version);
fid  = fopen('/src/compareVersions.prj','w');
fprintf(fid,'%s',f);
fclose(fid);
matlab.addons.toolbox.packageToolbox('/src/compareVersions.prj','/src/compareVersions');

### install test (need to force previous uninstall or will install side/side)

addons = matlab.addons.installedAddons;
arrayfun(@(x) matlab.addons.uninstall(x),addons.Identifier(addons.Name == "compareVersions"), 'UniformOutput', false)
matlab.addons.install('/src/compareVersions.mltbx')

### get version of toolbox

addons.Version(addons.Name == "compareVersions")


### upload toolbox

% download
curl 'https://www.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/71849/versions/1.0.1/download/mltbx/compareVersions.mltbx' -o 'compareVersions.mltbx'


### break github connection

### download toolbox

