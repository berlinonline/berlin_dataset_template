# GitX als Datenspeicher

## Mindestanforderungen

Alles, was man wirklich braucht:

    * ein Repository für den Datensatz
    * Datenveröffentlichende brauchen Github-Account und Zugang zu Repo


## Optional, aber wünschenswert

* Datensatz-Repos werden aus Templates generiert, die bereits viel nützliches mitbringen (Grundstruktur und übergreifend nützliche Files):
    * `/data` – da kommen die Daten hin
    * `README.md` – Dokumentation, sollte schon vorausgefüllt sein
    * `/config` – Metadaten des Datensatzes u.a.
    * `/.github` – Actions, z.B. Anpassung der Metadaten im Datenregister nach Push zu (Haupt-)Branch, Validierung der Daten, Transformierung der Daten (Linked Data) etc.
    * `Makefile` – um irgendwelche Sachen lokal zu automatisieren, z.B. README aus config generieren, Datensatz im DR anlegen, Metadatan im DR updaten etc.

* CKAN/Datenregister API-Token als Github-Secret (`DATENREGISTER_TOKEN`) für jedes Repo