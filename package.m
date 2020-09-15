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