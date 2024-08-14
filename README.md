# gallery

[Gallery](https://gallery.phthallo.hackclub.app) is a website for showcasing photos taken at Hack Club events, hackathons and meetings. It uses the Ruby on Rails framework and the [Hack Club theme](https://github.com/hackclub/css).

## Development

You'll need the following installed: 

- Git 
- Ruby
- [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) 

1. Clone the repository by running the following in your terminal
    ```
    git clone https://github.com/phthallo/gallery
    cd gallery
    ```
2. Install the project's dependencies. If you run into any errors, manually install the gem that's causing errors using `gem install <package>`
    ```
    bundle install
    ```
3. Set up the database.
    ```
    rails db:prepare
    ```
    *If you're (particularly Windows users) getting errors , try running `bin/rails` or `ruby bin/rails` instead of `rails`!*
4. Start the server.
    ```
    rails server
    ```
    *To specify a port, append `-p <port>` onto the above command.*

## Deployment

A version of this website is currently running at [https://gallery.phthallo.hackclub.app](https://gallery.phthallo.hackclub.app), using Hack Club's [Nest](https://guides.rubyonrails.org/getting_started.html) hosting. It uses [Systemd](https://guides.hackclub.app/index.php/Systemd) to stay online.

The `ExecStart=` parameter references [`gallery_start.sh`](/gallerystart.sh) Edit it to fit your setup - make sure to run `nest get_port` to check for free ports! Fill out the rest of the file as directed.

After running `nest subdomain add <subdomain>` (if applicable), edit the contents of your Caddyfile. The parts relevant to this project are below:
```
http://<subdomain.<username>.hackclub.app {
  bind unix/.webserver.sock|777
  root * /home/<username>/<path>/<to>/gallery
  # Add your Caddy directives here!
  file_server {
    hide .get .env
  }
  reverse_proxy :<port> {
    header_up X-Forwarded-Proto https 
  }
}
```
Reload your Caddyfile and you are good to go!
```
systemctl --user reload caddy 
``` 
