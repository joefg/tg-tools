# tg-tools

Shell helpers for simple [Telegram](https://telegram.org) bots, interfacing with
their [web API](https://core.telegram.org/bots).

## Requirements

* `sh`
* [curl](https://curl.se/docs/manpage.html)

## Installation

These are intended to be small and simple enough to just copy/paste into
wherever required, so there's no complicated install step.

However, if you want to install them to a machine (or add them to a container),
you can use the provided `Makefile` to `make install`, which copies them to
your `~/.local/bin/` folder.

For development purposes, there is a `make link` command, which symlinks these
scripts to your `~/.local/bin/` folder. This isn't to be recommended for
container use.

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

As above, you will need a `TG_TOKEN` and a chat ID.
Once you have those, run like this:

```bash
$ TG_TOKEN="<your-token-here>" ./tg-send-photo "<chat-id>" "Caption" path/to/image.jpeg
```

### tg-send-audio

This script can send audio files with a caption.

As above, you will need a `TG_TOKEN` and a chat ID.
Once you have those, run like this:

```bash
$ TG_TOKEN="<your-token-here>" ./tg-send-audio "<chat-id>" "Caption" path/to/audio.mp3
```

### tg-send-video

This script can send video files with a caption.

As above, you will need a `TG_TOKEN` and a chat ID.
Once you have those, run like this:

```bash
$ TG_TOKEN="<your-token-here>" ./tg-send-video "<chat-id>" "Caption" path/to/video.mp4
```

### tg-send-document

This script can send documents with a caption.

As above, you will need a `TG_TOKEN` and a chat ID.
Once you have those, run like this:

```bash
$ TG_TOKEN="<your-token-here>" ./tg-send-document "<chat-id>" "Caption" path/to/document.pdf
```

## Advanced usage

### Adding tg-tools to a Docker image

You could do this by adding this repository as a [git
submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules), pinning it to a
specific commit or tag. Once you have this, inside your Dockerfile, you can
install `tg-tools` by adding a `cd tg-tools; make install` step in your
Dockerfile, which should enable the use of any script in this repository
anywhere in your container.

### Using tg-tools as a CI alerting system

Add your `TG_TOKEN` to your CI runner's environment system, then as part of the
CI job, run `tg-message` with a summary of the CI job to a channel or a group.
