[![View compareVersions on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/71849-compareversions)

# CompareVersions

Semantic version comparison m-function. Matlab function that will compare a cell array of values to a reference version (default: greater than or equal to).


## Description

C = compareVersions(A,B). 
Compare a cell array of versions (A) against a reference version (B). Default behavior is a greater than or equal to operation. Returns a logical array (C) with elements set to logical 1 (true) where A,B satisfy the operator `verCheck`; otherwise, the element is logical 0 (false). The test compares only the numeric part of each cell element delimited by period(.) i.e. semantic versioning.


## Tests

To run, use:

```matlab
suite = TestSuite.fromFolder(pwd, 'IncludingSubfolders', true);
run(suite)
```