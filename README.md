# flashcard_quiz_app

A new Flutter project.

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
            

