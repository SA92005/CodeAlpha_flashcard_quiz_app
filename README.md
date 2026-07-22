# flashcard_quiz_app

A new Flutter project.
## statges for the 2 features
First Stage 
    - build architecture
        - core folder
        - domain
        - data
        - presentation
    
  ### Domain

    - create FlashCardEntity
    - create FlashCardRepository
    - create FlashCardUseCases
        - add
        - get
        - get all
        - update
        - delete
    - do manual dependency injection
        - register FlashCard UseCases
        - no injectable
        - no injectable_generator



 ### Data

    - add packages
        - hive
        - hive_flutter
        - hive_generator
        - build_runner

    - create FlashCardModel
    - generate Hive adapter

    - create FlashCardDataSource
    - create FlashCardDataSourceImpl

    - implement Hive CRUD operations
        - add
        - get
        - get all
        - update
        - delete

    - create FlashCardRepositoryImpl
    - convert between Entity and Model

    - do manual dependency injection
        - register Hive Box
        - register FlashCardDataSource
        - register FlashCardRepository

 ### Presentation

    - Create FlashCardCubit
    - Create FlashCardStates
        - Initial
        - Loading
        - Loaded
        - Error

    - Register Cubit


 #### Categories

    - Display Categories
    - Add Category
    - Update Category
    - Delete Category

 #### Flash Cards

    - Display Flash Cards
    - Filter Flash Cards by Category
    - Add Flash Card
    - Update Flash Card
    - Delete Flash Card

 #### Flash Card Details

    - Display Question
    - Show Answer

 #### Reusable Widgets

    - CommonContainer
    - CommonFloatingButton
    - FlashCardField
    - CategoryAlert

 #### UI

    - Custom Theme
    - App Colors
    - App Text Styles
    - App Icons

 #### Navigation

    - Categories Screen → Flash Cards Screen
    - Flash Cards Screen → Flash Card Details Screen



# linkedIn video:https://www.linkedin.com/posts/salma-ali-7462052b6_flutter-dart-codealpha-ugcPost-7485540312107524096-rGsw/?utm_source=share&utm_medium=member_desktop&rcm=ACoAAEvZXeYBogSdSilNYFEpPss2HyhAfQ6p3xs

# apk:[text](build/app/outputs/flutter-apk/app-release.apk)