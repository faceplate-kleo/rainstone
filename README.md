# RainStone

#### A dead-simple weather module for [Polybar](https://github.com/polybar/polybar) written in pure Ruby, built on the [National Weather Service API](https://www.weather.gov/documentation/services-web-api)

## Usage

Once installed, RainStone reports the current hour's weather forecast for the nearest city center in the following format:

`Temperature (°F) / Condition / % Risk of Rain`

*IYKYK* ☂️

In action:

![](/resources/rainstone_running.png)

## Prerequisites

[Ruby](https://www.ruby-lang.org/en/documentation/installation/) >= 3.0.6

(Worth noting that you can probably get away with older versions of Ruby, but they are as yet untested)

## Installation

1. Clone this repository

    ```
    git clone https://github.com/faceplate-kleo/rainstone
    cd rainstone
    ```

2. Run the RainStone install script
    ```
    ./install.rb
    ```

    RainStone is installed to `/etc/polybar` by default. If your polybar configuration lives elsewhere, override this default path with

    ```
    ./install.rb --config /path/to/your/polybar
    ```

    The install script is also written in Ruby to ensure you have it installed :)

3. Add RainStone to your polybar `config.ini`

    With the text editor of your choice, update your `config.ini` with the configuration block provided by the install script.

    An example configuration: 

    ![](/resources/module_add.png)
    ![](/resources/module_definition.png)

4. Restart polybar (if required)

    If you have not configured Polybar to reload on configuration changes, you'll need to restart it for RainStone to appear.


All done! Enjoy the weather.
