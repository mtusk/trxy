# trxy
View Visual Studio Test results files (`.trx`) on any platform without the need for Visual Studio.

## Installation
TODO point users to the releases section of this github repo and describe how to install the app

## Usage
TODO (hint: click the open icon to open your .trx file)

## Samples
TODO explain how to generate sample trx files by running the dotnet core tests in `/examples/TrxySampleTests`

## Contributing
trxy is comprised of a .net core desktop application that wraps a React web app:
- `/app`: the cross-platform desktop app for trxy that wraps the React web app.
  - uses [WebWindow](https://github.com/SteveSandersonMS/WebWindow) which is a lighter-weight alternative to Electron
  - could be replaced with some other cross-platform webpage-wrapping framework if desired (Electron or future stuff)
  - commands:
    ```bash
    $ dotnet restore  # restore NuGet packages
    $ dotnet run      # run the desktop app
    ```
- `/web`: the React web app for trxy:
  - built using create-react-app
  - can be run locally on its own with full functionality without the desktop app
  - commands:
    ```bash
    $ npm install
    $ npm run start  # run the React app in a browser
    $ npm run build  # build the React app and copy build output to the desktop app
                     #   (TODO "stage" uses "cp" which is not compatible with windows!)
    ```

## Getting Started
