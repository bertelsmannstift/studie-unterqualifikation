cap log close
version 14.2
discard
clear all
macro drop _all
mata: mata clear
clear matrix
set linesize 100
set seed 987654321
set more off
set varabbrev off, perm
set matsize 3000
global STATA "...\stata/"  
global DATA_SOURCE "...\data_source/"
global DATA_DERIVED "...\data_derived/"
global TABLES "...\Tabellen/"
sysdir set PLUS "...\program_code/" 
exit
