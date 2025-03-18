# Infrastruktur

---

### Vorwort:

In diesem Abschnitt definiere ich was ich alles für Infrastruktur brauche, welche Services und Ressourcen ich dafür verwendenen werde und werde das alles am schluss im Form von einem Netzwerkplan darstellen

Für die Infrastruktur unterscheide ich zwischen Benötigter Infrastruktur, welche ich unbedingt in mein Projekt integrieren will und in bestimmten Fällen auch muss, und Optionale Infrastruktur die ich ebenfalls integrieren möchte falls genug Zeit und Guthaben gegeben sind. 

---

### Benötigte Infrastruktur:

- Host für Bitwarden (**EC2-Instanz oder AWS Fargate**)
- SMTP-Server (**AWS SES**)
- Datenbank-Server (**Amazon RDS**)
- Backup in Form von Snapshots (**AWS Backup**)
- Lagerung der Snapshots (**S3-Bucket**)
- Key-Vault (**AWS Secret Manager**)
- Alle Ressourcen unter einem Namen verwalten (**AWS Cloud Map**)
- Monitoring und Logging (**AWS CloudWatch**)

### Optionale Infrastruktur
- Reverse-Proxy und Lastenausgleich (**Elastic Load Balancer**)
- Firewall (**AWS WAF**)
- Service-Kommunikation optimation (**AWS APP Mash**)

---

### Aufbau und Funktion Infrastruktur 

Der konkrete Aufbau u
