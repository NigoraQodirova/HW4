# HW4 - Flutter Application

This Flutter application demonstrates networking, SQLite usage, and navigation between multiple screens.

## Table of Contents

- [Introduction](#introduction)
- [Project Overview](#project-overview)
- [Screens](#screens)
- [Dependencies](#dependencies)
- [Setup](#setup)
- [Running the App](#running-the-app)
- [Usage](#usage)
- [Evaluation Criteria](#evaluation-criteria)

## Introduction

This Flutter project, named "HW4," serves as an exercise to practice networking with APIs, utilizing SQLite for local storage, implementing multiple screens, and navigation between them.

## Project Overview

The application consists of three screens:
1. **Welcome Screen:** A tutorial screen that shows only on the first launch, utilizing Shared Preferences to manage visibility.
2. **User List Screen 1:** Fetches user information from an API, displays it in a list, and provides options to fetch more users or store selected data into a local SQLite database.
3. **User List Screen 2:** Displays a list of user information fetched from the SQLite database created in Screen 1.

## Screens

### Welcome Screen
- Shown only on the initial launch of the app.
- Utilizes Shared Preferences to manage visibility.
- Provides a tutorial or introductory content.

### User List Screen 1
- Fetches user information from an API.
- Displays the user information in a list.
- Includes buttons to fetch more users from the API and store selected data into a local SQLite database.

### User List Screen 2
- Retrieves user information from the SQLite database.
- Displays the stored user information in a list.

## Dependencies

The main dependencies used in this project are:
- `shared_preferences`: For managing persistent preferences (used in Welcome Screen).
- `http`: For making API requests and handling responses.
- `sqflite`: For local SQLite database operations.

## Setup

To set up the project locally, follow these steps:
1. Clone this repository: `git clone <repository_url>`
2. Open the project in your preferred IDE or code editor.

## Running the App

Make sure you have a compatible emulator or a physical device connected to your development environment.

To run the app:
1. Run `flutter pub get` in the terminal to install dependencies.
2. Run the app using `flutter run` or launch it from your IDE.

## Usage

- **Welcome Screen:** Displays a tutorial only on the app's first launch.
- **User List Screen 1:** Fetches user information from an API, allowing the user to fetch more users or store selected data into a local database.
- **User List Screen 2:** Retrieves and displays user information stored in the SQLite database.

## Evaluation Criteria

- **Correctness:** Ensure the app runs without errors and fulfills the specified requirements.
- **Design:** Organize the widget tree and style widgets appropriately.
- **Code Quality:** Keep the code clean, well-organized, and easy to read.
- **Documentation:** Make the README file clear, informative, and inclusive of setup instructions.

---