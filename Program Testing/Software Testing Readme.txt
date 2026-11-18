# Software Testing Portfolio
This folder contains test plans, test cases, dummy datasets, and defect logs created while learning software testing fundamentals alongside COBOL and IBM z/OS (IBM Z Xplore).
## Testing ApproachTo ensure programs handle both normal transactions and unexpected errors safely, I apply language-agnostic 
testing techniques:* **Equivalence Partitioning:** Grouping valid and invalid input ranges to keep test suites efficient.
* **Boundary Value Analysis:** Testing minimum, maximum, and just-outside-range values (e.g., `0`, `99999`, negative numbers).* 
**Error Guessing & Negative Testing:** Feeding empty files, non-numeric characters in numeric fields, and missing records to 
verify graceful error handling and proper JCL return codes.
