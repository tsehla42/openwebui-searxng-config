You can achieve pretty much same results by using community guide in official OpenWebUI docs.

https://docs.openwebui.com/tutorials/web-search/searxng/

But I wanted to save that configuration, so that I wouldn't have to go through all that again.

Run:

`docker compose up -d` to just run it (need to adjust volumes)


`bash compose-update.sh` to update and gracefully restart compose.

Also you can use `compose-update.sh` with cron or alias to streamline updating
