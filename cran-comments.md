## Test environments
* local linux mint 18.3, R 3.4.4
* win-builder (devel and release)
* ubuntu 12.04 (on travis-ci), R 3.1.2
* windows server 2012 r2 x64 (build 9600), R 3.5.0 (on appveyor)

## R CMD check results

There were no ERRORs, WARNINGS or NOTES.

## Comments from the CRAN submission team:

- "Please omit the redundant 'in R' in your title." -> title is now adjusted
- "Please add an URL for 'Kairos' Face Recognition API in your description text" -> URL is added to the description
- "Please replace \dontrun{} by \donttest{} in your Rd-files." -> all instances replaced
