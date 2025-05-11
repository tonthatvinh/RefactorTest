# WiFiesta

# Build and Run
Before you start install all tools listed in the **"Prerequisites"**.
Example:

```
bundle install
```

## Prerequisites

* Xcode with command line tools installed ```xcode-select --install```
* [brew](http://brew.sh)
* [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://github.com/rvm/rvm) with ruby = 3.2.2
* [bundler](http://bundler.io)

## Swift

# VIPER templates

[Generamba](https://github.com/rambler-digital-solutions/Generamba) is used to automate VIPER modules generation.

## Swift

To generate a Swift VIPER module named "NewModule", execute the command below:

**Usage:**
```
bundle exec generamba gen NewModule swifty_viper
```

## 3rd-parties
+ Swinject
+ SwiftyJSON

## What've I done? 
+ Well-organized structure by categorizing it into tiny components.
+ Unit tests for Antipodes Modules, W3wService, ConfigurationManager.
+ VIPER architecture.  
+ Dependency injection framework - [Swinject](https://github.com/Swinject/Swinject) split into loosely-coupled components, which can be developed, tested and maintained more easily  
+ Each components is single responsibility and no dependency on other parts.
+ Easily generating and customing template VIPER modules 

### Structure
+ AntipodesViewController: is responsible for updating and displaying UI
+ AntipodesPresenter: is responsible for handling UI action and business logic..
+ AntipodesInteractor: is responsible for calling api or connect database.
+ AntipodesBuilder: is responsible for creating modules
+ AntipodesRouter: is responsible for navigating/presenting to another modules
+ ApplicationServiceBuilder: is responsible for managing services that will be used in application 
+ ConfigurationManager: is responsible for getting static variables from Info.plist like api key...
+ W3WService: is responsible for calling api from w3w SDK
