## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Code Generation

We use [Mason](https://pub.dev/packages/mason_cli "Mason") to generate clean code easily. You can referer to the package complete [documentation](https://docs.brickhub.dev/).

You can use the page template in this way:

### 1. Installation (do once)

```sh
# 🎯 Activate from https://pub.dev
dart pub global activate mason_cli
```

Now you can call `mason` command in terminal

### 2. Generate a page

Get all bricks registered in `mason.yaml` via:

```sh
mason get
```

Go to the folder where you want to create the new page

```sh
cd lib/pages
```

Run the command

```sh
mason make page
```

Insert the name of the page, and you're done 🎉

# Architecture

## Store

State management: [Get](https://pub.dev/packages/get)

A Store is where data and app state is reteined.

### Services

App level state and data reside in /lib/store in ***.service** file.

Services are initialized at the start of the app and can be retrieved from everywhere with the `ServiceClassName.to` method.

### Model

A Service is often bound to a Model that usually matches a database object.

> Ex. BreedService store data about BreedModel, like the list of breeds.

A Model contains methods to transform json data to class object.

#### Selector

a .selector file helps to keep model's file clean and to keep variables privates.

### Api

.api file is a collection of methods that make REST calls about the model.

APIs should not be called directly from Widgets. Actions should be used instead.

### Actions

The actions are an extension of the Service and are a collection of methods that call APIs and process data into models.

## Pages

App routes.

### Page

a .page file contains the route definition and Binding with the Controller.

When calling `Get.toNamed` the Controller is automatically initialized.

### Controller

The Controller is responsible for the page logic.

The Controller is similar to a Service, but it's responsable only for its page and gets created and destroyed with it. It retrieves data from Services for the Widget, and makes API calls through Service's Actions.

### Widget

High level widget that defines Page layout and content.

Widget content is reactivily updated using [Obx](https://pub.dev/packages/get#counter-app-with-getx) Widget

## Design

Low level widgets and UI tokens

### Tokens

Design tokens point to style values like colors, fonts, and measurements

[Material 3 definition](https://m3.material.io/foundations/design-tokens/overview#0aa7c44c-d528-4217-9aed-80d978815723)

### Atoms

Lowest level widgets like structure widgets and buttons.

[Atomic Design](https://atomicdesign.bradfrost.com/chapter-2/)

### Components

Medium level widgets that are composed by many lower level widgets.

## Utils

### Translations

Get package is used for [translations](https://atomicdesign.bradfrost.com/chapter-2/)

*.translations file are used where a string need to be translated.

all .translations file are then merged together in utils/translations.dart.

> This could led to some repetition and overwriting, but it keeps translations organized and easier to track.
