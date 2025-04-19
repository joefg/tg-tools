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

### tg-get-me

This script returns your bot's basic information, and is useful for testing
API keys. Doesn't require anything other than the token.

```bash
$ TG_TOKEN="<your-token-here>" ./tg-get-me
```

### tg-updates

This script returns the [updates available to the
bot](https://core.telegram.org/bots/api#getting-updates). For this, you'll only
want the `TG_TOKEN`. Run it like this:

```bash
$ TG_TOKEN="<your-token-here>" ./tg-updates
```

This returns a plain JSON string, which can be manipulated with `jq`.

### tg-send

This script is a simple notifier that can send arbitrary text to a chat between
a user and a bot using the `/sendMessage` API.

You will need your chat id (which can be obtained by sending a message
to your bot and using its API key. running `tg-updates`, and looking inside the
message). Once you have this, run like this:

```bash
$ TG_TOKEN="<your-token-here>" ./tg-send "<chat-id>" "Hello World"
```

### tg-send-photo

This script can send images with a caption.

As above, you will need a `TG_TOKEN` and a `TG_CHAT_ID`.
Once you have those, run like this:

```bash
$ TG_TOKEN="<your-token-here>" TG_CHAT_ID="<your-chat-id>" ./tg-send-photo "Caption"
path/to/image.jpeg
```
