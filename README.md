# Flutter FillInGap programming study project

## How to run the project

- please clone the repository.
- in terminal, write "Flutter pub get" to install the packages.
- then, run the project " Flutter run"

## Packages used

flutter_riverpod: ^2.3.6 :
used Riverpod for state managment
go_router: ^7.0.0:
used google package GoRouter for advance routing control and to organize all the routes in one file.
flutter_svg: ^2.0.5:
used for the assets icons extracted from Figma
sizer: ^2.0.15:
used for responsivness design across multiple screens
uuid: ^3.0.7:
used to mark a unique id from each question string option keyword
intl:
used for translation, there is an Arabic and English translation files

## Folder Structure

structures the project in a DDD (Domain Driven Design) architicture.
where each feature have the follwoing folders:

    Controller
    Provider
    helpers ( for helper classes related to the feature )
    data -> Api
         -> Models
         -> Repository
    Views
    Widgets

the Core folder contains:

    Config  -> Routes ( for all the application routes to screens using go_router package)
            ->  theme
    Contastants ( for all application constants (routes names, endoints names, app colors, assets paths, ..))
    Extension ( for helper extensions on the flutter framwork SDK )
    Services -> networking ( to call all CRUD operation with the status codes exception)
             -> storage ( for all the local storage methods "SharedPreferrences" or "Hive" ...)

**Note** - lefts comments across most files , so everything should be readable and understandable. - the project would be alot easer if i did the example on firebase or with testing API`s,
String manipulating was a little bit chalenging.
