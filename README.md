# tg-tools

bash helpers for simple [Telegram](https://telegram.org) bots, interfacing with
their [web API](https://core.telegram.org/bots).

## Requirements

* `sh`
* [curl](https://curl.se/docs/manpage.html)

## Usage

Before each of these, make sure you have a Telegram Bot set up through
[BotFather](https://t.me/BotFather). You will want the API token. Keep this
token secure. Before each command, define the token.

### tg-updates

This script returns the [updates available to the
bot](https://core.telegram.org/bots/api#getting-updates). For this, you'll only
want the `TG_TOKEN`. Run it like this:

```bash
$ TG_TOKEN="<your-token-here>" ./tg-updates
```

This returns a plain JSON string, which can be manipulated with `jq`.
