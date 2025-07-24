# buenro_technical_task

A Flutter project for the Technical Task for Buenro company.

## Product Requirements
- [x] **Bottom Navigation Bar**
Include four main tabs:
    - **Overview**
    - **Hotels**
    - **Favourites**
    - **Account**

- [x] **Hotels Tab**
  - [x] Fetch and display a list of hotels using the following API: (You need to create a free
account to obtain the API key, we will not provide one)
  - [x] **SerpAPI - Bali Resorts**
  - [ ] ● Show:
    - [x] Title
    - [x] Description
    - [x] Heart icon to toggle favorites
    - [x] Loading state: Show spinner
    - [x] Error state: Show friendly error message with retry

- [x] **Favourites Tab**
  - [x] When a user taps the heart icon on a hotel card in the Hotels tab, the hotel should be
added to the Favorites tab.
  - [x] The Favorites tab displays the list of favorited hotels stored locally.
  - [x] Allow users to remove a hotel from favorites by tapping the heart icon again.

- [x] **Error Handling**
  - [x] Display a friendly error message with a retry button if the API call fails.

- [x] **App Design**
  - [x] Design Requirement: Use intuitive and accessible UI/UX practices:
  - [x] Clearly visible buttons and icons.
  - [x] Smooth transitions and animations for user interactions (optional but
recommended).
  - [x] Responsive layout that works on devices of different screen sizes.
  - [x] Avoid overcomplicating the UI; focus on functionality and usability.

- [x] **Overview & Account Screens**
  - [x] Keep these simple for now (static or placeholder content is acceptable).

- [x] **Testing Requirements**
  - [x] Unit tests: Business logic
  - [x] Widget tests: UI components


## App Demo

### iOS
https://github.com/user-attachments/assets/975c142b-306d-4130-9c40-52b74e34eae4


### Android
https://github.com/user-attachments/assets/2c6117e2-b30a-4247-9f86-002987ee3ba3



## SDK
<img width="730" alt="image" src="https://github.com/user-attachments/assets/4208dada-312f-4669-86a9-ad79d5dae380" />


## Steps to Run
- Add the `.env` file to the `assets` folder. To be at this directory
```
  - assets
    - .env
```
The environment file includes the folowing values for the API call
```
API_BASE_URL="https://serpapi.com/"
API_KEY=[Put Your API KEY here]
```

- Clean the Project
```
flutter clean
```
- Fetch the packages
```
flutter pub get
```
- Generate Code for AutoRoute Navigation
```
dart run build_runner build --delete-conflicting-outputs
```
- Then run the project
```
flutter run
```

## Tests
- Run the test command
```
flutter test
```

**Result**

<img width="280" alt="image" src="https://github.com/user-attachments/assets/c749df9f-c025-4356-8305-85185b7a900d" />


- To run Widgets Tests
Run the following command
```
flutter run -t test/features/hotels/presentation/pages/search_hotels_page.dart
```

**Result**

<img width="1171" alt="image" src="https://github.com/user-attachments/assets/bb9aac59-7d26-41a6-9051-5c4855674c5b" />

---

### Dependancies


```
dependencies:
  intl: ^0.20.0

  # SVG icons widget
  flutter_svg: ^2.0.15

  # Column Builder
  columnbuilder: ^0.0.2

  # Equity package
  equatable: ^2.0.7

  # Network packages
  http: ^1.2.2
  dio: ^5.7.0

  # Path Handling
  path: ^1.9.0
  path_provider: ^2.1.5

  # Functional Programming
  dartz: ^0.10.1

  # State Management
  flutter_bloc: ^8.1.6
  provider: ^6.1.2

  # Dependancies Injection
  get_it: ^8.0.2

  # Cached Network Image
  cached_network_image: ^3.4.1

  # Shimmer Loading
  shimmer: ^3.0.0

  # Local Caching
  hive_flutter: ^1.1.0

  # Naigation
  auto_route: ^10.1.0+1

  # Animated Bottom NavigationBar
  salomon_bottom_bar: ^3.3.2

  # Logs
  logger: ^2.6.0

  # Environment Variables
  flutter_dotenv: ^5.2.1

dev_dependencies:
  # Code Generation
  auto_route_generator: ^10.2.3
  build_runner: ^2.5.4

  # Mocking for Testing
  mocktail: ^1.0.4
```

---

### Project Structure and Architecture
I follow the Clean Code Architecture. Here is the project structure

```
- lib
    - core
        - api
        - network
        - errors
        - theme
        - extensions
        - widgets
        - constants
        - localization
        - routes
    - features
        - home
            - data
            - domain
            - presentation
                - pages
                - widgets
        - overview
            - data
            - domain
            - presentation
                - pages
                - widgets
        - favourites
            - data
                - datasources
                - models
                - repositories
            - domain
                - entities
                - usecases
                - repositories
            - presentation
                - blocs
                - pages
                - widgets
        - account
            - data
            - domain
            - presentation
                - pages
                - widgets
        - hotels
            - data
                - datasources
                - models
                - repositories
            - domain
                - entities
                - usecases
                - repositories
            - presentation
                - blocs
                - pages
                - widgets
- test
    - core
    - features
        - hotels
            - data
                - datasources
                - models
                - repositories
            - domain
                - entities
                - usecases
                - repositories
            - presentation
                - blocs
                - pages
                - widgets
```
