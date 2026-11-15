# COBOL Programs Portfolio 


**Bill Roberts** | Aspiring Entry-Level IBM Mainframe Application Developer (z/OS, COBOL, JCL, VSAM, CICS, Db2)  
📍 Based in High Wycombe / Greater London Area, UK

---

## About Me
I am a Computer Studies graduate (BSc Hons, 2:2) with prior commercial experience in IT Support, currently transitioning into an **entry-level IBM Mainframe Developer** role. 

Having built my foundational understanding of procedural programming, data structures, and enterprise troubleshooting early in my career, I am now dedicating full-time focus to modern IBM z/OS application development—combining live mainframe hands-on labs with structured training across the core enterprise stack.

---

## Repository Structure

This repository tracks my progression from local syntax practice to full end-to-end IBM z/OS batch and data processing applications:

* **`/IBM-Mainframe-COBOL`** — Enterprise COBOL programs written for IBM z/OS, featuring sequential file processing, control breaks, copybooks, and defensive error handling.
* **`/JCL`** — Job Control Language scripts for compiling, link-editing, and executing COBOL batch jobs, managing Generation Data Groups (GDGs), and running standard utilities (`IDCAMS`, `IEBGENER`, `DFSORT`).
* **`/GnuCOBOL`** — Standalone console applications compiled locally via GnuCOBOL to test business logic, `88`-level condition flags, intrinsic functions, and numeric-edited financial formatting.
* **`/Fujitsu-COBOL`** — Additional dialect practice exercises exploring compiler compatibility and fixed-format COBOL standards.

---

## Current Training & Credentials

* **IBM Z Xplore Learning Platform:** Actively progressing through live z/OS challenges (TSO/ISPF, z/OS UNIX, JCL, VSAM, COBOL, and Db2).
* **Core Mainframe Curriculum:** Completing structured hands-on coursework covering **TSO/ISPF**, **JCL**, **VSAM (KSDS/ESDS)**, **Enterprise COBOL**, **CICS**, and **Db2 for z/OS**.
* **Development Tooling:** VS Code with *IBM Z Open Editor* and *Zowe Explorer*, TSO/ISPF 3270 terminal emulation, and GnuCOBOL.

---

## Coding Standards Applied
Across all projects in this repository, I follow enterprise mainframe development conventions:
* **Modular Top-Down Design:** Numbered paragraph hierarchies (`0000-MAIN`, `0100-INITIALISE`, etc.) and single-entry/single-exit `PERFORM` loops.
* **Defensive Programming:** Strict validation of alphanumeric input buffers (`TEST-NUMVAL`) and explicit `FILE STATUS` / `SQLCODE` checking to prevent runtime data exceptions (`S0C7` abends).
* **Clear Documentation:** Full `IDENTIFICATION DIVISION` headers, inline change histories, and self-documenting `88`-level condition names.

---

## Contact
* **GitHub:** (https://github.com/billroberts134/COBOL-Programs/edit/main/)
* **LinkedIn:** (www.linkedin.com/in/bill-e-roberts/)
