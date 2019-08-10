# My Booking Restaurant (FREE)

### [Italiano]

## Descrizione

*My Booking Restaurant* � un'applicazione Open Source realizzata per la gestione delle prenotazioni all'interno della propria attivit�, che sia un Ristorante, un Pub o un Albergo.  
Nata nel 2015 come software a pagamento (versione PRO per PC) sotto commissione di un ristorante, ho deciso di convertirla dal suo linguaggio di programmazione originale (Java puro) a GDScript attraverso [Godot Engine](https://godotengine.org/).  
Infatti, grazie alla versatilit� di questo software gratuito ed open source, mi � stato possibile realizzare una grafica ed un design molto pi� elastico ed accattivante, al semplice costo di trasportare gran parte delle funzionalit� scritte originariamente in Java in un linguaggio di programmazione molto simile a *Python*.  
Inoltre la possibilit� di utilizzare shaders , animare ogni singolo componente , interagire facilmente con l'audio del dispositivo che si utilizza, e accedere alla connessione internet per poter effettuare complesse richieste HTTP in poche linee di codice , ha reso molto pi� facile lo sviluppo e l'implementazione di funzionalit� PRO rendendo il software stesso adattabile a qualsiasi situazione e qualsiasi dispositivo (senza escludere l'enorme facilit� con qui � possibile esportare un progetto su qualsiasi piattaforma).  


## Versione Free - Versione PRO

Questa repository consta attualmente di due brach principali: [il codice sorgente della versione free](https://github.com/fenix-hub/my-br-app/tree/source-code), e gli eseguibili di tale versione ( disponibili per il download a qualsiasi attivit� commerciale o utente privato che desidera provarlo ).  
- [Branch Versione Windows](https://github.com/fenix-hub/my-br-app/tree/windows-exe)  
- [Branch Versione Linux](https://github.com/fenix-hub/my-br-app/tree/linux)  
- [Branch Versione Mac](https://github.com/fenix-hub/my-br-app/tree/mac-app)  
- [Branch Versione Android](https://github.com/fenix-hub/my-br-app/tree/android-apk)  
- [Branch Versione iOS](https://github.com/fenix-hub/my-br-app/tree/ios)  
In ogni caso, questa repository contiene solo alcune delle funzionalit� che il software offre e che possono essere modificate direttamente da sorgente.  
Le funzionalit� aggiuntive, oscurate nel codice sorgente (se non addirittura completamente assenti) sono relative alla versione **PRO**, in via di sviluppo del tutto privata.  
E' possibile ottenere questa versione solamente a pagamento, ed � la versione che attualmente molti ristoranti utilizzano e per cui ricevono personalizzazioni ed assistenza.
In ogni caso, le funzionalit� che la versione **Free** offre sono tutte le funzionalit� principali per la corretta gestione del proprio locale.  


## Funzionamento - Versione PC (Windows,Linux,Mac)

*My Booking Restaurant (Free)* permette una facile e rapida gestione delle prenotazioni registrate nel proprio locale, e dei propri clienti.  

### Accesso
Una semplicissima schermata di accesso permette allo staff del proprio locale di poter accedere con dei propri dati identificativi (nome utente e password) assegnati dal direttore del locale, dal padrone o da chi � stato stabilito come *Amministratore* del gestionale.
![Accesso](/SCREENSHOTS/accesso.png)


### Interfaccia Generale
In alto a sinistra avremo il nome dell'applicazione (*MyBookingRestaurant*) accompagnato dal nome del ristorante, il codice della sua versione (codice numerico + letter che identifica il tipo, **"F"** free - **"PRO"** pro).  
In alto a destra il bottone per minimizzare la finestra (-) e chiudere l'applicazione (x).  
Sulla sinistra sar� sempre disponibile un *Men� Rapido* fisso che permetter� di interagire con le varie parti del Software.
La versione **Free** presenter� le voci accessibili: Prenotazioni, Tavoli, Staff, Pannello.  
Le restanti, tutte oscurate, saranno invece disponibili per la versione **PRO**, ovvero: Clienti, Materiali, Statistiche,(altre).

### Pannello
Una volta effettuato l'accesso, un *Pannello* dar� le informazioni principali relative all'utente connesso (nome e ruolo nello staff), e al ristorante (nome, telefono, via...) cos� che queste siano sempre disponibili a chiunque per qualsiasi evenienza.  
Non � possibile modificare queste informazioni:
solo un Amministratore pu� modificare i dati relativi ad un utente e al proprio ristorante.  
![Pannello](/SCREENSHOTS/pannello.png)

### Gestione Prenotazioni (Elenco, Registra, Elimina, Modifica)
Nella sezione della *Gestione Prenotazioni* � possibile registrare una prenotazione compilando i campi (suddivisi in obbligatori ed aggiuntivi).   
E' sempre possibile visionare l'elenco completo delle prenotazioni, modificare una prenotazione e cancellare una prenotazione.  
> La versione **PRO** implementa il sistema automatizzato di registrazione di un cliente: ogni volta che viene registrata una prenotazione, il software verifica nel proprio database che questo clienta esista. Se esiste ne viene registrata una nuova prenotazione, altrimenti il cliente entra automaticamente nell'elenco dei clienti del locale.  

![Prenotazioni](/SCREENSHOTS/prenotazioni.png)

### Gestione Clienti [PRO] (Elenco, Registra, Prenota, Gestisci)
> Questa sezione � esclusiva alla versione PRO

Nella sezione della *Gestione Clienti* � possibile registrare un nuovo cliente compilando i campi (suddivisi in oblbigatori ed aggiuntivi).  
Attraverso il bottone *elenco* � possibile visualizzare l'elenco completo di tutti i clienti per cui � stata registrata una prenotazione. Da qui � possibile effettuarne una nuova prenotazione con i campi gi� compilati. Automaticamente, il sistema incrementer� il numero di prenotazioni effettuate, e terr� sempre collegato il cliente con ogni singola prenotazione registrata.  
Con il bottone *gestione* � possibile modificare o eliminare uno o pi� clienti nel proprio elenco.  
Con il bottone *registra* � possibile registrare un nuovo cliente.  
![Clienti](/SCREENSHOTS/clienti.png)