[![View compareVersions on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/71849-compareversions)

# CompareVersions

Semantic version "Greater Than or Equal To" m-function.
Matlab function that will determine if a cell array of values is greater than or equal to a reference version.


## Description

C = compareVersions(A,B). 
Determine if a cell array of versions (A) is greater than or equal to a reference version (B). 
Returns a logical array (C) with elements set to logical 1 (true) where A is greater than or equal to B; otherwise, the element is logical 0 (false). The test compares only the numeric part of each cell element delimited by period(.) i.e. semantic versioning.


## Tests

To run, use:

```matlab
suite = TestSuite.fromFolder(pwd, 'IncludingSubfolders', true);
run(suite)
```