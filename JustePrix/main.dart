import 'dart:io' show stdin;
import 'dart:math' show Random;

void main(){
    Random random = Random();
    print("** Bienvenue au Juste prix **");
    int nbTry = 5;
    int target = random.nextInt(50);
    print("Devinez le nombre choisi par l'IA dans l'intervalle [1;50]");

    for(int i = 1; i<= nbTry; i++){
        print("Essai N° $i >> ");
        int choix = int.parse(stdin.readLineSync()!);
        if(choix == target){
            print("Felicitation t'as deviné, le nombre était bien $target");
            break;
        } else if(choix < target){
            print("T'es trop bas, c'est plus");
            print("\n");
        }else{
            
            print("T'es trop haut, c'est moins\n");
        }

        if(i==5){
          print("Low ! C'était: $target");
        }

    } 
}