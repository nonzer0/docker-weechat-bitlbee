# WeeChat and BitlBee in Docker

This repo contains instructions on how to build a docker image that will run
[BitlBee](http://www.bitlbee.org/) and [WeeChat](http://www.weechat.org/).

## Docker registry

This image is available on the [Docker registry](https://index.docker.io/) as
[nate/weechat-bitlbee](https://index.docker.io/u/nate/weechat-bitlbee/):

```
$ docker pull nonzer0/weechat-bitlbee
```

## Running

This will run with a temporary home directory, so all BitlBee and WeeChat
configuration and logs will be lost when you exit WeeChat:

```
$ docker run --rm -i -t nonzer0/weechat-bitlbee
```

You can specify a host volume and that will be used for BitlBee users as well
as the home directory for WeeChat.  This means configuration and logs will go
into that directory and will persist across container runs:

```
$ docker run --rm -i -t -v /host/path:/weechat nonzer0/weechat-bitlbee
```

Finally, if you specify a USER environment variable, the user inside the
container will use that name instead of `weechat`:

```
$ docker run --rm -i -t -v /host/path:/weechat -e USER=bob nonzer0/weechat-bitlbee
```

### Using without bitlbee

If you want to just use weechat and not bitlbee, just set the IRC_SERVER
environment variable and bitlbee will not be started:

```
$ docker run --rm -i -t -v /host/path:/weechat -e IRC_SERVER=chat.freenode.net -e USER=bob nonzer0/weechat-bitlbee
```

### Prevent default connection

By default, the run.sh script will connect to either localhost or the
`$IRC_SERVER` variable.  If your weechat configuration does connections on its
own, you can prevent this from happening by setting the `$NO_AUTO_CONNECT`
environment variable.

```
$ docker run --rm -i -t -v /host/path:/weechat -e NO_AUTO_CONNECT=1 nonzer0/weechat-bitlbee
```

# License

Copyright © 2014 Nate Jones

Distributed under the MIT license.
