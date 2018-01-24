/*Dieser Teil bezieht sich auf das SOEP. Fragen zu diesem Teil bitte an Christian Rulff: christian.rulff@rub.de */

Das do-file cr_soep zieht die Daten des SOEP und erstellt einen rohen Datensatz.
Damit das do-file läuft, müssen drei Ordner entsprechend der "globals" in den Zeilen 1 bis 3 erstellt werden.
Die Originaldaten müssen in der vom SOEP gelieferten Struktur in den "...\data_source" Ordner.

Damit die anderen do-files laufen, muss als erstes das do-file "_master.do" laufen. Anschließend bereitet das do-file "clean_soep" die Daten für die Analysen auf.
Die Datensätze kldb1.dta, kldb2.dta und kldb3_task.dta müssen in den Ordner "...\data_derived" kopiert werden.
Der Datensatz kldb3_task.dta basiert auf dem IAB FDZ-Methodenreport 12/2014 (Dengler et al. 2014). Für die Genaue Zitation siehe Bericht.

Die do-files für die Analyse sind entsprechend der korrespondieren Tabellen/Abbildungen in dem Bericht benannt.


/*Dieser Teil bezieht sich auf das NEPS. Fragen zu diesem Teil bitte an Michael Tamminga: michael.tamminga@rub.de */

Das do-file cr_NEPS führt die relevanten Daten zusammen und erstellt einen Datensatz.
Das do-file an_NEPS erstellt die Tabellen. 
