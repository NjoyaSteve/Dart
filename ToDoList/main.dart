import 'dart:io';

class ElementListe{
    late final String title;
    late final String description;

    ElementListe(this.title, this.description);

    void afficherDetails(){
        print('Titre : $title');
        print('Description : $description');
    }
}

class Tache extends ElementListe{
    late final DateTime dateEcheance;
    late final int priorite;
    bool accomplie = false;

    Tache(String titre, String description, this.dateEcheance, this.priorite): super(titre, description);

    void toggleAccomplie(){
        accomplie = !accomplie;
    }

    @override
    void afficherDetails(){
        super.afficherDetails();
        print('Date d\'échéance : $dateEcheance');
        print('Priorité: $priorite');
        print('Accomplie: $accomplie');
    }
}

class Projet extends ElementListe{
    List<Tache> listeTaches = [];

    Projet(String titre, String description): super(titre, description);

    void ajouterTache(Tache tache){
        listeTaches.add(tache);
    }

    void supprimerTache(int index){
        if(index >= 0 && index < listeTaches.length){
            listeTaches.removeAt(index);
        } else{
            print('Index non valide');
        }
    }

    @override
    void afficherDetails(){
        super.afficherDetails();
        print('Liste des tâche: ');
        for(Tache t in listeTaches){
            t. afficherDetails();
        }
    }
}

class Gestionnaire{
    List<ElementListe> elements = [];

    void ajouterElement(ElementListe element){
        elements.add(element);
    }

    void supprimerElement(int index){
        if(index >= 0 && index < elements.length){
            elements.removeAt(index);
        } else{
            print('Index non valide');
        }
    }

    void afficherToutesLesTaches(){
        for(ElementListe e in elements){
            if(e is Tache){
                e.afficherDetails();
            } 
        }
    }

    void afficherTachesParPriorite(int priorite){
        for(ElementListe e in elements){
            if(e is Tache && e.priorite == priorite){
                e.afficherDetails();
            }
        }
    }

    void afficherTachesAccomplies(){
        for(ElementListe e in elements){
            if(e is Projet){
                e.afficherDetails();
            }
        }
    }

    void afficherTAchesNonAccomplies(){
        for(ElementListe e in elements){
            if(e is Tache && !e.accomplie){
                e.afficherDetails();
            }
        }
    }

    void afficherProjets(){
        for(ElementListe e in elements){
            if(e is Projet){
                e.afficherDetails();
            } 
        }
    }
}

void main(){
    var gestionnaire = Gestionnaire();
    while(true){
        print('\n*  My Dart To Do List  *');
        print('1. Ajouter une Tâche');
        print('2. Afficher toutes les Tâches');
        print('3. Afficher les projets');
        print('4. Tâche accomplies');
        print('5. Tâche non accomplies');
        print('6. Quitter');

        var choix = int.tryParse(stdin.readLineSync() ?? '');

        switch (choix){
            case 1:
                print("Entrez le titre de la Tâche: ");
                var titre = stdin.readLineSync();

                print('Entrez la description: ');
                var description = stdin.readLineSync();

                print('Entrez la date d\'échéance (format yyyy-mm-dd):');
                var date= DateTime.tryParse(stdin.readLineSync() ?? '');

                print('Entrez la priorité (1 pour haute, 2 pour moyenne, 3 pour basse):');
                var priorite = int.tryParse(stdin.readLineSync() ?? '');

                if(titre != null && description != null && date != null && priorite != null){
                    var tache = Tache(titre, description, date, priorite);
                    gestionnaire.ajouterElement(tache);
                    print('Tâche ajoutée avec succès');
                } else{
                    print('Erreur lors de la création de la tâche');
                }
                break;

            case 2:
                print("Toutes les tâches");
                gestionnaire.afficherToutesLesTaches();
                break;
            
            case 3:
                print("Projets");
                gestionnaire.afficherProjets();
                break;

            case 4:
                print('\nTâche accomplies');
                gestionnaire.afficherTachesAccomplies();
                break;

            case 5:
                print('\nTâche non accomplies');
                gestionnaire.afficherTAchesNonAccomplies();
                break;

            case 6:
                print('Au revoir!');
                break;

            default:
                print('choix invalide.');            
        }
    }
}
