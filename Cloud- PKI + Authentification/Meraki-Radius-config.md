# Meraki-Radius-Config


## Access Control konfigurieren

Damit der Zugang zu den AP und Switches nur erlaubt wird wenn der RADIUS-Server es zulässt müssen wir den Access Control über Radius konfigurieren

Egal ob AP oder Switch, wir müssen unter Acess Control den Network Access angeben

![alt text](image-14.png)

Anschliessend müssen wir dort erstmal die SSID angeben wo sich unsere Clients dann anmelden sollte.

![alt text](image-15.png)

Als nächstes muss man angeben ob es eine Splash Page braucht
Da es für uns nicht relevant ist habe ich angegeben das es keine braucht und man sich direkt verbinden kann

![alt text](image-16.png)

und zu schluss kann man nun den RADIUS-Server angeben.
Da dieser AP RadSec unterstützt habe ich es über den Port 2083 konfiguriert

![alt text](image-17.png)

---

## PRTG Überwachung