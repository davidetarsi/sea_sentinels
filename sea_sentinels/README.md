# sea_sentinels

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


!!!!!!!!!!SPIEGAZIONE BUG!!!!!!!!!!!!!!!!!!!!!

Providers/diving_provider.dart è il file con il provider della Diving che ci interessa, che viene richiamato in view/widget/new_diving_survey.dart quando si clicca il tasto + nella home dell'app per aggiungere una nuova Diving

view/home_tab_screen.dart è la pagina della home, che ha 2 tasti: + per aggiungere una nuova diving e return per tornare con la telecamera al centro e fare una print della lista divings per fare debug

viewmodel/home_view_model.dart ha il provider homeviewmodel che gestisce la lista divings e ha il metodo addDiving che viene richiamato col tasto + della home per aggiungere la Diving nella lista

model/diving_model.dart è il modello della diving

view/widget/new_diving_survey.dart è il file con il questionario sulla diving, che nella seconda pagina chiede di inserire i dati preliminari sull'immersione (città, temperatura, profondità massima, etc...) e nella terza cliccando sui pesci visti chiede di inserire la quantità. Nella quarta pagina cliccando su salva la pagina si chiude e la diving viene aggiunta nella lista di homeViewModel
