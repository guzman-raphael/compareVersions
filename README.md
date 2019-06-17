# CompareVersions

Version "Greater Than or Equal To" m-function.
Matlab function that will determine if a cell array of values is greater than or equal to a reference version.


## Description

C = compareVersions(A,B). 
Determine if a cell array of versions (A) is greater than or equal to a reference version (B). 
Returns a logical array (C) with elements set to logical 1 (true) where A is greater than or equal to B; otherwise, the element is logical 0 (false). The test compares only the numeric part of each cell element delimited by period(.) .


## Tests

To run, use the command `runtests`.